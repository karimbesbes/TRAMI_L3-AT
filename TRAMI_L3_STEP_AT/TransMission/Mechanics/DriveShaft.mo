within TRAMI_L3_STEP_AT.TransMission.Mechanics;
model DriveShaft
  parameter Modelica.SIunits.Inertia Jds = 0.01;
  parameter Modelica.SIunits.RotationalSpringConstant c = 1e4;
  parameter Modelica.SIunits.RotationalDampingConstant d = 1e3;
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jds) annotation (
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_DF_Nm annotation (
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_DF_radps annotation (
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput trq_DS_PNT_out_Nm annotation (
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_DS_PNT_out_radps annotation (
    Placement(visible = true, transformation(origin = {120, 30}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, 40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c = c, d = d, phi_rel(fixed = true, start = 0), w_rel(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor1(use_a = false, use_w = true) annotation (
    Placement(visible = true, transformation(origin = {-62, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorqueAdaptor1(use_a = false, use_w = false) annotation (
    Placement(visible = true, transformation(origin = {52, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {80, 30}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
    Placement(visible = true, transformation(origin = {-84, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = -1) annotation (
    Placement(visible = true, transformation(origin = {82, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(gain2.y, trq_DS_PNT_out_Nm) annotation (
    Line(points = {{88, -30}, {102, -30}, {102, -30}, {110, -30}}, color = {0, 0, 127}));
  connect(angleToTorqueAdaptor1.tau, gain2.u) annotation (
    Line(points = {{56, -8}, {66, -8}, {66, -30}, {74, -30}, {74, -30}}, color = {0, 0, 127}));
  connect(gain1.y, torqueToAngleAdaptor1.tau) annotation (
    Line(points = {{-78, -30}, {-72, -30}, {-72, -8}, {-66, -8}, {-66, -8}}, color = {0, 0, 127}));
  connect(trq_TM_PNT_DF_Nm, gain1.u) annotation (
    Line(points = {{-120, -30}, {-92, -30}, {-92, -30}, {-92, -30}}, color = {0, 0, 127}));
  connect(angleToTorqueAdaptor1.phi, integrator1.y) annotation (
    Line(points = {{56, 8}, {66, 8}, {66, 30}, {73, 30}}, color = {0, 0, 127}));
  connect(integrator1.u, w_DS_PNT_out_radps) annotation (
    Line(points = {{87, 30}, {120, 30}}, color = {0, 0, 127}));
  connect(springDamper1.flange_b, angleToTorqueAdaptor1.flange) annotation (
    Line(points = {{30, 0}, {50, 0}, {50, 0}, {50, 0}}));
  connect(w_TM_PNT_DF_radps, torqueToAngleAdaptor1.w) annotation (
    Line(points = {{-110, 30}, {-80, 30}, {-80, 4}, {-66, 4}, {-66, 4}}, color = {0, 0, 127}));
  connect(inertia1.flange_a, torqueToAngleAdaptor1.flange) annotation (
    Line(points = {{-40, 0}, {-60, 0}, {-60, 0}, {-60, 0}}));
  connect(springDamper1.flange_a, inertia1.flange_b) annotation (
    Line(points = {{10, 0}, {-20, 0}}));
  annotation (
    Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -127}, lineColor = {0, 0, 255}, extent = {{-120, 17}, {120, -33}}, textString = "%name"), Line(points = {{-100, 0}, {-59, 0}}), Line(points = {{59, 0}, {100, 0}}), Ellipse(origin = {-40, 0}, lineThickness = 0.75, extent = {{-24, 24}, {24, -24}}, startAngle = 90, endAngle = 270), Ellipse(origin = {-40, 0}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-24, 24}, {24, -24}}, endAngle = 360), Ellipse(origin = {40, 0}, lineThickness = 0.75, extent = {{-24, 24}, {24, -24}}, startAngle = -90, endAngle = 90), Ellipse(origin = {40, 0}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-24, 24}, {24, -24}}, endAngle = 360), Line(points = {{-40, 0}, {40, 0}}), Ellipse(origin = {-40, 0}, fillColor = {161, 161, 161}, fillPattern = FillPattern.Solid, extent = {{-6, 6}, {6, -6}}, endAngle = 360), Ellipse(origin = {40, 0}, fillColor = {161, 161, 161}, fillPattern = FillPattern.Solid, extent = {{-6, 6}, {6, -6}}, endAngle = 360), Text(origin = {-127, -1}, extent = {{-27, 23}, {27, -23}}, textString = "T"), Text(origin = {-123, 69}, extent = {{-27, 23}, {27, -23}}, textString = "w"), Text(origin = {121, 79}, extent = {{-27, 23}, {27, -23}}, textString = "w"), Text(origin = {117, -11}, extent = {{-27, 23}, {27, -23}}, textString = "T")}, coordinateSystem(initialScale = 0.1)));
end DriveShaft;
