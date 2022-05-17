within TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements;
model PlanetRing
//constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter Real gearRatio;
  parameter String Gear_Friction_Filename;
  parameter String Gear_K_Filename;
  parameter Real tanhCoeff = 100;
  parameter Real Oil_Viscosity_Breakpoint[:];
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation (
    Placement(visible = true, transformation(origin = {70, -32}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (
    Placement(visible = true, transformation(origin = {6, -6.66134e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear Planet_Ring(ratio = gearRatio, useSupport = true) annotation (
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
    Placement(visible = true, transformation(origin = {-20, -28}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b ring annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a pinion annotation (
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a carrier annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation (
    Placement(visible = true, transformation(origin = {86, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation (
    Placement(visible = true, transformation(origin = {66, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.Calc_GearLoss calc_GearLoss(Gear_Friction_Filename = Gear_Friction_Filename, Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {16, -54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput RingGearKa annotation (
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay unitDelay(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {40, -54}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay unitDelay1(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {82, 60}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D_Ka(fileName = currDir + "/Tables/" + Gear_K_Filename, tableName = "tab3", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {34, 64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {10, 64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {62, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.Tanh tanh(Coeff = tanhCoeff) annotation (
    Placement(visible = true, transformation(origin = {34, 46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor annotation (
    Placement(visible = true, transformation(origin = {-34, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = -1)  annotation (
    Placement(visible = true, transformation(origin = {0, -22}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
equation
  connect(torque.flange, ring) annotation (
    Line(points = {{78, -32}, {89, -32}, {89, 0}, {100, 0}}));
  connect(pinion, Planet_Ring.flange_a) annotation (
    Line(points = {{-100, 60}, {-60, 60}}));
  connect(carrier, Planet_Ring.support) annotation (
    Line(points = {{-100, 0}, {-50, 0}, {-50, 50}}));
  connect(nu_oil_m2ps, calc_GearLoss.nu_oil_m2ps) annotation (
    Line(points = {{-120, -60}, {6, -60}}, color = {0, 255, 0}));
  connect(torqueSensor.flange_a, Planet_Ring.flange_b) annotation (
    Line(points = {{-2, 0}, {-20, 0}, {-20, 60}, {-40, 60}}));
  connect(product.y, abs11.u) annotation (
    Line(points = {{73, -70}, {79, -70}}, color = {191, 0, 0}));
  connect(abs11.y, PHI_W) annotation (
    Line(points = {{93, -70}, {110, -70}}, color = {191, 0, 0}));
  connect(torqueSensor.flange_b, ring) annotation (
    Line(points = {{14, 0}, {100, 0}}));
  connect(calc_GearLoss.Gear_Loss, unitDelay.u) annotation (
    Line(points = {{25, -54}, {35, -54}}, color = {0, 255, 0}));
  connect(tanh.y, product1.u2) annotation (
    Line(points = {{41, 46}, {50, 46}, {50, 56}, {55, 56}}, color = {0, 255, 0}));
  connect(combiTable1D_Ka.y[1], product1.u1) annotation (
    Line(points = {{41, 64}, {55, 64}}, color = {0, 255, 0}));
  connect(product1.y, unitDelay1.u) annotation (
    Line(points = {{69, 60}, {77, 60}}, color = {0, 255, 0}));
  connect(abs1.y, combiTable1D_Ka.u[1]) annotation (
    Line(points = {{17, 64}, {27, 64}}, color = {0, 255, 0}));
  connect(tanh.u, abs1.u) annotation (
    Line(points = {{27, 46}, {-8, 46}, {-8, 64}, {3, 64}}, color = {0, 255, 0}));
  connect(unitDelay1.y, RingGearKa) annotation (
    Line(points = {{86, 60}, {110, 60}}, color = {0, 255, 0}));
  connect(relSpeedSensor.flange_a, Planet_Ring.support) annotation (
    Line(points = {{-42, 0}, {-50, 0}, {-50, 50}, {-50, 50}}));
  connect(relSpeedSensor.flange_b, torqueSensor.flange_a) annotation (
    Line(points = {{-26, 0}, {-2, 0}, {-2, 0}, {-2, 0}}));
  connect(relSpeedSensor.w_rel, calc_GearLoss.Gear_w1) annotation (
    Line(points = {{-34, -8}, {-34, -52}, {6, -52}}, color = {0, 255, 0}));
  connect(speedSensor.flange, Planet_Ring.flange_b) annotation (
    Line(points = {{-20, -20}, {-20, 60}, {-40, 60}}));
  connect(product.u2, relSpeedSensor.w_rel) annotation (
    Line(points = {{58, -74}, {-34, -74}, {-34, -8}, {-34, -8}}, color = {0, 255,0}));
  connect(calc_GearLoss.Gear_w2, speedSensor.w) annotation (
    Line(points = {{6, -56}, {-20, -56}, {-20, -37}}, color = {0, 255, 0}));
  connect(torqueSensor.tau, gain.u) annotation (
    Line(points = {{0, -8}, {0, -8}, {0, -14}, {0, -14}}, color = {0, 0, 127}));
  connect(gain.y, calc_GearLoss.Gear_Torque) annotation (
    Line(points = {{0, -28}, {0, -28}, {0, -48}, {6, -48}, {6, -48}}, color = {0, 255,0}));
  connect(gain.y, abs1.u) annotation (
    Line(points = {{0, -28}, {0, -28}, {0, -36}, {30, -36}, {30, 30}, {-8, 30}, {-8, 64}, {2, 64}, {2, 64}}, color = {0, 255,0}));
  connect(unitDelay.y, product.u1) annotation (
    Line(points = {{44, -54}, {52, -54}, {52, -66}, {58, -66}, {58, -66}}, color = {0, 255,0}));
  connect(unitDelay.y, torque.tau) annotation (
    Line(points = {{44, -54}, {52, -54}, {52, -32}, {60, -32}, {60, -32}}, color = {0, 255,0}));
  annotation (
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Rectangle(origin = {-31, 60}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-69, -10}, {45, 10}}), Rectangle(origin = {-1, 72}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-15, -46}, {15, 18}}), Rectangle(origin = {-1, 51}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Rectangle(origin = {-1, 76}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 0}}), Rectangle(origin = {-1, 64}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -4}, {15, 4}}), Rectangle(origin = {-1, 83}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, -3}, {15, 3}}), Rectangle(origin = {-1, 32}, fillColor = {102, 102, 102}, fillPattern = FillPattern.Solid, extent = {{-15, -2}, {15, 2}}), Rectangle(origin = {55, 0}, lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-1, -10}, {45, 10}}), Rectangle(origin = {16, 0}, lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{10, -94}, {40, 94}}), Rectangle(origin = {6, 6}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, extent = {{-32, -105}, {50, -100}}), Rectangle(origin = {6, 199}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, extent = {{-32, -105}, {50, -100}}), Rectangle(origin = {-1, 44}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, extent = {{-15, -6}, {15, 0}}), Line(origin = {-52.3405, 80.4043}, points = {{-12, 0}, {12, 0}}), Line(origin = {-51.634, 40.1446}, points = {{-12, 0}, {12, 0}}), Line(origin = {-40.6, 110.145}, points = {{-12, -12}, {-12, -30}}), Line(origin = {-66.6381, 98.3191}, points = {{14, -58}, {14, -98}, {-32, -98}}), Text(origin = {0, -121}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
    Diagram,
    version = "");
end PlanetRing;
