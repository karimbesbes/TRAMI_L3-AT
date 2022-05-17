within TRAMI_L3_STEP_AT.Vehicle;
model Flywheel
  parameter Modelica.SIunits.Inertia Jfw = 0.4;
  /*initType = Modelica.Blocks.Types.Init.SteadyState,*/
  Modelica.Mechanics.Rotational.Components.Inertia inertia_FlyWheel(J = Jfw, phi(fixed = true, start = 0), w(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor1 annotation (
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor2(use_a = false, use_w = true) annotation (
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput trq_ENG_PNT_in_Nm annotation (
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_ENG_PNT_radps annotation (
    Placement(visible = true, transformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_FW_radps annotation (
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_FW_Nm annotation (
    Placement(visible = true, transformation(origin = {120, -40}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, -40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
    Placement(visible = true, transformation(origin = {-80, -8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = -1) annotation (
    Placement(visible = true, transformation(origin = {80, -8}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
equation
  connect(gain2.u, trq_TM_PNT_FW_Nm) annotation (
    Line(points = {{88, -8}, {94, -8}, {94, -40}, {120, -40}, {120, -40}}, color = {0, 0, 127}));
  connect(torqueToAngleAdaptor2.tau, gain2.y) annotation (
    Line(points = {{64, -8}, {74, -8}, {74, -8}, {74, -8}}, color = {0, 0, 127}));
  connect(gain1.y, torqueToAngleAdaptor1.tau) annotation (
    Line(points = {{-74, -8}, {-64, -8}, {-64, -8}, {-64, -8}}, color = {0, 0, 127}));
  connect(trq_ENG_PNT_in_Nm, gain1.u) annotation (
    Line(points = {{-120, -40}, {-94, -40}, {-94, -8}, {-88, -8}, {-88, -8}}, color = {0, 0, 127}));
  connect(inertia_FlyWheel.flange_b, torqueToAngleAdaptor2.flange) annotation (
    Line(points = {{10, 0}, {56, 0}}));
  connect(w_TM_PNT_FW_radps, torqueToAngleAdaptor2.w) annotation (
    Line(points = {{110, 40}, {80, 40}, {80, 2}, {61, 2}, {61, 3}}, color = {0, 0, 127}));
  connect(inertia_FlyWheel.flange_a, torqueToAngleAdaptor1.flange) annotation (
    Line(points = {{-10, 0}, {-60, 0}}));
  connect(w_ENG_PNT_radps, torqueToAngleAdaptor1.w) annotation (
    Line(points = {{-110, 40}, {-80, 40}, {-80, 2}, {-65, 2}, {-65, 3}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                   FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(rotation = 90, points = {{0, 50}, {0, -50}}), Rectangle(origin = {2, -1}, fillColor = {163, 163, 163},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-22, 65}, {18, -65}}), Text(origin = {-122, 6}, extent = {{-18, 2}, {22, -28}}, textString = "T"), Text(origin = {-122, 76}, extent = {{-18, 2}, {22, -28}}, textString = "w"), Text(origin = {118, 76}, extent = {{-18, 2}, {22, -28}}, textString = "w"), Text(origin = {118, 6}, extent = {{-18, 2}, {22, -28}}, textString = "T")}),
    uses(Modelica(version = "3.2.3")));
end Flywheel;
