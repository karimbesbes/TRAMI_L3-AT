within TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements;
model BRG_ThrustNeedle
  //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter String BRG_Friction_Filename;
  constant Real w_Threshold = 0.01;
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {66, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {-50, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D1(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-14, 26}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Fr annotation (
    Placement(visible = true, transformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D2(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab2", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-14, -2}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Fth annotation (
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation (
    Placement(visible = true, transformation(origin = {10, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-74, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation (
    Placement(visible = true, transformation(origin = {-54, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs3 annotation (
    Placement(visible = true, transformation(origin = {-28, 80}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(combiTable1Ds2.u, relSpeedSensor1.w_rel) annotation (
    Line(points = {{-58, -30}, {-90, -30}, {-90, 34}, {-90, 34}, {-90, 34}}, color = {0, 255, 0}));
  connect(add1.y, product3.u1) annotation (
    Line(points = {{16, 4}, {52, 4}, {52, 4}, {52, 4}}, color = {0, 255, 0}));
  connect(Fth, combiTable2D2.u2) annotation (
    Line(points = {{-120, 80}, {-38, 80}, {-38, 70}, {-32, 70}, {-32, -6}, {-22, -6}, {-22, -6}}, color = {0, 255, 0}));
  connect(abs3.y, combiTable2D2.u1) annotation (
    Line(points = {{-28, 74}, {-28, 74}, {-28, 2}, {-22, 2}, {-22, 2}}, color = {0, 255, 0}));
  connect(Fr, abs3.u) annotation (
    Line(points = {{-20, 120}, {-20, 120}, {-20, 94}, {-28, 94}, {-28, 88}, {-28, 88}}, color = {0, 255, 0}));
  connect(gain1.y, abs1.u) annotation (
    Line(points = {{-68, 4}, {-58, 4}, {-58, 4}, {-58, 4}}, color = {0, 255, 0}));
  connect(relSpeedSensor1.w_rel, gain1.u) annotation (
    Line(points = {{-90, 34}, {-90, 34}, {-90, 4}, {-82, 4}, {-82, 4}}, color = {0, 255, 0}));
  connect(abs11.u, relSpeedSensor1.w_rel) annotation (
    Line(points = {{-62, -70}, {-90, -70}, {-90, 33}}, color = {0, 255, 0}));
  connect(flange_a, relSpeedSensor1.flange_a) annotation (
    Line(points = {{-110, 0}, {-100, 0}, {-100, 40}, {-96, 40}}));
  connect(flange_b, relSpeedSensor1.flange_b) annotation (
    Line(points = {{100, 0}, {90, 0}, {90, 40}, {-84, 40}}));
  connect(torque1.support, flange_a) annotation (
    Line(points = {{80, -6}, {80, -40}, {-100, -40}, {-100, 0}, {-110, 0}}));
  connect(product3.u2, combiTable1Ds2.y[1]) annotation (
    Line(points = {{52, -4}, {48, -4}, {48, -30}, {-43, -30}}, color = {0, 255, 0}));
  connect(abs1.y, combiTable2D1.u2) annotation (
    Line(points = {{-43, 4}, {-40, 4}, {-40, 22}, {-21, 22}}, color = {0, 255, 0}));
  connect(combiTable2D2.y, add1.u2) annotation (
    Line(points = {{-8, -2}, {-2, -2}, {-2, 0}, {2, 0}, {2, 0}}, color = {0, 255, 0}));
  connect(combiTable2D1.y, add1.u1) annotation (
    Line(points = {{-8, 26}, {-2, 26}, {-2, 8}, {2, 8}, {2, 8}}, color = {0, 255, 0}));
  connect(product3.y, torque1.tau) annotation (
    Line(points = {{67, 0}, {73, 0}}, color = {0, 255, 0}));
  connect(torque1.flange, flange_b) annotation (
    Line(points = {{86, 0}, {100, 0}}));
  connect(nu_oil_m2ps, combiTable2D1.u1) annotation (
    Line(points = {{-120, -60}, {-36, -60}, {-36, 30}, {-21, 30}}, color = {0, 255, 0}));
  connect(product2.u2, abs11.y) annotation (
    Line(points = {{58, -84}, {20, -84}, {20, -70}, {-48, -70}, {-48, -70}}, color = {0, 255, 0}));
  connect(product2.u1, add1.y) annotation (
    Line(points = {{58, -76}, {30, -76}, {30, 4}, {16, 4}, {16, 4}}, color = {0, 255, 0}));
  connect(PHI_W, product2.y) annotation (
    Line(points = {{110, -80}, {74, -80}, {74, -80}, {72, -80}}, color = {191, 0, 0}));
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Polygon(origin = {-12, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, points = {{20, 100}, {-19, 100}, {-25, 94}, {-25, -94}, {-19, -100}, {20, -100}, {20, 100}}), Rectangle(origin = {8, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{25, 80}, {-25, -80}}), Line(origin = {67, 0}, points = {{33, 0}, {-33, 0}}), Text(origin = {25, 138}, extent = {{-25, 12}, {35, -18}}, textString = "Fr"), Text(origin = {-135, 128}, extent = {{-25, 12}, {35, -18}}, textString = "Fth"), Text(origin = {-135, -22}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Line(origin = {-69, 0}, points = {{31, 0}, {-31, 0}}), Text(origin = {-75, -132}, lineColor = {0, 0, 255}, extent = {{-25, 12}, {175, -28}}, textString = "%name")}));
end BRG_ThrustNeedle;
