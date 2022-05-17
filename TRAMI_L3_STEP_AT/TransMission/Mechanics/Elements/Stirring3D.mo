within TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements;
model Stirring3D
  //          constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter String Stirring_Resistance_Filename = Stirring_Resistance_Filename;
  parameter Real Oil_Viscosity_Breakpoint[:];
  constant Real w_Threshold = 0.01;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
    Placement(visible = true, transformation(origin = {72, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation (
    Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {66, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {-32, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D1(filename = Stirring_Resistance_Filename, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {2, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds2(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
    Placement(visible = true, transformation(origin = {-2, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {52, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
    Placement(visible = true, transformation(origin = {-48, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation (
    Placement(visible = true, transformation(origin = {-2, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-32, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-58, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(combiTable3D1.y, product3.u1) annotation (
    Line(points = {{8, 4}, {44, 4}, {44, 4}, {44, 4}}, color = {0, 255, 0}));
  connect(combiTable1Ds2.u, relSpeedSensor1.w_rel) annotation (
    Line(points = {{-10, -30}, {-48, -30}, {-48, 34}, {-48, 34}}, color = {0, 255, 0}));
  connect(gain2.y, abs1.u) annotation (
    Line(points = {{-52, 0}, {-40, 0}, {-40, 0}, {-40, 0}}, color = {0, 255, 0}));
  connect(speedSensor1.w, gain2.u) annotation (
    Line(points = {{-72, 0}, {-66, 0}, {-66, 0}, {-66, 0}}, color = {0, 255, 0}));
  connect(gain1.y, combiTable3D1.u1) annotation (
    Line(points = {{-26, 20}, {-22, 20}, {-22, 4}, {-6, 4}, {-6, 4}}, color = {0, 255, 0}));
  connect(relSpeedSensor1.w_rel, gain1.u) annotation (
    Line(points = {{-48, 33.4}, {-48, 33.4}, {-48, 19.4}, {-40, 19.4}, {-40, 19.4}}, color = {0, 255, 0}));
  connect(relSpeedSensor1.w_rel, abs11.u) annotation (
    Line(points = {{-48, 33.4}, {-48, 33.4}, {-48, -70.6}, {-10, -70.6}, {-10, -70.6}}, color = {0, 255, 0}));
  connect(flange_a, relSpeedSensor1.flange_a) annotation (
    Line(points = {{-100, 0}, {-90, 0}, {-90, 40}, {-54, 40}}));
  connect(relSpeedSensor1.flange_b, flange_b) annotation (
    Line(points = {{-42, 40}, {90, 40}, {90, 0}, {100, 0}}));
  connect(product3.u2, combiTable1Ds2.y[1]) annotation (
    Line(points = {{44.8, -3.6}, {39.8, -3.6}, {39.8, -29.6}, {4.8, -29.6}}, color = {0, 255, 0}));
  connect(product3.y, torque1.tau) annotation (
    Line(points = {{59, 0}, {64.6, 0}}, color = {0, 255, 0}));
  connect(nu_oil_m2ps, combiTable3D1.u2) annotation (
    Line(points = {{-120, 80}, {-18, 80}, {-18, -2}, {-5, -2}, {-5, -1}}, color = {0, 255, 0}));
  connect(abs1.y, combiTable3D1.u) annotation (
    Line(points = {{-25.4, 0}, {-15.4, 0}, {-15.4, 8}, {-5.4, 8}, {-5.4, 8}}, color = {0, 255, 0}));
  connect(torque1.support, flange_a) annotation (
    Line(points = {{72, -6}, {72, -12}, {-90, -12}, {-90, 0}, {-100, 0}}));
  connect(speedSensor1.flange, flange_a) annotation (
    Line(points = {{-84, 0}, {-100, 0}}));
  connect(torque1.flange, flange_b) annotation (
    Line(points = {{78, 0}, {100, 0}}));
  connect(product2.u2, abs11.y) annotation (
    Line(points = {{58, -84}, {20, -84}, {20, -70}, {4, -70}, {4, -70}}, color = {0, 255, 0}));
  connect(combiTable3D1.y, product2.u1) annotation (
    Line(points = {{8, 4}, {30, 4}, {30, -76}, {58, -76}, {58, -76}}, color = {0, 255, 0}));
  connect(product2.y, PHI_W) annotation (
    Line(points = {{72, -80}, {104, -80}, {104, -80}, {110, -80}}, color = {191, 0, 0}));
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {-50, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Rectangle(origin = {50, 0}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Line(origin = {95, 0}, points = {{-25, 0}, {5, 0}}), Line(origin = {-0.43868, 60.3825}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-0.31048, 20.3504}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-0.43868, -19.6175}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-0.43868, -59.6175}, points = {{-20, -20}, {20, 20}, {20, 20}}), Line(origin = {-10.4387, 90.3825}, points = {{-10, -10}, {10, 10}}), Line(origin = {9.5613, -89.6175}, points = {{-10, -10}, {10, 10}, {10, 10}}), Text(origin = {-135, 118}, extent = {{-65, 12}, {35, -18}}, textString = "nu_oil_m2ps"), Line(origin = {-80, 0}, points = {{-20, 0}, {10, 0}}), Text(origin = {0, -140}, lineColor = {0, 0, 255}, extent = {{-120, 30}, {120, -30}}, textString = "%name")}),
    Diagram,
    __OpenModelica_commandLineOptions = "");
end Stirring3D;
