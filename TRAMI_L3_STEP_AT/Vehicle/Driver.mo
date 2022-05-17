within TRAMI_L3_STEP_AT.Vehicle;
model Driver
  parameter Real Jfw = 0.29;
  parameter Real Mv = 1738;
  parameter Real Rt = 0.334;
  parameter Real Final_GearRatio = 3.066;
  parameter Real Coef_A = 196.5;
  parameter Real Coef_C = 0.03014;
  parameter String Accelerator_FileName="Accelerator_open_per_MAP.txt";
  parameter String Accelerator_tabName="Accelerator_open_per_MAP";
  constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  Modelica.Blocks.Interfaces.RealInput Target_Speed annotation (
    Placement(visible = true, transformation(origin={-349, 196}, extent={{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput accel_position_per annotation (
    Placement(visible = true, transformation(origin = {210, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v_vehicle_mps annotation (
    Placement(visible = true, transformation(origin = {-220, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput tau_brake annotation (
    Placement(visible = true, transformation(origin = {210, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, -60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain kph2mps(k = 1000 / 3600) annotation (
    Placement(visible = true, transformation(origin = {-180, 180}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der der1 annotation (
    Placement(visible = true, transformation(origin = {-154, 180}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = Mv) annotation (
    Placement(visible = true, transformation(origin = {-154, 162}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {-132, 170}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {-180, 138}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = Coef_C) annotation (
    Placement(visible = true, transformation(origin = {-154, 128}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {-134, 134}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = Coef_A) annotation (
    Placement(visible = true, transformation(origin = {-154, 96}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant TireRadius(k = Rt) annotation (
    Placement(visible = true, transformation(origin = {-104, 110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add31 annotation (
    Placement(visible = true, transformation(origin = {-104, 134}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product tire_torque annotation (
    Placement(visible = true, transformation(origin = {-78, 130}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Ratio_AT annotation (
    Placement(visible = true, transformation(origin = {-220, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_ENG_PNT_radps annotation (
    Placement(visible = true, transformation(origin = {-220, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Gain radps2rpm(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {-180, -120}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D torque2acc_per(fileName = currDir + "/Tables/" + Accelerator_FileName, tableName = Accelerator_tabName, tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {82, 44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, initType = Modelica.Blocks.Types.Init.InitialState, k = 1, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {160, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Division EngineOutputTorque annotation (
    Placement(visible = true, transformation(origin = {-8, 122}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation (
    Placement(visible = true, transformation(origin = {-134, -48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.PID PID(Nd = 10, Td = 0.05, Ti = 10, initType = Modelica.Blocks.Types.InitPID.InitialState, k = 50, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {10, -48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation (
    Placement(visible = true, transformation(origin = {140, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation (
    Placement(visible = true, transformation(origin = {72, -92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold = 10) annotation (
    Placement(visible = true, transformation(origin = {50, -92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const4(k = 0) annotation (
    Placement(visible = true, transformation(origin = {50, -76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds1(table = [-1, 0; 0, 0; 0.1, 1; 1, 1]) annotation (
    Placement(visible = true, transformation(origin = {-154, 78}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product5 annotation (
    Placement(visible = true, transformation(origin = {-134, 92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold2(threshold = 0.1) annotation (
    Placement(visible = true, transformation(origin = {96, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch11 annotation (
    Placement(visible = true, transformation(origin = {118, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const5(k = 2000) annotation (
    Placement(visible = true, transformation(origin = {96, -130}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1 / 2000) annotation (
    Placement(visible = true, transformation(origin = {140, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(limitsAtInit = true, uMax = 1, uMin = 0) annotation (
    Placement(visible = true, transformation(origin = {160, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {-98, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch12 annotation (
    Placement(visible = true, transformation(origin = {-56, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Logical.LessThreshold lessThreshold1(threshold = 1e-3) annotation (
    Placement(visible = true, transformation(origin = {-78, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const6(k = 1e-3) annotation (
    Placement(visible = true, transformation(origin = {-78, -4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 0.001, initType = Modelica.Blocks.Types.Init.InitialState, k = 1, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {180, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant DiffRatio(k = Final_GearRatio) annotation (
    Placement(visible = true, transformation(origin = {-78, 110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Division GearBoxOutputTorque annotation (
    Placement(visible = true, transformation(origin = {-54, 126}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const8(k = Jfw) annotation (
    Placement(visible = true, transformation(origin = {-34, 34}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add torque_Total annotation (
    Placement(visible = true, transformation(origin = {14, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Division tire_radps2 annotation (
    Placement(visible = true, transformation(origin = {-78, 52}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product torque_FlyWheel annotation (
    Placement(visible = true, transformation(origin = {-10, 48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = -2000) annotation (
    Placement(visible = true, transformation(origin = {94, -92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(limitsAtInit = true, uMax = 100, uMin = 0) annotation (
    Placement(visible = true, transformation(origin = {182, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product GearBoxOutput_radps2 annotation (
    Placement(visible = true, transformation(origin = {-54, 56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product EngineOutput_radps2 annotation (
    Placement(visible = true, transformation(origin = {-34, 52}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D1(filename = "Loss_Compensation.txt", z_ax = {-4.798, 0, 0.601, 0.717, 0.865, 1.000, 1.211, 1.636, 2.252, 3.243, 5.354}) annotation (
    Placement(visible = true, transformation(origin = {38, 12}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation (
    Placement(visible = true, transformation(origin = {60, 48}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
 Modelica.Blocks.Continuous.Integrator integrator
   annotation (Placement(transformation(origin={-287, 214}, extent={{-10, -10}, {10, 10}})));
 Modelica.Blocks.Continuous.Derivative derivative
   annotation (Placement(transformation(origin={-250, 214}, extent={{-10, -10}, {10, 10}})));
equation
  connect(torque2acc_per.y, greaterThreshold1.u) annotation (
    Line(points = {{89, 44}, {92, 44}, {92, -64}, {38, -64}, {38, -92}, {43, -92}}, color = {0, 0, 127}));
  connect(radps2rpm.y, torque2acc_per.u2) annotation (
    Line(points = {{-174, -120}, {-150, -120}, {-150, 12}, {14, 12}, {14, 40}, {74, 40}}, color = {0, 0, 127}));
  connect(PID.y, switch1.u3) annotation (
    Line(points = {{16, -48}, {30, -48}, {30, -102}, {60, -102}, {60, -96}, {64, -96}, {64, -96}}, color = {0, 0, 127}));
  connect(PID.y, add1.u2) annotation (
    Line(points = {{17, -48}, {129, -48}, {129, 36}, {133, 36}}, color = {0, 0, 127}));
  connect(feedback1.y, PID.u) annotation (
    Line(points = {{-129, -48}, {3, -48}}, color = {0, 0, 127}));
  connect(der1.y, tire_radps2.u1) annotation (
    Line(points = {{-148, 180}, {-116, 180}, {-116, 56}, {-86, 56}, {-86, 56}}, color = {0, 0, 127}));
  connect(TireRadius.y, tire_radps2.u2) annotation (
    Line(points = {{-98, 110}, {-92, 110}, {-92, 48}, {-86, 48}, {-86, 48}}, color = {0, 0, 127}));
  connect(gain3.y, switch11.u1) annotation (
    Line(points = {{101, -92}, {104, -92}, {104, -106}, {110, -106}}, color = {0, 0, 127}));
  connect(switch1.y, gain3.u) annotation (
    Line(points = {{78.6, -92}, {86.6, -92}}, color = {0, 0, 127}));
  connect(const4.y, switch1.u1) annotation (
    Line(points = {{56.6, -76}, {58.6, -76}, {58.6, -76}, {60.6, -76}, {60.6, -87}, {63.1, -87}, {63.1, -87}, {65.6, -87}}, color = {0, 0, 127}));
  connect(greaterThreshold1.y, switch1.u2) annotation (
    Line(points = {{56.6, -92}, {65.6, -92}}, color = {255, 0, 255}));
  connect(radps2rpm.y, combiTable3D1.u1) annotation (
    Line(points = {{-174, -120}, {-150, -120}, {-150, 12}, {31, 12}}, color = {0, 0, 127}));
  connect(Ratio_AT, combiTable3D1.u2) annotation (
    Line(points = {{-220, -20}, {-142, -20}, {-142, 7}, {31, 7}}, color = {0, 0, 127}));
  connect(torque_Total.y, combiTable3D1.u) annotation (
    Line(points = {{21, 86}, {24.6, 86}, {24.6, 18}, {31, 18}, {31, 17}}, color = {0, 0, 127}));
  connect(combiTable3D1.y, add2.u2) annotation (
    Line(points = {{45, 12}, {48, 12}, {48, 44}, {53, 44}}, color = {0, 0, 127}));
  connect(torque_Total.y, add2.u1) annotation (
    Line(points = {{21, 86}, {48, 86}, {48, 52}, {53, 52}}, color = {0, 0, 127}));
  connect(add2.y, torque2acc_per.u1) annotation (
    Line(points = {{66.6, 48}, {73.6, 48}}, color = {0, 0, 127}));
  connect(torque2acc_per.y, add1.u1) annotation (
    Line(points = {{89, 44}, {133, 44}}, color = {0, 0, 127}));
  connect(const5.y, switch11.u3) annotation (
    Line(points = {{102, -130}, {106, -130}, {106, -114}, {110, -114}, {110, -114}}, color = {0, 0, 127}));
  connect(switch11.y, gain2.u) annotation (
    Line(points = {{124.6, -110}, {132.6, -110}, {132.6, -110}, {132.6, -110}}, color = {0, 0, 127}));
  connect(gain2.y, limiter1.u) annotation (
    Line(points = {{147, -110}, {153, -110}}, color = {0, 0, 127}));
  connect(greaterThreshold2.y, switch11.u2) annotation (
    Line(points = {{102.6, -110}, {105.6, -110}, {105.6, -110}, {108.6, -110}, {108.6, -110}, {109.6, -110}, {109.6, -110}, {110.6, -110}}, color = {255, 0, 255}));
  connect(kph2mps.y, greaterThreshold2.u) annotation (
    Line(points = {{-174, 180}, {-166, 180}, {-166, -110}, {89, -110}}, color = {0, 0, 127}));
  connect(limiter1.y, firstOrder2.u) annotation (
    Line(points = {{167, -110}, {173, -110}}, color = {0, 0, 127}));
  connect(add1.y, firstOrder1.u) annotation (
    Line(points = {{147, 40}, {153, 40}}, color = {0, 0, 127}));
  connect(firstOrder1.y, limiter2.u) annotation (
    Line(points = {{167, 40}, {174.6, 40}}, color = {0, 0, 127}));
  connect(limiter2.y, accel_position_per) annotation (
    Line(points = {{189, 40}, {210, 40}}, color = {0, 0, 127}));
  connect(firstOrder2.y, tau_brake) annotation (
    Line(points = {{187, -110}, {210, -110}}, color = {0, 0, 127}));
  connect(torque_FlyWheel.y, torque_Total.u2) annotation (
    Line(points = {{-4, 48}, {2, 48}, {2, 82}, {6, 82}, {6, 82}}, color = {0, 0, 127}));
  connect(EngineOutputTorque.y, torque_Total.u1) annotation (
    Line(points = {{-2, 122}, {2, 122}, {2, 90}, {6, 90}, {6, 90}}, color = {0, 0, 127}));
  connect(Ratio_AT, switch12.u3) annotation (
    Line(points = {{-220, -20}, {-131, -20}, {-131, -32}, {-68, -32}, {-68, -25}, {-63, -25}}, color = {0, 0, 127}));
  connect(EngineOutput_radps2.y, torque_FlyWheel.u1) annotation (
    Line(points = {{-28, 52}, {-17, 52}}, color = {0, 0, 127}));
  connect(const8.y, torque_FlyWheel.u2) annotation (
    Line(points = {{-28, 34}, {-20, 34}, {-20, 44}, {-17, 44}}, color = {0, 0, 127}));
  connect(switch12.y, EngineOutputTorque.u2) annotation (
    Line(points = {{-50, -20}, {-24, -20}, {-24, 118}, {-16, 118}}, color = {0, 0, 127}));
  connect(GearBoxOutput_radps2.y, EngineOutput_radps2.u1) annotation (
    Line(points = {{-47, 56}, {-41, 56}}, color = {0, 0, 127}));
  connect(DiffRatio.y, GearBoxOutput_radps2.u1) annotation (
    Line(points = {{-71, 110}, {-66, 110}, {-66, 60}, {-61, 60}}, color = {0, 0, 127}));
  connect(tire_radps2.y, GearBoxOutput_radps2.u2) annotation (
    Line(points = {{-72, 52}, {-61, 52}}, color = {0, 0, 127}));
  connect(DiffRatio.y, GearBoxOutputTorque.u2) annotation (
    Line(points = {{-71, 110}, {-66, 110}, {-66, 122}, {-61, 122}}, color = {0, 0, 127}));
  connect(tire_torque.y, GearBoxOutputTorque.u1) annotation (
    Line(points = {{-71, 130}, {-61, 130}}, color = {0, 0, 127}));
  connect(GearBoxOutputTorque.y, EngineOutputTorque.u1) annotation (
    Line(points = {{-47, 126}, {-15, 126}}, color = {0, 0, 127}));
  connect(Ratio_AT, EngineOutput_radps2.u2) annotation (
    Line(points = {{-220, -20}, {-112, -20}, {-112, 40}, {-45.5, 40}, {-45.5, 48}, {-41, 48}}, color = {0, 0, 127}));
  connect(const6.y, switch12.u1) annotation (
    Line(points = {{-71.4, -4}, {-67.8, -4}, {-67.8, -15}, {-62.8, -15}}, color = {0, 0, 127}));
  connect(abs1.y, lessThreshold1.u) annotation (
    Line(points = {{-91.4, -20}, {-85.4, -20}, {-85.4, -22}, {-85.4, -22}, {-85.4, -20}, {-85.4, -20}}, color = {0, 0, 127}));
  connect(lessThreshold1.y, switch12.u2) annotation (
    Line(points = {{-71.4, -20}, {-62.4, -20}}, color = {255, 0, 255}));
  connect(Ratio_AT, abs1.u) annotation (
    Line(points = {{-220, -20}, {-105, -20}}, color = {0, 0, 127}));
  connect(TireRadius.y, tire_torque.u2) annotation (
    Line(points = {{-98, 110}, {-92, 110}, {-92, 126}, {-86, 126}, {-86, 126}}, color = {0, 0, 127}));
  connect(add31.y, tire_torque.u1) annotation (
    Line(points = {{-97, 134}, {-85, 134}}, color = {0, 0, 127}));
  connect(product1.y, add31.u1) annotation (
    Line(points = {{-126, 170}, {-120, 170}, {-120, 138}, {-111, 138}, {-111, 139}}, color = {0, 0, 127}));
  connect(product5.y, add31.u3) annotation (
    Line(points = {{-128, 92}, {-120, 92}, {-120, 130}, {-112, 130}, {-112, 130}}, color = {0, 0, 127}));
  connect(product3.y, add31.u2) annotation (
    Line(points = {{-127.4, 134}, {-111, 134}}, color = {0, 0, 127}));
  connect(const1.y, product3.u2) annotation (
    Line(points = {{-147.4, 128}, {-146.9, 128}, {-146.9, 128}, {-146.4, 128}, {-146.4, 128}, {-145.4, 128}, {-145.4, 130}, {-143.4, 130}, {-143.4, 130}, {-141.4, 130}, {-141.4, 130}}, color = {0, 0, 127}));
  connect(product2.y, product3.u1) annotation (
    Line(points = {{-173.4, 138}, {-141.4, 138}}, color = {0, 0, 127}));
  connect(Target_Speed, product2.u1) annotation (
    Line(points={{-349, 196}, {-192, 196}, {-192, 142}, {-187, 142}}));
  connect(Target_Speed, product2.u2) annotation (
    Line(points={{-349, 196}, {-349, 178}, {-216, 178}, {-216, 134}, {-187, 134}}));
  connect(kph2mps.y, feedback1.u1) annotation (
    Line(points = {{-174, 180}, {-166, 180}, {-166, -48}, {-138, -48}, {-138, -48}}, color = {0, 0, 127}));
  connect(kph2mps.y, combiTable1Ds1.u) annotation (
    Line(points = {{-174, 180}, {-166, 180}, {-166, 78}, {-162, 78}, {-162, 78}}, color = {0, 0, 127}));
  connect(kph2mps.y, der1.u) annotation (
    Line(points = {{-174, 180}, {-162, 180}, {-162, 180}, {-162, 180}}, color = {0, 0, 127}));
  connect(combiTable1Ds1.y[1], product5.u2) annotation (
    Line(points = {{-147.4, 78}, {-146.4, 78}, {-146.4, 78}, {-145.4, 78}, {-145.4, 88}, {-143.4, 88}, {-143.4, 88}, {-141.4, 88}, {-141.4, 88}, {-141.4, 88}, {-141.4, 88}}, color = {0, 0, 127}, thickness = 0.5));
  connect(const2.y, product5.u1) annotation (
    Line(points = {{-147.4, 96}, {-141.4, 96}}, color = {0, 0, 127}));
  connect(der1.y, product1.u1) annotation (
    Line(points = {{-147.4, 180}, {-145.6, 180}, {-145.6, 180}, {-143.8, 180}, {-143.8, 174}, {-139.4, 174}}, color = {0, 0, 127}));
  connect(const.y, product1.u2) annotation (
    Line(points = {{-147.4, 162}, {-145.6, 162}, {-145.6, 162}, {-143.8, 162}, {-143.8, 166}, {-139.4, 166}}, color = {0, 0, 127}));
  connect(v_vehicle_mps, feedback1.u2) annotation (
    Line(points = {{-220, -60}, {-134, -60}, {-134, -53}}, color = {0, 0, 127}));
  connect(w_ENG_PNT_radps, radps2rpm.u) annotation (
    Line(points = {{-220, -120}, {-187, -120}}, color = {0, 0, 127}));
  connect(derivative.y, kph2mps.u)
  annotation(Line(points={{-239, 214}, {-207, 214}, {-207, 180}, {-187, 180}}));
  connect(integrator.y, derivative.u)
  annotation(Line(points={{-276, 214}, {-262, 214}, {-262, 214}}));
  connect(Target_Speed, integrator.u)
  annotation(Line(points={{-349, 196}, {-349, 214}, {-299, 214}}));
  annotation (
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent={{-200, -200}, {200, 200}}), graphics={Text(origin={-143, 151}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="Inertia", fontSize=4.5, fontName="Arial"),
    Text(origin={-142, 113}, lineThickness=0.01, extent={{-50, -1}, {50, 1}}, textString="Air Resistance", fontSize=1.5, fontName="Arial"),
    Text(origin={-140, 65.5}, lineThickness=0.01, extent={{-50, -1}, {50, 1}}, textString="Rolling Resistance", fontSize=1.5, fontName="Arial"),
    Text(origin={-41, 20.5}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="FW Inertia", fontSize=4.5, fontName="Arial"),
    Text(origin={41, 0.5}, lineThickness=0.01, extent={{-50, -1}, {50, 1}}, textString="TM_LossTorque", fontSize=1.5, fontName="Arial")}),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.1));
end Driver;
