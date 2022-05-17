within TRAMI_L3_STEP_AT.TransMission.Mechanics;
model Clutch_AT_Gear
  import SI = Modelica.SIunits;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a "Flange of left shaft" annotation (
    Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b "Flange of right shaft" annotation (
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Modelica.Blocks.Interfaces.RealInput u(unit = "N.m") "Torque driving the two flanges (a positive value accelerates the flange)" annotation (
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(extent = {{-20, 100}, {20, 140}}, rotation = 270)));
  //
  Integer mode(start = Free, fixed = true);
  parameter SI.RotationalSpringConstant c(final min = 0, start = 1.0e5) "Spring constant";
  parameter SI.RotationalDampingConstant d(final min = 0, start = 0) "Damping constant";
  parameter Real hysteresis_rate = 0.95;
  parameter SI.AngularVelocity w_rel_threshold = 0.01;
  //
  /* Relative state between flange_a and flange_b */

  record RelativeState
    SI.Angle phi;
    SI.AngularVelocity w;
    SI.AngularAcceleration a;
  end RelativeState;

  /* State when the clutch is locked */

  record StateWhenLocked
    SI.Angle rel_phi;
    SI.AngularVelocity rel_w;
    SI.Torque tau;
  end StateWhenLocked;

  /* State when the clutch is released */

  record StateWhenReleased
    SI.Torque tau;
  end StateWhenReleased;

  //
  //
  RelativeState relativeState(phi, w(start = 0, stateSelect = stateSelect, nominal = if phi_nominal >= Modelica.Constants.eps then phi_nominal else 1) "Relative angular velocity (= der(phi_rel))", a(start = 0, fixed = false));
  StateWhenLocked stateWhenLocked(rel_phi(start = 0, fixed = true), rel_w(start = 0, fixed = true), tau(start = 0, fixed = true) "Torque during the clutch locked");
  StateWhenReleased stateWhenReleased(tau "Torque during the clutch locked");
  /*(start = 0, fixed = true)*/
  //
  SI.Torque tau_whenlocked(start = 0, fixed = false) "Torque when the clutch locked";
  SI.Torque tau_c "Spring torque";
  SI.Torque tau_d "Damping torque";
  SI.Torque preload;
  SI.Angle phi_preload;
protected
  parameter Integer Free = 0;
  parameter Integer Sliding = 1;
  parameter Integer Locked = 2;
  parameter StateSelect stateSelect = StateSelect.prefer "Priority to use phi_rel and w_rel as states";
  parameter SI.Angle phi_nominal(displayUnit = "rad", min = 0.0) = 1e-4 "Nominal value of phi_rel (used for scaling)" annotation (
    Dialog(tab = "Advanced"));
equation
  relativeState.phi = flange_a.phi - flange_b.phi;
  relativeState.w = der(relativeState.phi);
  relativeState.a = der(relativeState.w);
  //
  mode = if u < 1e-4 then Free elseif pre(mode) == Locked and u < abs(pre(stateWhenReleased.tau) * hysteresis_rate) then Sliding
   elseif abs(relativeState.w) < w_rel_threshold then Locked
   elseif pre(mode) == Locked then Locked else Sliding;
  //
  when mode == Locked then
    stateWhenLocked.tau = pre(u) * sign(relativeState.w);
    stateWhenLocked.rel_phi = relativeState.phi;
    stateWhenLocked.rel_w = relativeState.w;
  end when;
  // Memorize the values of state when the clutch is released
  if mode == Locked and u < abs(flange_a.tau) then
    stateWhenReleased.tau = flange_a.tau;
  else
    stateWhenReleased.tau = 0;
  end if;
  preload = stateWhenLocked.tau - stateWhenLocked.rel_w * d;
  //　ロック時のトルク負荷から、結合時の粘性抵抗を引いたトルク
  phi_preload = preload / c;
  //　上のトルクをばねレートで割った初期仮想ねじれ角
  tau_c = c * (relativeState.phi - stateWhenLocked.rel_phi);
  tau_d = d * relativeState.w;
  // モードごとのトルク計算
  if mode == Free or mode == Sliding then
    flange_a.tau = u * sign(relativeState.w);
    flange_b.tau = -u * sign(relativeState.w);
  else
    flange_a.tau = tau_whenlocked;
    flange_b.tau = -tau_whenlocked;
  end if;
  //
  tau_whenlocked = (relativeState.phi - stateWhenLocked.rel_phi + phi_preload) * c + relativeState.w * d;
  lossPower = abs(flange_a.tau * relativeState.w);
end Clutch_AT_Gear;
