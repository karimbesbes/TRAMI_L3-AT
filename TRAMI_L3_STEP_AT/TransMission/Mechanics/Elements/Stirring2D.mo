within TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements;
model Stirring2D
  //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter String Stirring_Resistance_Filename;
  constant Real w_Threshold = 0.01;
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
    Placement(visible = true, transformation(origin = {72, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {62, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {-20, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D1(fileName = currDir + "/Tables/" + Stirring_Resistance_Filename, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {12, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {46, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-48, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation (
    Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
    Placement(visible = true, transformation(origin = {-72, 30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(combiTable2D1.y, product3.u1) annotation (
    Line(points = {{19, 4}, {38, 4}}, color = {0, 255, 0}));
  connect(abs1.u, gain1.y) annotation (
    Line(points = {{-27, 8}, {-36, 8}, {-36, 0}, {-41, 0}}, color = {0, 255, 0}));
  connect(abs1.y, combiTable2D1.u1) annotation (
    Line(points = {{-13, 8}, {5, 8}}, color = {0, 255, 0}));
  connect(nu_oil_m2ps, combiTable2D1.u2) annotation (
    Line(points = {{-120, 80}, {0, 80}, {0, 0}, {5, 0}}, color = {0, 255, 0}));
  connect(product3.y, torque1.tau) annotation (
    Line(points = {{52.6, 0}, {64.6, 0}}, color = {0, 255, 0}));
  connect(product3.u2, combiTable1Ds2.y[1]) annotation (
    Line(points = {{38.8, -3.6}, {33.8, -3.6}, {33.8, -30}, {17, -30}}, color = {0, 255, 0}));
  connect(torque1.flange, flange_b) annotation (
    Line(points = {{78, 0}, {100, 0}}));
  connect(combiTable2D1.y, product2.u1) annotation (
    Line(points = {{19, 4}, {26, 4}, {26, -76}, {55, -76}}, color = {0, 255, 0}));
  connect(abs11.y, product2.u2) annotation (
    Line(points = {{-13, -70}, {16, -70}, {16, -84}, {55, -84}}, color = {0, 255, 0}));
  connect(product2.y, PHI_W) annotation (
    Line(points = {{68, -80}, {110, -80}}, color = {191, 0, 0}));
  connect(torque1.support, support) annotation (
    Line(points = {{72, -6}, {72, -6}, {72, -16}, {-90, -16}, {-90, 0}, {-100, 0}, {-100, 0}}));
  connect(flange_b, relSpeedSensor.flange_b) annotation (
    Line(points = {{100, 0}, {90, 0}, {90, 30}, {-66, 30}, {-66, 30}}));
  connect(relSpeedSensor.w_rel, gain1.u) annotation (
    Line(points = {{-72, 24}, {-72, 24}, {-72, 0}, {-56, 0}, {-56, 0}}, color = {0, 255, 0}));
  connect(relSpeedSensor.w_rel, combiTable1Ds2.u) annotation (
    Line(points = {{-72, 24}, {-72, 24}, {-72, -30}, {2, -30}, {2, -30}}, color = {0, 255, 0}));
  connect(relSpeedSensor.w_rel, abs11.u) annotation (
    Line(points = {{-72, 24}, {-72, 24}, {-72, -70}, {-28, -70}, {-28, -70}}, color = {0, 255, 0}));
  connect(relSpeedSensor.flange_a, support) annotation (
    Line(points = {{-78, 30}, {-90, 30}, {-90, 0}, {-100, 0}}));
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {-40, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Rectangle(origin = {60, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Line(origin = {95, 0}, points = {{-15, 0}, {5, 0}}), Line(origin = {9.56132, 60.3825}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {9.68952, 20.3504}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {9.56132, -19.6175}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {9.56132, -59.6175}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-0.438684, 90.3825}, points = {{-10, -10}, {10, 10}}), Line(origin = {19.5613, -89.6175}, points = {{-10, -10}, {10, 10}, {10, 10}}), Text(origin = {-135, 118}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}),
    Diagram,
    __OpenModelica_commandLineOptions = "");
end Stirring2D;
