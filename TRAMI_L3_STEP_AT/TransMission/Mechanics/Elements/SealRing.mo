within TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements;
model SealRing
  //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter String SealRing_friction_filename = SealRing_friction_filename;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
    Placement(visible = true, transformation(origin = {72, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {60, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D1(fileName = currDir + "/Tables/" + SealRing_friction_filename, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-6, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, -1; -w_Threshold, -1; 0, 0; w_Threshold, 1; 1, 1]) annotation (
    Placement(visible = true, transformation(origin = {-8, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  constant Real w_Threshold = 0.01;
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {46, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput p_line_Pa[2] annotation (
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-58, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation (
    Placement(visible = true, transformation(origin = {-34, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
    Placement(visible = true, transformation(origin = {-70, -80}, extent = {{6, -6}, {-6, 6}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1 / 1000) annotation (
    Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.Subtruct subtruct annotation (
    Placement(visible = true, transformation(origin = {-66, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(combiTable2D1.y, product3.u1) annotation (
    Line(points = {{1, 4}, {38, 4}}, color = {0, 255, 0}));
  connect(product3.y, torque1.tau) annotation (
    Line(points = {{52.6, 0}, {64.6, 0}}, color = {0, 255, 0}));
  connect(product3.u2, combiTable1Ds2.y[1]) annotation (
    Line(points = {{38.8, -3.6}, {33.8, -3.6}, {33.8, -29.6}, {-1.2, -29.6}}, color = {0, 255, 0}));
  connect(torque1.flange, flange_b) annotation (
    Line(points = {{78, 0}, {100, 0}}));
  connect(flange_a, flange_b) annotation (
    Line(points = {{-100, 0}, {-90, 0}, {-90, 40}, {94, 40}, {94, 0}, {100, 0}}));
  connect(abs11.y, product2.u2) annotation (
    Line(points = {{-28, -70}, {36, -70}, {36, -84}, {52, -84}, {52, -84}}, color = {0, 255, 0}));
  connect(combiTable2D1.y, product2.u1) annotation (
    Line(points = {{1, 4}, {20, 4}, {20, -60}, {46, -60}, {46, -76}, {52, -76}}, color = {0, 255, 0}));
  connect(torque1.support, support) annotation (
    Line(points = {{72, -6}, {72, -6}, {72, -100}, {0, -100}, {0, -100}}));
  connect(relSpeedSensor.w_rel, gain1.u) annotation (
    Line(points = {{-70, -73}, {-70, 8}, {-65, 8}}, color = {0, 255, 0}));
  connect(relSpeedSensor.w_rel, combiTable1Ds2.u) annotation (
    Line(points = {{-70, -73}, {-70, -30}, {-16, -30}}, color = {0, 255, 0}));
  connect(relSpeedSensor.w_rel, abs11.u) annotation (
    Line(points = {{-70, -73}, {-70, -70}, {-42, -70}}, color = {0, 255, 0}));
  connect(product2.y, PHI_W) annotation (
    Line(points = {{66, -80}, {104, -80}, {104, -80}, {110, -80}}, color = {191, 0, 0}));
  connect(gain2.y, combiTable2D1.u2) annotation (
    Line(points = {{-33, 80}, {-20, 80}, {-20, 0}, {-13, 0}}, color = {0, 255, 0}));
  connect(relSpeedSensor.flange_a, flange_a) annotation (
    Line(points = {{-76, -80}, {-90, -80}, {-90, 0}, {-100, 0}}));
  connect(relSpeedSensor.flange_b, support) annotation (
    Line(points = {{-64, -80}, {0, -80}, {0, -100}, {0, -100}}));
  connect(gain1.y, combiTable2D1.u1) annotation (
    Line(points = {{-52, 8}, {-14, 8}, {-14, 8}, {-14, 8}}, color = {0, 255, 0}));
  connect(p_line_Pa[1], subtruct.u1) annotation (
    Line(points = {{-120, 80}, {-80, 80}, {-80, 84}, {-74, 84}, {-74, 84}}, color = {0, 255, 0}));
  connect(p_line_Pa[2], subtruct.u2) annotation (
    Line(points = {{-120, 80}, {-80, 80}, {-80, 76}, {-74, 76}, {-74, 76}}, color = {0, 255, 0}));
  connect(subtruct.y, gain2.u) annotation (
    Line(points = {{-60, 80}, {-47, 80}}, color = {0, 255, 0}));
  annotation (
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 14}, {100, -14}}), Polygon(origin = {0, 48}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, points = {{-50, -32}, {50, -32}, {20, 32}, {-20, 32}, {-50, -32}}), Polygon(origin = {0, -48}, rotation = 180, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, points = {{-50, -32}, {50, -32}, {20, 32}, {-20, 32}, {-50, -32}}), Text(origin = {-135, 108}, extent = {{-65, 12}, {35, -18}}, textString = "Oil_Pressure"), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
    Diagram,
    __OpenModelica_commandLineOptions = "");
end SealRing;
