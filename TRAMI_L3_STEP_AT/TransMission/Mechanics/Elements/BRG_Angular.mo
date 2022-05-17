within TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements;
model BRG_Angular
  //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter String BRG_Friction_Filename;
  constant Real w_Threshold = 0.01;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {60, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {-54, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, -1; -w_Threshold, -1; 0, 0; w_Threshold, 1; 1, 1]) annotation (
    Placement(visible = true, transformation(origin = {-54, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D1(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-14, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs2 annotation (
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Fr annotation (
    Placement(visible = true, transformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D2(fileName = currDir + "/Tables/" + BRG_Friction_Filename, tableName = "tab2", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-14, -16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Fth annotation (
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation (
    Placement(visible = true, transformation(origin = {10, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Support support annotation (
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation (
    Placement(visible = true, transformation(origin = {-14, -46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
    Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs3 annotation (
    Placement(visible = true, transformation(origin = {-28, 80}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(add1.y, product3.u1) annotation (
    Line(points = {{16, 4}, {52, 4}, {52, 4}, {52, 4}}, color = {0, 255, 0}));
  connect(abs2.y, combiTable2D2.u2) annotation (
    Line(points = {{-74, 80}, {-38, 80}, {-38, 70}, {-32, 70}, {-32, -20}, {-22, -20}, {-22, -20}}, color = {0, 255, 0}));
  connect(abs3.y, combiTable2D2.u1) annotation (
    Line(points = {{-28, 74}, {-28, -12}, {-21, -12}}, color = {0, 255, 0}));
  connect(Fr, abs3.u) annotation (
    Line(points = {{-20, 120}, {-20, 120}, {-20, 94}, {-28, 94}, {-28, 88}, {-28, 88}}, color = {0, 255, 0}));
  connect(relSpeedSensor1.w_rel, abs11.u) annotation (
    Line(points = {{-100, -33}, {-100, -28}, {-80, -28}, {-80, -46}, {-22, -46}}, color = {0, 255, 0}));
  connect(relSpeedSensor1.w_rel, gain1.u) annotation (
    Line(points = {{-100, -33}, {-100, 0}, {-86, 0}}, color = {0, 255, 0}));
  connect(combiTable2D2.y, add1.u2) annotation (
    Line(points = {{-7, -16}, {-2, -16}, {-2, 0}, {2, 0}}, color = {0, 255, 0}));
  connect(nu_oil_m2ps, combiTable2D1.u1) annotation (
    Line(points = {{-120, -60}, {-36, -60}, {-36, 12}, {-21, 12}}, color = {0, 255, 0}));
  connect(abs1.y, combiTable2D1.u2) annotation (
    Line(points = {{-48, 4}, {-21, 4}}, color = {0, 255, 0}));
  connect(combiTable2D1.y, add1.u1) annotation (
    Line(points = {{-7, 8}, {2, 8}}, color = {0, 255, 0}));
  connect(gain1.y, combiTable1Ds2.u) annotation (
    Line(points = {{-72, 0}, {-66, 0}, {-66, -30}, {-62, -30}, {-62, -30}}, color = {0, 255, 0}));
  connect(gain1.y, abs1.u) annotation (
    Line(points = {{-72, 0}, {-66, 0}, {-66, 4}, {-62, 4}, {-62, 4}}, color = {0, 255, 0}));
  connect(flange_a, flange_b) annotation (
    Line(points = {{-120, 0}, {-110, 0}, {-110, 40}, {94, 40}, {94, 0}, {100, 0}}));
  connect(torque1.support, support) annotation (
    Line(points = {{80, -6}, {80, -6}, {80, -86}, {0, -86}, {0, -100}, {0, -100}}));
  connect(Fth, abs2.u) annotation (
    Line(points = {{-120, 80}, {-88, 80}, {-88, 80}, {-88, 80}}, color = {0, 255, 0}));
  connect(product3.u2, combiTable1Ds2.y[1]) annotation (
    Line(points = {{52, -4}, {48, -4}, {48, -30}, {-48, -30}, {-48, -30}}, color = {0, 255, 0}));
  connect(product3.y, torque1.tau) annotation (
    Line(points = {{67, 0}, {73, 0}}, color = {0, 255, 0}));
  connect(torque1.flange, flange_b) annotation (
    Line(points = {{86, 0}, {100, 0}}));
  connect(add1.y, product2.u1) annotation (
    Line(points = {{16, 4}, {32, 4}, {32, -66}, {52, -66}, {52, -66}}, color = {0, 255, 0}));
  connect(abs11.y, product2.u2) annotation (
    Line(points = {{-8, -46}, {20, -46}, {20, -74}, {52, -74}, {52, -74}}, color = {0, 255, 0}));
  connect(product2.y, PHI_W) annotation (
    Line(points = {{66, -70}, {90, -70}, {90, -80}, {110, -80}, {110, -80}}, color = {191, 0, 0}));
  connect(relSpeedSensor1.flange_b, support) annotation (
    Line(points = {{-94, -40}, {-86, -40}, {-86, -56}, {0, -56}, {0, -100}}));
  connect(relSpeedSensor1.flange_a, flange_a) annotation (
    Line(points = {{-106, -40}, {-110, -40}, {-110, 0}, {-120, 0}}));
  annotation (
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 14}, {100, -14}}), Rectangle(origin = {-1, 42}, extent = {{-35, 42}, {35, -28}}), Rectangle(origin = {-1, -42}, extent = {{-35, 28}, {35, -42}}), Rectangle(origin = {-1, 23}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-35, -9}, {35, 11}}), Rectangle(origin = {-1, 75}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-35, -13}, {35, 9}}), Rectangle(origin = {-1, -23}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-35, -11}, {35, 9}}), Rectangle(origin = {-1, -73}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-35, -11}, {35, 11}}), Ellipse(origin = {0, -48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Ellipse(origin = {0, 48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Text(origin = {25, 138}, extent = {{-25, 12}, {35, -18}}, textString = "Fr"), Text(origin = {-135, 128}, extent = {{-25, 12}, {35, -18}}, textString = "Fth"), Text(origin = {-135, -22}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end BRG_Angular;
