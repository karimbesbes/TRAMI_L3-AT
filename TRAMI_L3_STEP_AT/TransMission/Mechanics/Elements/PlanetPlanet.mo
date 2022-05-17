within TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements;
model PlanetPlanet
//constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter Real gearRatio;
  parameter String Gear_Friction_Filename;
  parameter String Gear_K_Filename;
  parameter Real tanhCoeff = 100;
  parameter Real Oil_Viscosity_Breakpoint[:];
  Modelica.Mechanics.Rotational.Interfaces.Flange_a sun annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b pinion annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b carrier annotation (
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation (
    Placement(visible = true, transformation(origin = {-20, -46}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear Planet_Planet(ratio = gearRatio, useSupport = true) annotation (
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
    Placement(visible = true, transformation(origin = {-77, -73}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (
    Placement(visible = true, transformation(origin = {-44, -4.44089e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
    Placement(visible = true, transformation(origin = {110, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.Calc_GearLoss calc_GearLoss(Gear_Friction_Filename = Gear_Friction_Filename, Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation (
    Placement(visible = true, transformation(origin = {70, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation (
    Placement(visible = true, transformation(origin = {40, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput SunGearKa annotation (
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay unitDelay(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {4, -70}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {-6, 64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D_Ka(fileName = currDir + "/Tables/" + Gear_K_Filename, tableName = "tab3", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {20, 64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.Tanh tanh(Coeff = tanhCoeff) annotation (
    Placement(visible = true, transformation(origin = {20, 46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {54, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay unitDelay1(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {80, 60}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
equation
  connect(sun, torqueSensor.flange_a) annotation (
    Line(points = {{-100, 0}, {-52, 0}}));
  connect(torqueSensor.flange_b, Planet_Planet.flange_a) annotation (
    Line(points = {{-36, 0}, {10, 0}}));
  connect(torque.flange, sun) annotation (
    Line(points = {{-28, -46}, {-90, -46}, {-90, 0}, {-100, 0}}));
  connect(calc_GearLoss.nu_oil_m2ps, nu_oil_m2ps) annotation (
    Line(points = {{-32, -76}, {-62, -76}, {-62, 60}, {-120, 60}}, color = {0, 255, 0}));
  connect(product.y, abs11.u) annotation (
    Line(points = {{47, -84}, {63, -84}}, color = {191, 0, 0}));
  connect(abs11.y, PHI_W) annotation (
    Line(points = {{77, -84}, {110, -84}}, color = {191, 0, 0}));
  connect(Planet_Planet.flange_b, pinion) annotation (
    Line(points = {{30, 0}, {100, 0}}));
  connect(calc_GearLoss.Gear_Loss, unitDelay.u) annotation (
    Line(points = {{-8, -70}, {-2, -70}, {-2, -70}, {0, -70}}, color = {0, 255, 0}));
  connect(product.u1, unitDelay.y) annotation (
    Line(points = {{32, -80}, {20, -80}, {20, -70}, {8, -70}, {8, -70}}, color = {0, 255, 0}));
  connect(Planet_Planet.support, carrier) annotation (
    Line(points = {{20, -10}, {20, -10}, {20, -40}, {100, -40}, {100, -40}}));
  connect(combiTable1D_Ka.y[1], product1.u1) annotation (
    Line(points = {{27, 64}, {47, 64}}, color = {0, 255, 0}));
  connect(tanh.y, product1.u2) annotation (
    Line(points = {{27, 46}, {36, 46}, {36, 56}, {47, 56}}, color = {0, 255, 0}));
  connect(abs1.y, combiTable1D_Ka.u[1]) annotation (
    Line(points = {{1, 64}, {13, 64}}, color = {0, 255, 0}));
  connect(tanh.u, abs1.u) annotation (
    Line(points = {{13, 46}, {-30, 46}, {-30, 64}, {-13, 64}}, color = {0, 255, 0}));
  connect(product1.y, unitDelay1.u) annotation (
    Line(points = {{60, 60}, {74, 60}, {74, 60}, {76, 60}}, color = {0, 255, 0}));
  connect(unitDelay1.y, SunGearKa) annotation (
    Line(points = {{84, 60}, {102, 60}, {102, 60}, {110, 60}}, color = {0, 255, 0}));
  connect(torqueSensor.tau, calc_GearLoss.Gear_Torque) annotation (
    Line(points = {{-50, -9}, {-50, -62}, {-32, -62}}, color = {0, 255, 0}));
  connect(abs1.u, torqueSensor.tau) annotation (
    Line(points = {{-14, 64}, {-30, 64}, {-30, -14}, {-50, -14}, {-50, -9}}, color = {0, 255, 0}));
  connect(relSpeedSensor.flange_b, Planet_Planet.support) annotation (
    Line(points = {{0, -28}, {0, -40}, {20, -40}, {20, -10}}));
  connect(Planet_Planet.flange_a, relSpeedSensor.flange_a) annotation (
    Line(points = {{10, 0}, {0, 0}, {0, -12}}));
  connect(relSpeedSensor.w_rel, product.u2) annotation (
    Line(points = {{-9, -20}, {-40, -20}, {-40, -88}, {32, -88}}, color = {0, 255,0}));
  connect(torque.tau, unitDelay.y) annotation (
    Line(points = {{-10, -46}, {20, -46}, {20, -70}, {8, -70}, {8, -70}, {8, -70}}, color = {0, 255,0}));
  connect(speedSensor.flange, sun) annotation (
    Line(points = {{-84, -73}, {-90, -73}, {-90, 0}, {-100, 0}}));
  connect(calc_GearLoss.Gear_w1, relSpeedSensor.w_rel) annotation (
    Line(points = {{-32, -67}, {-40, -67}, {-40, -20}, {-8, -20}}, color = {0, 255,0}));
  connect(speedSensor.w, calc_GearLoss.Gear_w2) annotation (
    Line(points = {{-69, -73}, {-32, -73}}, color = {0, 255, 0}));
  annotation (
    uses(Modelica(version = "3.2.3")),
    Diagram,
    version = "",
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Line(origin = {40.5319, -20.1064}, points = {{-10, 80}, {10, 80}}), Line(origin = {110.107, 10.2128}, points = {{-80, -20}, {-60, -20}}), Rectangle(origin = {-114, -30}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, fillPattern = FillPattern.HorizontalCylinder, extent = {{14, -10}, {168, 10}}), Line(origin = {39.8936, -90.0002}, points = {{-10, 40}, {10, 40}}), Rectangle(origin = {1, -34}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-15, -40}, {15, 40}}), Rectangle(origin = {1, -61}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Line(origin = {109.468, 0.404273}, points = {{-80, 20}, {-60, 20}}), Rectangle(origin = {1, -72}, fillColor = {102, 102, 102}, fillPattern = FillPattern.Solid, extent = {{-15, -2}, {15, 2}}), Rectangle(origin = {1, 4}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, -2}, {15, 2}}), Rectangle(origin = {127, 40}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-111, -10}, {-27, 10}}), Rectangle(origin = {1, -7}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Rectangle(origin = {1, -24}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 4}}), Rectangle(origin = {1, -44}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 4}}), Rectangle(origin = {1, 46}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-15, -40}, {15, 28}}), Rectangle(origin = {1, 50}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 0}}), Rectangle(origin = {1, 36}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 4}}), Rectangle(origin = {1, 19}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Rectangle(origin = {1, 8}, fillColor = {102, 102, 102}, fillPattern = FillPattern.Solid, extent = {{-15, -2}, {15, 2}}), Rectangle(origin = {1, 57}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Rectangle(origin = {1, 68}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, -2}, {15, 2}}), Line(origin = {40.1064, 6.82979}, points = {{0, 13}, {0, -17}}), Line(origin = {54.9998, -37.2554}, points = {{-15, 43}, {15, 43}, {15, -13}, {45, -13}}), Line(origin = {39.8937, -25.2978}, points = {{0, -25}, {0, -43}}), Line(origin = {40, 114.915}, points = {{0, -35}, {0, -55}}), Text(origin = {0, -121}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}));
end PlanetPlanet;
