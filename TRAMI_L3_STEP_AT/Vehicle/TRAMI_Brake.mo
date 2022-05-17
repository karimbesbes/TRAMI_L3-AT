within TRAMI_L3_STEP_AT.Vehicle;
model TRAMI_Brake
  import SI = Modelica.SIunits;
  extends Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
  SI.Torque tau "Brake friction torque";
  SI.Angle phi_rel "Relative angle between frictional surfaces";
  SI.AngularVelocity w_rel "Relative angular velocity between frictional surfaces";
  //  SI.AngularAcceleration a_rel "Relative angular acceleration between frictional surfaces";
  Modelica.Blocks.Interfaces.RealInput tau_cap annotation (
    Placement(transformation(origin = {0, 110}, extent = {{20, -20}, {-20, 20}}, rotation = 90)));
  parameter Real Coeff = 1e5;
equation
  phi_rel = flange_a.phi - phi_support;
  flange_b.phi = flange_a.phi;
  // Angular velocity and angular acceleration of flanges flange_a and flange_b
  w_rel = der(phi_rel);
  //  a_rel = der(w_rel);
  // Friction torque, normal force and friction torque for w_rel=0
  flange_a.tau + flange_b.tau - tau = 0;
  // Friction torque
  tau = abs(tau_cap) * smooth(0, min(1, max(-1, w_rel * Coeff)));
  annotation (
    Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
end TRAMI_Brake;
