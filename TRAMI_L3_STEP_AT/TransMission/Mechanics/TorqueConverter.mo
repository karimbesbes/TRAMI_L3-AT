within TRAMI_L3_STEP_AT.TransMission.Mechanics;
model TorqueConverter
  constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  constant Real BRG_DummyLoad = 1000;
  parameter String StartDeviceFileName;
  parameter String CapacityCoefficientTabName;
  parameter String TorqueRatioTabName;
  parameter Real Oil_Viscosity_Breakpoint[:];
  parameter Modelica.SIunits.Inertia J_in = 0.01;
  parameter Modelica.SIunits.Inertia J_out = 0.01;
  parameter Modelica.SIunits.RotationalSpringConstant Shaft_c = 1e5;
  parameter Modelica.SIunits.RotationalDampingConstant Shaft_d = 1e3;
  parameter Modelica.SIunits.RotationalSpringConstant LUdamper_c = 1e3;
  parameter Modelica.SIunits.RotationalDampingConstant LUdamper_d = 1e3;
  Modelica.Blocks.Math.Division division1 annotation (
    Placement(visible = true, transformation(origin = {10, -66}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
    Placement(visible = true, transformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {50, -6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = -1) annotation (
    Placement(visible = true, transformation(origin = {150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_lockup_cap annotation (
    Placement(visible = true, transformation(origin = {-380, 150}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 170}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Math.Add add1(k1 = -1, k2 = +1) annotation (
    Placement(visible = true, transformation(origin = {190, -140}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const(k = 1e-3) annotation (
    Placement(visible = true, transformation(origin = {90, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Components.SpringDamper LUdamper(c = LUdamper_c, d = LUdamper_d, phi_rel(fixed = true, start = 0), w_rel(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {144, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper Shaft(c = Shaft_c, d = Shaft_d, phi_rel(fixed = true, start = 0), w_rel(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {-156, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_in(J = J_in) annotation (
    Placement(visible = true, transformation(origin = {-122, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product5 annotation (
    Placement(visible = true, transformation(origin = {50, -146}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product4 annotation (
    Placement(visible = true, transformation(origin = {190, -100}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {230, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor1 annotation (
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation (
    Placement(visible = true, transformation(origin = {-70, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor2 annotation (
    Placement(visible = true, transformation(origin = {268, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor2 annotation (
    Placement(visible = true, transformation(origin = {278, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation (
    Placement(visible = true, transformation(origin = {240, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque2 annotation (
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch ClutchLU(tanhCoeff = -350) annotation (
    Placement(visible = true, transformation(origin = {30, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_out(J = J_out, w(start = 0)) annotation (
    Placement(visible = true, transformation(origin = {114, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qf_SD_PNT_W annotation (
    Placement(visible = true, transformation(origin = {370, -134}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorqueAdaptor2(use_a = false, use_w = false) annotation (
    Placement(visible = true, transformation(origin = {318, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_TM_PNT_TC_radps annotation (
    Placement(visible = true, transformation(origin = {380, 30}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, 40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput trq_TM_PNT_TC_Nm annotation (
    Placement(visible = true, transformation(origin = {370, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorqueAdaptor1(use_a = false, use_w = false) annotation (
    Placement(visible = true, transformation(origin = {-318, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput trq_TM_PNT_FW_Nm annotation (
    Placement(visible = true, transformation(origin = {-370, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_TM_PNT_FW_radps annotation (
    Placement(visible = true, transformation(origin = {-380, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = -1) annotation (
    Placement(visible = true, transformation(origin = {344, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain5(k = -1) annotation (
    Placement(visible = true, transformation(origin = {-344, -30}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-344, 30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator2(k = 1, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {344, 30}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Max max1 annotation (
    Placement(visible = true, transformation(origin = {50, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation (
    Placement(visible = true, transformation(origin = {-202, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.OilSeal OS2(OilSeal_friction_filename = "OS2.txt") annotation (
    Placement(visible = true, transformation(origin = {-202, 90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N11(BRG_Friction_Filename = "N11.txt") annotation (
    Placement(visible = true, transformation(origin = {-280, 90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation (
    Placement(visible = true, transformation(origin = {-280, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {-240, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-380, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression28(y = nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-240, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor(use_a = false, use_w = true) annotation (
    Placement(visible = true, transformation(origin = {-318, 90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_OP_radps annotation (
    Placement(visible = true, transformation(origin = {-370, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = -1) annotation (
    Placement(visible = true, transformation(origin = {-344, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_OP_Nm annotation (
    Placement(visible = true, transformation(origin = {-380, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qf_GB_PNT_W annotation (
    Placement(visible = true, transformation(origin = {370, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = +1, k2 = +1) annotation (
    Placement(visible = true, transformation(origin = {-150, -180}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D1(fileName = currDir + "/Tables/" + StartDeviceFileName, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = CapacityCoefficientTabName, tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {10, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D(fileName = currDir + "/Tables/" + StartDeviceFileName, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = TorqueRatioTabName, tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {150, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {150, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(k1 = +1, k2 = +1) annotation (
    Placement(visible = true, transformation(origin = {330, -134}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
equation
  connect(const.y, max1.u2) annotation (
    Line(points = {{79, -96}, {70, -96}, {70, -86}, {62, -86}}, color = {0, 0, 127}));
  connect(max1.y, division1.u2) annotation (
    Line(points = {{39, -80}, {30, -80}, {30, -72}, {22, -72}}, color = {0, 0, 127}));
  connect(speedSensor1.w, max1.u1) annotation (
    Line(points = {{-70, -43}, {-70, -112}, {120, -112}, {120, -74}, {62, -74}}, color = {0, 0, 127}));
  connect(gain4.y, trq_TM_PNT_TC_Nm) annotation (
    Line(points = {{351, -30}, {370, -30}}, color = {0, 0, 127}));
  connect(angleToTorqueAdaptor2.tau, gain4.u) annotation (
    Line(points = {{321, -8}, {330, -8}, {330, -30}, {337, -30}}, color = {0, 0, 127}));
  connect(integrator2.y, angleToTorqueAdaptor2.phi) annotation (
    Line(points = {{337, 30}, {330, 30}, {330, 8}, {321, 8}}, color = {0, 0, 127}));
  connect(w_TM_PNT_TC_radps, integrator2.u) annotation (
    Line(points = {{380, 30}, {351, 30}}, color = {0, 0, 127}));
  connect(gain5.y, trq_TM_PNT_FW_Nm) annotation (
    Line(points = {{-351, -30}, {-370, -30}}, color = {0, 0, 127}));
  connect(angleToTorqueAdaptor1.tau, gain5.u) annotation (
    Line(points = {{-321, -8}, {-330, -8}, {-330, -30}, {-337, -30}}, color = {0, 0, 127}));
  connect(integrator1.y, angleToTorqueAdaptor1.phi) annotation (
    Line(points = {{-337, 30}, {-330, 30}, {-330, 8}, {-321, 8}}, color = {0, 0, 127}));
  connect(w_TM_PNT_FW_radps, integrator1.u) annotation (
    Line(points = {{-380, 30}, {-351, 30}}, color = {0, 0, 127}));
  connect(gain2.y, product1.u2) annotation (
    Line(points = {{79, 0}, {69.5, 0}, {69.5, -12}, {62, -12}}, color = {0, 0, 127}));
  connect(speedSensor1.w, gain2.u) annotation (
    Line(points = {{-70, -43}, {-70, -112}, {120, -112}, {120, 0}, {102, 0}}, color = {0, 0, 127}));
  connect(gain2.y, product1.u1) annotation (
    Line(points = {{79, 0}, {62, 0}}, color = {0, 0, 127}));
  connect(torqueSensor2.flange_b, angleToTorqueAdaptor2.flange) annotation (
    Line(points = {{278, 0}, {316, 0}}));
  connect(ClutchLU.flange_b, inertia_out.flange_a) annotation (
    Line(points = {{40, 124}, {104, 124}}));
  connect(inertia_out.flange_b, LUdamper.flange_a) annotation (
    Line(points = {{124, 124}, {134, 124}}));
  connect(torqueSensor1.tau, product5.u2) annotation (
    Line(points = {{-88, -11}, {-88, -152}, {38, -152}}, color = {0, 0, 127}));
  connect(speedSensor2.flange, torqueSensor2.flange_b) annotation (
    Line(points = {{278, -22}, {278, 0}}));
  connect(torque1.flange, torqueSensor2.flange_a) annotation (
    Line(points = {{250, 0}, {258, 0}}));
  connect(torqueSensor2.tau, product4.u2) annotation (
    Line(points = {{260, -11}, {260, -94.5}, {202, -94.5}, {202, -94}}, color = {0, 0, 127}));
  connect(tau_lockup_cap, ClutchLU.tau_clutch_cap) annotation (
    Line(points = {{-380, 150}, {30, 150}, {30, 136}}, color = {0, 0, 127}));
  connect(speedSensor2.w, division1.u1) annotation (
    Line(points = {{278, -43}, {278, -60}, {22, -60}}, color = {0, 0, 127}));
  connect(product3.y, torque1.tau) annotation (
    Line(points = {{221, 0}, {228, 0}}, color = {0, 0, 127}));
  connect(gain3.y, product3.u1) annotation (
    Line(points = {{161, 30}, {179.5, 30}, {179.5, 6}, {198, 6}}, color = {0, 0, 127}));
  connect(speedSensor2.w, product4.u1) annotation (
    Line(points = {{278, -43}, {278, -106}, {202, -106}}, color = {0, 0, 127}));
  connect(speedSensor1.w, product5.u1) annotation (
    Line(points = {{-70, -43}, {-70, -140}, {38, -140}}, color = {0, 0, 127}));
  connect(add1.y, abs1.u) annotation (
    Line(points = {{201, -140}, {218, -140}}, color = {0, 0, 127}));
  connect(product4.y, add1.u1) annotation (
    Line(points = {{179, -100}, {150, -100}, {150, -134}, {178, -134}}, color = {0, 0, 127}));
  connect(product5.y, add1.u2) annotation (
    Line(points = {{61, -146}, {178, -146}}, color = {0, 0, 127}));
  connect(Shaft.flange_b, inertia_in.flange_a) annotation (
    Line(points = {{-146, 0}, {-132, 0}}));
  connect(product1.y, product2.u2) annotation (
    Line(points = {{39, -6}, {30, -6}, {30, 14}, {70, 14}, {70, 24}, {78, 24}}, color = {0, 0, 127}));
  connect(gain1.y, product2.u1) annotation (
    Line(points = {{61, 36}, {78, 36}}, color = {0, 0, 127}));
  connect(gain3.u, product2.y) annotation (
    Line(points = {{138, 30}, {101, 30}}, color = {0, 0, 127}));
  connect(product2.y, torque2.tau) annotation (
    Line(points = {{101, 30}, {120, 30}, {120, 60}, {-30, 60}, {-30, 0}, {-38, 0}}, color = {0, 0, 127}));
  connect(fixed.flange, OS2.support) annotation (
    Line(points = {{-202, 70}, {-202, 80}}));
  connect(fixed1.flange, N11.support) annotation (
    Line(points = {{-280, 70}, {-280, 80}}));
  connect(OS2.flange_b, N11.flange_a) annotation (
    Line(points = {{-212, 90}, {-270, 90}}));
  connect(constant1.y, N11.Fr) annotation (
    Line(points = {{-251, 120}, {-278, 120}, {-278, 102}}, color = {0, 255, 0}));
  connect(N11.Fth, constant1.y) annotation (
    Line(points = {{-268, 98}, {-268, 99}, {-260, 99}, {-260, 120}, {-251, 120}}, color = {0, 255, 0}));
  connect(realExpression28.y, N11.nu_oil_m2ps) annotation (
    Line(points = {{-251, 70}, {-260, 70}, {-260, 84}, {-268, 84}}, color = {0, 255, 0}));
  connect(OS2.flange_a, Shaft.flange_a) annotation (
    Line(points = {{-192, 90}, {-180, 90}, {-180, 0}, {-166, 0}}));
  connect(torqueToAngleAdaptor.flange, N11.flange_b) annotation (
    Line(points = {{-316, 90}, {-290, 90}}));
  connect(gain.y, torqueToAngleAdaptor.tau) annotation (
    Line(points = {{-337, 60}, {-329.5, 60}, {-329.5, 82}, {-321, 82}}, color = {0, 0, 127}));
  connect(torqueToAngleAdaptor.w, w_TM_PNT_OP_radps) annotation (
    Line(points = {{-321, 95}, {-330, 95}, {-330, 120}, {-370, 120}}, color = {0, 0, 127}));
  connect(trq_TM_PNT_OP_Nm, gain.u) annotation (
    Line(points = {{-380, 60}, {-351, 60}}, color = {0, 0, 127}));
  connect(N11.PHI_W, add2.u2) annotation (
    Line(points = {{-291, 82}, {-300, 82}, {-300, -186}, {-162, -186}}, color = {191, 0, 0}));
  connect(add2.y, Qf_GB_PNT_W) annotation (
    Line(points = {{-139, -180}, {370, -180}}, color = {191, 0, 0}));
  connect(combiTable2D1.y, gain1.u) annotation (
    Line(points = {{21, 36}, {38, 36}}, color = {0, 0, 127}));
  connect(combiTable2D1.u1, division1.y) annotation (
    Line(points = {{-2, 42}, {-20, 42}, {-20, -66}, {-1, -66}}, color = {0, 0, 127}));
  connect(combiTable2D.y, product3.u2) annotation (
    Line(points = {{161, -26}, {180, -26}, {180, -6}, {198, -6}}, color = {0, 0, 127}));
  connect(combiTable2D.u1, division1.y) annotation (
    Line(points = {{138, -20}, {-10, -20}, {-10, -66}, {-1, -66}}, color = {0, 0, 127}));
  connect(realExpression1.y, combiTable2D1.u2) annotation (
    Line(points = {{-1, 10}, {-10, 10}, {-10, 30}, {-2, 30}}, color = {0, 255, 0}));
  connect(realExpression2.y, combiTable2D.u2) annotation (
    Line(points = {{139, -50}, {130, -50}, {130, -32}, {138, -32}}, color = {0, 255, 0}));
  connect(angleToTorqueAdaptor1.flange, Shaft.flange_a) annotation (
    Line(points = {{-316, 0}, {-166, 0}}));
  connect(inertia_in.flange_b, torqueSensor1.flange_a) annotation (
    Line(points = {{-112, 0}, {-90, 0}}));
  connect(torqueSensor1.flange_b, torque2.flange) annotation (
    Line(points = {{-70, 0}, {-60, 0}}));
  connect(speedSensor1.flange, torqueSensor1.flange_b) annotation (
    Line(points = {{-70, -22}, {-70, 0}}));
  connect(OS2.PHI_W, add2.u1) annotation (
    Line(points = {{-212, 82}, {-220, 82}, {-220, -174}, {-162, -174}}, color = {191, 0, 0}));
  connect(LUdamper.flange_b, angleToTorqueAdaptor2.flange) annotation (
    Line(points = {{154, 124}, {308, 124}, {308, 0}, {316, 0}}));
  connect(ClutchLU.flange_a, inertia_in.flange_b) annotation (
    Line(points = {{20, 124}, {-100, 124}, {-100, 0}, {-112, 0}}));
  connect(abs1.y, add.u2) annotation (
    Line(points = {{242, -140}, {318, -140}, {318, -140}, {318, -140}}, color = {191, 0, 0}));
  connect(ClutchLU.PHI_W, add.u1) annotation (
    Line(points = {{40, 114}, {60, 114}, {60, 88}, {296, 88}, {296, -128}, {318, -128}, {318, -128}}, color = {191, 0, 0}));
  connect(add.y, Qf_SD_PNT_W) annotation (
    Line(points = {{342, -134}, {370, -134}}, color = {191, 0, 0}));
  annotation (
    Icon(graphics={  Rectangle(origin = {0, 50}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -200}}), Text(origin = {-18, -172}, lineColor = {0, 0, 255}, extent = {{-122, 22}, {158, -28}}, textString = "%name"), Ellipse(origin = {10, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 120}, {29, 10}}, startAngle = 90, endAngle = 270), Ellipse(origin = {-14, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{64, 120}, {-25, 10}}, startAngle = -90, endAngle = 90), Ellipse(origin = {-16, -100}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{66, 90}, {-23, -20}}, startAngle = -90, endAngle = 90), Ellipse(origin = {14, -100}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-64, 90}, {25, -20}}, startAngle = 90, endAngle = 270), Ellipse(extent = {{-42, 96}, {-42, 96}}, endAngle = 360), Ellipse(extent = {{-81, 149}, {81, -149}}, endAngle = 360), Rectangle(origin = {8, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-108, 25}, {-7.6, -25}}), Rectangle(origin = {-8, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{108, 25}, {7.6, -25}}), Text(origin = {28, 176}, extent = {{-10, 10}, {70, -20}}, textString = "LockUp"), Text(origin = {-115, -60}, extent = {{-19, 20}, {19, -20}}, textString = "T"), Text(origin = {-117, 10}, extent = {{-19, 20}, {19, -20}}, textString = "w"), Text(origin = {121, -18}, extent = {{-19, 20}, {19, -20}}, textString = "T"), Text(origin = {119, 78}, extent = {{-19, 20}, {19, -20}}, textString = "w"), Text(origin = {119, -78}, extent = {{-19, 20}, {41, -22}}, textString = "QfSD"), Text(origin = {-117, 146}, extent = {{-19, 20}, {19, -20}}, textString = "w"), Text(origin = {-117, 86}, extent = {{-19, 20}, {19, -20}}, textString = "T"), Text(origin = {-121, -108}, extent = {{-19, 20}, {19, -20}}, textString = "nu"), Text(origin = {119, -120}, extent = {{-19, 20}, {41, -22}}, textString = "QfGB")}, coordinateSystem(extent = {{-100, -150}, {100, 150}}, initialScale = 0.1)),
    Diagram(coordinateSystem(extent = {{-360, -200}, {360, 180}})),
    __OpenModelica_commandLineOptions = "",
    version = "",
    uses(Modelica(version = "3.2.3")));
end TorqueConverter;
