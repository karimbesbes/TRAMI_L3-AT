within TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements;
model OilSeal
  //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter String OilSeal_friction_filename = OilSeal_friction_filename;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
    Placement(visible = true, transformation(origin = {72, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {54, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {-28, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds1(fileName = currDir + "/Tables/" + OilSeal_friction_filename, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-2, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, -1; -w_Threshold, -1; 0, 0; w_Threshold, 1; 1, 1]) annotation (
    Placement(visible = true, transformation(origin = {-2, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  constant Real w_Threshold = 0.01;
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {46, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-54, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation (
    Placement(visible = true, transformation(origin = {-28, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
    Placement(visible = true, transformation(origin = {-70, -80}, extent = {{6, -6}, {-6, 6}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gain1.y, abs1.u) annotation (
    Line(points = {{-47, 4}, {-36, 4}}, color = {0, 255, 0}));
  connect(combiTable1Ds1.y[1], product3.u1) annotation (
    Line(points = {{4, 4}, {38, 4}, {38, 4}, {38, 4}}, color = {0, 255, 0}));
  connect(product3.u2, combiTable1Ds2.y[1]) annotation (
    Line(points = {{38.8, -3.6}, {33.8, -3.6}, {33.8, -30}, {5, -30}}, color = {0, 255, 0}));
  connect(abs1.y, combiTable1Ds1.u) annotation (
    Line(points = {{-21.4, 4}, {-9.8, 4}}, color = {0, 255, 0}));
  connect(product3.y, torque1.tau) annotation (
    Line(points = {{52.6, 0}, {64.6, 0}}, color = {0, 255, 0}));
  connect(torque1.flange, flange_b) annotation (
    Line(points = {{78, 0}, {100, 0}}));
  connect(flange_a, flange_b) annotation (
    Line(points = {{-100, 0}, {-90, 0}, {-90, 40}, {94, 40}, {94, 0}, {100, 0}}));
  connect(abs11.y, product2.u2) annotation (
    Line(points = {{-22, -70}, {14, -70}, {14, -84}, {47, -84}}, color = {0, 255, 0}));
  connect(combiTable1Ds1.y[1], product2.u1) annotation (
    Line(points = {{4, 4}, {26, 4}, {26, -76}, {47, -76}}, color = {0, 255, 0}));
  connect(product2.y, PHI_W) annotation (
    Line(points = {{61, -80}, {110, -80}}, color = {191, 0, 0}));
  connect(torque1.support, support) annotation (
    Line(points = {{72, -6}, {72, -6}, {72, -100}, {0, -100}, {0, -100}}));
  connect(relSpeedSensor.w_rel, gain1.u) annotation (
    Line(points = {{-70, -73}, {-70, 4}, {-62, 4}}, color = {0, 255, 0}));
  connect(relSpeedSensor.w_rel, combiTable1Ds2.u) annotation (
    Line(points = {{-70, -73}, {-70, -30}, {-10, -30}}, color = {0, 255, 0}));
  connect(relSpeedSensor.w_rel, abs11.u) annotation (
    Line(points = {{-70, -73}, {-70, -70}, {-36, -70}}, color = {0, 255, 0}));
  connect(relSpeedSensor.flange_b, support) annotation (
    Line(points = {{-64, -80}, {0, -80}, {0, -100}, {0, -100}}));
  connect(relSpeedSensor.flange_a, flange_a) annotation (
    Line(points = {{-76, -80}, {-90, -80}, {-90, 0}, {-100, 0}, {-100, 0}}));
  annotation (
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 14}, {100, -14}}), Polygon(origin = {-10, -47}, fillColor = {100, 100, 100}, fillPattern = FillPattern.Solid, points = {{30, 7}, {30, 17}, {30, 17}, {10, 33}, {-10, 17}, {-24, 17}, {-30, 11}, {-30, -27}, {-24, -33}, {20, -33}, {20, -23}, {-20, -23}, {-20, 7}, {30, 7}}), Ellipse(origin = {0, -38}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{10, -10}, {-10, 10}}, endAngle = 360), Polygon(origin = {-10, 47}, fillColor = {100, 100, 100}, fillPattern = FillPattern.Solid, points = {{18, 33}, {-24, 33}, {-30, 27}, {-30, -11}, {-24, -17}, {-10, -17}, {10, -33}, {30, -17}, {30, -7}, {-20, -7}, {-20, 23}, {18, 23}, {18, 33}}), Ellipse(origin = {0, 38}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{10, -10}, {-10, 10}}, endAngle = 360), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end OilSeal;
