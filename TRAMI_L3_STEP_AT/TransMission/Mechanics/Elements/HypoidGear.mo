within TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements;
model HypoidGear
  //constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  constant Real w_Threshold = 0.1;
  parameter Real GearRatio;
  parameter String Gear_K_Filename;
  parameter String LoadLossFilename;
  parameter String StirringLossFilename;
  parameter Real Oil_Viscosity_Breakpoint[:];
  Modelica.Mechanics.Rotational.Interfaces.Flange_a pinion annotation (
    Placement(visible = true, transformation(extent = {{-150, -10}, {-130, 10}}, rotation = 0), iconTransformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b ring annotation (
    Placement(visible = true, transformation(extent = {{130, -10}, {150, 10}}, rotation = 0), iconTransformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-160, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput GearLoad[3] annotation (
    Placement(visible = true, transformation(origin = {150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
    Placement(visible = true, transformation(origin = {150, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio = GearRatio) annotation (
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds1(table = [-1, 1; -w_Threshold, 1; 0, 0; w_Threshold, -1; 1, -1]) annotation (
    Placement(visible = true, transformation(origin = {-54, -60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D(filename = LoadLossFilename, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-54, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (
    Placement(visible = true, transformation(origin = {-110, -2.22045e-16}, extent = {{-6, 6}, {6, -6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
    Placement(visible = true, transformation(origin = {-126, -20}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Blocks.Math.Add add1 annotation (
    Placement(visible = true, transformation(origin = {116, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-110, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {-26, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation (
    Placement(visible = true, transformation(origin = {6, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {-86, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {6, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex3 multiplex31 annotation (
    Placement(visible = true, transformation(origin = {40, 50}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D_Fzp(fileName = currDir + "/Tables/" + Gear_K_Filename, tableName = "tab3", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-14, 26}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D_Fyp(fileName = currDir + "/Tables/" + Gear_K_Filename, tableName = "tab2", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-14, 50}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D_Fxp(fileName = currDir + "/Tables/" + Gear_K_Filename, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-14, 74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay unitDelay(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D stirring2D(Stirring_Resistance_Filename = StirringLossFilename) annotation (
    Placement(visible = true, transformation(origin = {86, -24}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation (
    Placement(visible = true, transformation(origin = {40, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation (
    Placement(visible = true, transformation(origin = {108, -24}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
equation
  connect(gain1.u, speedSensor.w) annotation (
    Line(points = {{-117, -40}, {-126, -40}, {-126, -27}}, color = {0, 255, 0}));
  connect(combiTable1Ds1.u, speedSensor.w) annotation (
    Line(points = {{-61, -60}, {-126, -60}, {-126, -27}}, color = {0, 255, 0}));
  connect(combiTable3D.u2, nu_oil_m2ps) annotation (
    Line(points = {{-61, -45}, {-70, -45}, {-70, -70}, {-160, -70}}, color = {0, 255, 0}));
  connect(combiTable1Ds1.y[1], product1.u2) annotation (
    Line(points = {{-47, -60}, {-40, -60}, {-40, -48}, {-33, -48}}, color = {0, 255, 0}));
  connect(product1.y, torque1.tau) annotation (
    Line(points = {{-19, -44}, {-1, -44}}, color = {0, 255, 0}));
  connect(torque1.flange, idealGear.flange_a) annotation (
    Line(points = {{12, -44}, {20, -44}, {20, 0}, {32, 0}}));
  connect(product2.u1, product1.y) annotation (
    Line(points = {{-1, -80}, {-10, -80}, {-10, -44}, {-19, -44}}, color = {0, 255, 0}));
  connect(product2.u2, speedSensor.w) annotation (
    Line(points = {{-1, -88}, {-126, -88}, {-126, -27}}, color = {0, 255, 0}));
  connect(combiTable1D_Fyp.y[1], multiplex31.u2[1]) annotation (
    Line(points = {{-7, 50}, {33, 50}}, color = {0, 255, 0}, thickness = 0.5));
  connect(combiTable1D_Fxp.y[1], multiplex31.u1[1]) annotation (
    Line(points = {{-7, 74}, {20, 74}, {20, 54}, {33, 54}}, color = {0, 255, 0}, thickness = 0.5));
  connect(combiTable1D_Fzp.y[1], multiplex31.u3[1]) annotation (
    Line(points = {{-7, 26}, {20, 26}, {20, 46}, {33, 46}}, color = {0, 255, 0}, thickness = 0.5));
  connect(multiplex31.y, GearLoad) annotation (
    Line(points = {{47, 50}, {150, 50}}, color = {0, 255, 0}, thickness = 0.5));
  connect(speedSensor.flange, pinion) annotation (
    Line(points = {{-126, -14}, {-126, 0}, {-140, 0}}));
  connect(idealGear.flange_b, ring) annotation (
    Line(points = {{48, 0}, {140, 0}}));
  connect(combiTable1D_Fxp.u[1], unitDelay.y) annotation (
    Line(points = {{-21, 74}, {-40, 74}, {-40, 50}, {-83, 50}}, color = {0, 255, 0}));
  connect(combiTable1D_Fyp.u[1], unitDelay.y) annotation (
    Line(points = {{-21, 50}, {-83, 50}}, color = {0, 255, 0}));
  connect(torqueSensor.flange_a, pinion) annotation (
    Line(points = {{-116, 0}, {-140, 0}}));
  connect(torqueSensor.flange_b, idealGear.flange_a) annotation (
    Line(points = {{-104, 0}, {32, 0}}));
  connect(unitDelay.u, torqueSensor.tau) annotation (
    Line(points = {{-97, 50}, {-115, 50}, {-115, 7}}, color = {0, 255, 0}));
  connect(combiTable1D_Fzp.u[1], unitDelay.y) annotation (
    Line(points = {{-21, 26}, {-40, 26}, {-40, 50}, {-83, 50}}, color = {0, 255, 0}));
  connect(gain1.y, abs1.u) annotation (
    Line(points = {{-104, -40}, {-93, -40}}, color = {0, 255, 0}));
  connect(abs1.y, combiTable3D.u1) annotation (
    Line(points = {{-79, -40}, {-61, -40}}, color = {0, 255, 0}));
  connect(unitDelay.y, combiTable3D.u) annotation (
    Line(points = {{-84, 50}, {-70, 50}, {-70, -35}, {-61, -35}}, color = {0, 255, 0}));
  connect(combiTable3D.y, product1.u1) annotation (
    Line(points = {{-48, -40}, {-33, -40}}, color = {0, 0, 127}));
  connect(stirring2D.support, idealGear.flange_b) annotation (
    Line(points = {{80, -24}, {60, -24}, {60, 0}, {48, 0}}));
  connect(product2.y, abs11.u) annotation (
    Line(points = {{13, -84}, {33, -84}}, color = {0, 255, 0}));
  connect(abs11.y, add1.u2) annotation (
    Line(points = {{47, -84}, {109, -84}}, color = {191, 0, 0}));
  connect(stirring2D.PHI_W, add1.u1) annotation (
    Line(points = {{93, -29}, {100, -29}, {100, -76}, {109, -76}}, color = {191, 0, 0}));
  connect(add1.y, PHI_W) annotation (
    Line(points = {{123, -80}, {150, -80}}, color = {0, 0, 127}));
  connect(stirring2D.nu_oil_m2ps, nu_oil_m2ps) annotation (
    Line(points = {{79, -19}, {70, -19}, {70, -70}, {-160, -70}}, color = {0, 255, 0}));
  connect(stirring2D.flange_b, fixed.flange) annotation (
    Line(points = {{92, -24}, {108, -24}}));
  annotation (
    Icon(graphics = {Text(origin = {6, -224}, lineColor = {0, 0, 255}, extent = {{-146, 84}, {154, 124}}, textString = "%name"), Rectangle(origin = {30, 6}, rotation = 270, lineColor = {64, 64, 64}, fillColor = {192, 192, 192}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-74, -10}, {-46, 10}}), Ellipse(origin = {16, 4}, rotation = 270, lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, -48}, {2, 72}}, endAngle = 360), Ellipse(origin = {26, 28}, rotation = 270, lineColor = {64, 64, 64}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-16, -42}, {24, 48}}, endAngle = 360), Ellipse(origin = {36, 34}, rotation = 270, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{0, -36}, {20, 24}}, endAngle = 360), Ellipse(origin = {30, 38}, rotation = 270, lineColor = {64, 64, 64}, fillColor = {192, 192, 192}, fillPattern = FillPattern.HorizontalCylinder, extent = {{12, -10}, {20, 10}}, endAngle = 360), Rectangle(origin = {30, 38}, rotation = 270, lineColor = {64, 64, 64}, fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{16, -10}, {118, 10}}), Polygon(origin = {-14, -9}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, points = {{-16, 31}, {-16, -15}, {2, -7}, {2, 25}, {-16, 31}}), Rectangle(origin = {-122, 0}, lineColor = {64, 64, 64}, fillColor = {192, 192, 192}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{22, -10}, {92, 10}})}, coordinateSystem(initialScale = 0.1)),
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})),
    version = "");
end HypoidGear;
