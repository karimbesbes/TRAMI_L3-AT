within TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc;
model Calc_GearLoss
  parameter String Gear_Friction_Filename;
  parameter Real Oil_Viscosity_Breakpoint[:];
  constant Real w_Threshold = 0.01;
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs_GearTorque(generateEvent = false) annotation (
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Gear_Loss annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain radps2rpm(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-78, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs_Gear_rpm annotation (
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation (
    Placement(visible = true, transformation(origin = {68, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D(filename = Gear_Friction_Filename, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Gear_w1 annotation (
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 26}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Gear_Torque annotation (
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Gear_w2 annotation (
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -26}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(Gear_Torque, abs_GearTorque.u) annotation (
    Line(points = {{-120, 60}, {-50, 60}}, color = {0, 0, 127}));
  connect(abs_GearTorque.y, combiTable3D.u) annotation (
    Line(points = {{-31, 60}, {-10, 60}, {-10, 28}, {-2, 28}}, color = {0, 0, 127}));
  connect(abs_Gear_rpm.y, combiTable3D.u1) annotation (
    Line(points = {{-31, 20}, {-2, 20}}, color = {0, 0, 127}));
  connect(nu_oil_m2ps, combiTable3D.u2) annotation (
    Line(points = {{-120, -60}, {-10, -60}, {-10, 12}, {-2, 12}}, color = {0, 0, 127}));
  connect(Gear_w1, radps2rpm.u) annotation (
    Line(points = {{-120, 20}, {-88, 20}}, color = {0, 0, 127}));
  connect(abs_Gear_rpm.u, radps2rpm.y) annotation (
    Line(points = {{-50, 20}, {-69, 20}}, color = {0, 0, 127}));
  connect(combiTable1Ds.y[1], product.u2) annotation (
    Line(points = {{-31, -20}, {40, -20}, {40, -5}, {58, -5}}, color = {0, 0, 127}));
  connect(combiTable3D.y, product.u1) annotation (
    Line(points = {{21, 20}, {40, 20}, {40, 5}, {58, 5}}, color = {0, 0, 127}));
  connect(product.y, Gear_Loss) annotation (
    Line(points = {{77, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(Gear_w2, combiTable1Ds.u) annotation (
    Line(points = {{-120, -20}, {-50, -20}, {-50, -20}, {-50, -20}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-140, 26}, {140, -26}}, textString = "%name"), Text(origin = {0, 10}, extent = {{-100, 40}, {100, -10}}, textString = "Gear"), Text(origin = {0, -40}, extent = {{-100, 40}, {100, -10}}, textString = "Loss")}, coordinateSystem(initialScale = 0.1)),
    uses(Modelica(version = "3.2.3")));
end Calc_GearLoss;
