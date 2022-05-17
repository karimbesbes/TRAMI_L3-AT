within TRAMI_L3_STEP_AT.TransMission.Mechanics;
model TransmissionGear
  parameter Real Oil_Viscosity_Breakpoint[:];
  constant Real BRG_DummyLoad = 0;
  Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_TC_Nm annotation (
    Placement(visible = true, transformation(origin = {-2360, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_TM_PNT_AT_Gear_radps annotation (
    Placement(visible = true, transformation(origin = {2360, 20}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, 80}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_clutch_cap[6] annotation (
    Placement(visible = true, transformation(origin = {-2360, 190}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 220}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ratio_AT annotation (
    Placement(visible = true, transformation(origin = {-2360, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput p_line_Pa annotation (
    Placement(visible = true, transformation(origin = {-2360, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_TC_radps annotation (
    Placement(visible = true, transformation(origin = {-2350, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput trq_TM_PNT_AT_GEAR_Nm annotation (
    Placement(visible = true, transformation(origin = {2350, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-2360, -240}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -240}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qf_GB_PNT_W annotation (
    Placement(visible = true, transformation(origin = {2350, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor1(use_a = false, use_w = true) annotation (
    Placement(visible = true, transformation(origin = {-2258, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorqueAdaptor2(use_a = false, use_w = false) annotation (
    Placement(visible = true, transformation(origin = {2258, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Carrier_P1(J = 0.002) annotation (
    Placement(visible = true, transformation(origin = {-1210, 240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_SunGear_P1(J = 0.0001, phi(displayUnit = "rad", fixed = true, start = 0), w(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {-1490, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_RingGear_P1(J = 0.002, w(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {-1050, 360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_PlanetGear_P1(J = 0.0001) annotation (
    Placement(visible = true, transformation(origin = {-1210, 332}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_SunGear_P2(J = 0.0001) annotation (
    Placement(visible = true, transformation(origin = {-250, 200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_RingGear_P2(J = 0.002, phi(displayUnit = "rad", fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {-690, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_PlanetGear_P2(J = 0.0001) annotation (
    Placement(visible = true, transformation(origin = {-530, 392}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Carrier_P2(J = 0.002, phi(displayUnit = "rad", fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {-530, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_SunGear_P3(J = 0.0001, w(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {810, 200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Carrier_P3(J = 0.002) annotation (
    Placement(visible = true, transformation(origin = {530, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_PlanetGear_P3(J = 0.0001) annotation (
    Placement(visible = true, transformation(origin = {530, 392}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_RingGear_P3(J = 0.002) annotation (
    Placement(visible = true, transformation(origin = {370, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_PlanetGear_P4(J = 0.0001) annotation (
    Placement(visible = true, transformation(origin = {1270, 392}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_RingGear_P4(J = 0.002) annotation (
    Placement(visible = true, transformation(origin = {1430, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_Carrier_P4(J = 0.002) annotation (
    Placement(visible = true, transformation(origin = {1270, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia_SunGear_P4(J = 0.0001) annotation (
    Placement(visible = true, transformation(origin = {990, 200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = -1) annotation (
    Placement(visible = true, transformation(origin = {-2310, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = -1) annotation (
    Placement(visible = true, transformation(origin = {2310, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator2(k = 1, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {2310, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation (
    Placement(visible = true, transformation(origin = {20, 596}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch ClutchC2 annotation (
    Placement(visible = true, transformation(origin = {-910, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch BrakeB2 annotation (
    Placement(visible = true, transformation(origin = {-50, 570}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch BrakeB3 annotation (
    Placement(visible = true, transformation(origin = {160, 570}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed3 annotation (
    Placement(visible = true, transformation(origin = {-1400, 596}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch ClutchC1 annotation (
    Placement(visible = true, transformation(origin = {-1640, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch BrakeB1 annotation (
    Placement(visible = true, transformation(origin = {-1470, 570}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Clutch ClutchC3 annotation (
    Placement(visible = true, transformation(origin = {1690, 450}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR1(SealRing_friction_filename = "SR1_1.txt") annotation (
    Placement(visible = true, transformation(origin = {-2110, 9.99201e-16}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR2(SealRing_friction_filename = "SR1_2.txt") annotation (
    Placement(visible = true, transformation(origin = {-2080, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR3(SealRing_friction_filename = "SR1_3.txt") annotation (
    Placement(visible = true, transformation(origin = {-2050, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR4(SealRing_friction_filename = "SR1_4.txt") annotation (
    Placement(visible = true, transformation(origin = {-2020, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR5(SealRing_friction_filename = "SR1_5.txt") annotation (
    Placement(visible = true, transformation(origin = {-1990, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR6(SealRing_friction_filename = "SR2_1.txt") annotation (
    Placement(visible = true, transformation(origin = {-1220, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR7(SealRing_friction_filename = "SR2_2.txt") annotation (
    Placement(visible = true, transformation(origin = {-1190, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR8(SealRing_friction_filename = "SR2_3.txt") annotation (
    Placement(visible = true, transformation(origin = {-1160, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR9(SealRing_friction_filename = "SR2_4.txt") annotation (
    Placement(visible = true, transformation(origin = {-1130, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR10(SealRing_friction_filename = "SR3_1.txt") annotation (
    Placement(visible = true, transformation(origin = {2010, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR11(SealRing_friction_filename = "SR3_2.txt") annotation (
    Placement(visible = true, transformation(origin = {2040, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR12(SealRing_friction_filename = "SR4_1.txt") annotation (
    Placement(visible = true, transformation(origin = {-1800, 370}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.SealRing SR13(SealRing_friction_filename = "SR4_2.txt") annotation (
    Placement(visible = true, transformation(origin = {-1770, 370}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN1(BRG_Friction_Filename = "SN1.txt") annotation (
    Placement(visible = true, transformation(origin = {-1870, 240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN2(BRG_Friction_Filename = "SN2.txt") annotation (
    Placement(visible = true, transformation(origin = {-1640, 240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN3(BRG_Friction_Filename = "SN3.txt") annotation (
    Placement(visible = true, transformation(origin = {-910, 240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN5(BRG_Friction_Filename = "SN5.txt") annotation (
    Placement(visible = true, transformation(origin = {-770, 240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN6(BRG_Friction_Filename = "SN6.txt") annotation (
    Placement(visible = true, transformation(origin = {-150, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN7(BRG_Friction_Filename = "SN7.txt") annotation (
    Placement(visible = true, transformation(origin = {60, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN8(BRG_Friction_Filename = "SN8.txt") annotation (
    Placement(visible = true, transformation(origin = {270, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN9(BRG_Friction_Filename = "SN9.txt") annotation (
    Placement(visible = true, transformation(origin = {910, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN10(BRG_Friction_Filename = "SN10.txt") annotation (
    Placement(visible = true, transformation(origin = {1550, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_ThrustNeedle SN11(BRG_Friction_Filename = "SN11.txt") annotation (
    Placement(visible = true, transformation(origin = {1690, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N1(BRG_Friction_Filename = "N1.txt") annotation (
    Placement(visible = true, transformation(origin = {-1870, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N2(BRG_Friction_Filename = "N2.txt") annotation (
    Placement(visible = true, transformation(origin = {-1570, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N3(BRG_Friction_Filename = "N3.txt") annotation (
    Placement(visible = true, transformation(origin = {-980, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N4(BRG_Friction_Filename = "N4.txt") annotation (
    Placement(visible = true, transformation(origin = {-660, 120}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N5(BRG_Friction_Filename = "N5.txt") annotation (
    Placement(visible = true, transformation(origin = {-500, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N6(BRG_Friction_Filename = "N6.txt") annotation (
    Placement(visible = true, transformation(origin = {-570, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N7(BRG_Friction_Filename = "N7.txt") annotation (
    Placement(visible = true, transformation(origin = {510, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N8(BRG_Friction_Filename = "N8.txt") annotation (
    Placement(visible = true, transformation(origin = {370, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N9(BRG_Friction_Filename = "N9.txt") annotation (
    Placement(visible = true, transformation(origin = {1830, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N10(BRG_Friction_Filename = "N10.txt") annotation (
    Placement(visible = true, transformation(origin = {1940, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N12_15(BRG_Friction_Filename = "N12_15.txt") annotation (
    Placement(visible = true, transformation(origin = {-1290, 190}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N16_19(BRG_Friction_Filename = "N16_19.txt") annotation (
    Placement(visible = true, transformation(origin = {-450, 250}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N20_23(BRG_Friction_Filename = "N20_23.txt") annotation (
    Placement(visible = true, transformation(origin = {610, 250}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_RadialNeedle N24_27(BRG_Friction_Filename = "N24_27.txt") annotation (
    Placement(visible = true, transformation(origin = {1190, 250}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_Angular BB1(BRG_Friction_Filename = "BB1.txt") annotation (
    Placement(visible = true, transformation(origin = {2150, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed4 annotation (
    Placement(visible = true, transformation(origin = {-1870, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed6 annotation (
    Placement(visible = true, transformation(origin = {-1936, 240}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-1910, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {-1910, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-1910, 220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-1680, 220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {-1610, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression5(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-1610, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {-1020, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression7(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-1020, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression8(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-950, 220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression9(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-810, 220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const5(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {-610, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression10(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-610, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression11(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-540, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const6(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {-540, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const7(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {-700, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression12(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-700, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression13(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-190, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression14(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {20, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression15(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {230, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed7 annotation (
    Placement(visible = true, transformation(origin = {230, 596}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const11(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {470, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression16(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {470, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression17(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {326, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const12(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {330, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression18(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {870, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression19(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {1510, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression20(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {1650, 280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression21(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {1790, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const16(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {1790, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression22(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {1900, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const17(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {1900, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const18(k = BRG_DummyLoad) annotation (
    Placement(visible = true, transformation(origin = {2110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression23(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {2110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed8 annotation (
    Placement(visible = true, transformation(origin = {1940, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.OilSeal OS1(OilSeal_friction_filename = "OS1.txt") annotation (
    Placement(visible = true, transformation(origin = {2210, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed9 annotation (
    Placement(visible = true, transformation(origin = {2040, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed10 annotation (
    Placement(visible = true, transformation(origin = {2150, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed11 annotation (
    Placement(visible = true, transformation(origin = {2210, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed12 annotation (
    Placement(visible = true, transformation(origin = {-840, 596}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression25(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-930, 570}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression26(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {1790, 370}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed13 annotation (
    Placement(visible = true, transformation(origin = {1876, 350}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression realExpression31(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-950, 360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression32(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-1510, 540}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D stirring2D(Stirring_Resistance_Filename = "Stirr1.txt") annotation (
    Placement(visible = true, transformation(origin = {-890, 550}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D stirring2D1(Stirring_Resistance_Filename = "Stirr2.txt") annotation (
    Placement(visible = true, transformation(origin = {1830, 350}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring3D stirring3D_C1(Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, Stirring_Resistance_Filename = "C1.txt") annotation (
    Placement(visible = true, transformation(origin = {-1640, 340}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring3D stirring3D_C2(Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, Stirring_Resistance_Filename = "C2.txt") annotation (
    Placement(visible = true, transformation(origin = {-910, 340}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring3D stirring3D_C3(Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, Stirring_Resistance_Filename = "C3.txt") annotation (
    Placement(visible = true, transformation(origin = {1690, 400}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D_Brake stirring2D_B1(Stirring_Resistance_Filename = "B1.txt") annotation (
    Placement(visible = true, transformation(origin = {-1470, 520}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D_Brake stirring2D_B2(Stirring_Resistance_Filename = "B2.txt") annotation (
    Placement(visible = true, transformation(origin = {-50, 520}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.Stirring2D_Brake stirring2D_B3(Stirring_Resistance_Filename = "B3.txt") annotation (
    Placement(visible = true, transformation(origin = {160, 520}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression33(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-1680, 360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression34(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-90, 540}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression35(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {120, 540}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression36(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {1650, 420}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.DeMultiplex6 tau_clutch_cap1 annotation (
    Placement(visible = true, transformation(origin = {-2310, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression37(y = tau_clutch_cap1.y1[1]) annotation (
    Placement(visible = true, transformation(origin = {-90, 590}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression38(y = tau_clutch_cap1.y2[1]) annotation (
    Placement(visible = true, transformation(origin = {120, 590}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression39(y = tau_clutch_cap1.y3[1]) annotation (
    Placement(visible = true, transformation(origin = {-1510, 590}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression40(y = tau_clutch_cap1.y4[1]) annotation (
    Placement(visible = true, transformation(origin = {1650, 470}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression41(y = tau_clutch_cap1.y5[1]) annotation (
    Placement(visible = true, transformation(origin = {-950, 430}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression42(y = tau_clutch_cap1.y6[1]) annotation (
    Placement(visible = true, transformation(origin = {-1680, 420}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetPlanet Planet_Planet_P1(Gear_Friction_Filename = "PS1s.txt", Gear_K_Filename = "PS1sK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = -26 / 46, tanhCoeff = 100) annotation (
    Placement(visible = true, transformation(origin = {-1420, 200}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetRing Planet_Ring_P1(Gear_Friction_Filename = "PS1r.txt", Gear_K_Filename = "PS1rK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = 98 / 26, tanhCoeff = 100) annotation (
    Placement(visible = true, transformation(origin = {-1140, 320}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetPlanet Planet_Planet_P2(Gear_Friction_Filename = "PS2s.txt", Gear_K_Filename = "PS2sK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = -27 / 44, tanhCoeff = 100) annotation (
    Placement(visible = true, transformation(origin = {-320, 260}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetRing Planet_Ring_P2(Gear_Friction_Filename = "PS2r.txt", Gear_K_Filename = "PS2rK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = 100 / 27, tanhCoeff = 100) annotation (
    Placement(visible = true, transformation(origin = {-600, 380}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetPlanet Planet_Planet_P3(Gear_Friction_Filename = "PS3s.txt", Gear_K_Filename = "PS3sK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = -23 / 37, tanhCoeff = 100) annotation (
    Placement(visible = true, transformation(origin = {740, 260}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetRing Planet_Ring_P3(Gear_Friction_Filename = "PS3r.txt", Gear_K_Filename = "PS3rK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = 83 / 23, tanhCoeff = 100) annotation (
    Placement(visible = true, transformation(origin = {460, 380}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetPlanet Planet_Planet_P4(Gear_Friction_Filename = "PS4s.txt", Gear_K_Filename = "PS4sK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = -26 / 34, tanhCoeff = 100) annotation (
    Placement(visible = true, transformation(origin = {1060, 260}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.PlanetRing Planet_Ring_P4(Gear_Friction_Filename = "PS4r.txt", Gear_K_Filename = "PS4rK.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, gearRatio = 86 / 26, tanhCoeff = 100) annotation (
    Placement(visible = true, transformation(origin = {1340, 380}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression43(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-590, 330}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression44(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {470, 330}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression45(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {1330, 330}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression46(y = Nu_oil_m2ps) annotation (
    Placement(visible = true, transformation(origin = {-1150, 270}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum Sum_Brg(nu = 25) annotation (
    Placement(visible = true, transformation(origin = {2250, -290}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum Sum_Stirring(nu = 8) annotation (
    Placement(visible = true, transformation(origin = {2250, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum Sum_ClutchLoss(nu = 6) annotation (
    Placement(visible = true, transformation(origin = {2250, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum Sum_GearLoss(nu = 8) annotation (
    Placement(visible = true, transformation(origin = {2250, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum Sum_SealRing(nu = 13) annotation (
    Placement(visible = true, transformation(origin = {2250, -330}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum multiSum(nu = 6) annotation (
    Placement(visible = true, transformation(origin = {2310, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.BrgLoadDistribution_TM brgLoadDistribution_TM annotation (
    Placement(visible = true, transformation(origin = {-1723.66, 796.75}, extent = {{36.7778, -82.75}, {-36.7778, 82.75}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor3 annotation (
    Placement(visible = true, transformation(origin = {680, 250}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor4 annotation (
    Placement(visible = true, transformation(origin = {1120, 250}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor2 annotation (
    Placement(visible = true, transformation(origin = {-380, 250}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor1 annotation (
    Placement(visible = true, transformation(origin = {-1360, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain trq2force1(k = 1000 / 44.925) annotation (
    Placement(visible = true, transformation(origin = {-1330, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain trq2force2(k = 1000 / 47.43) annotation (
    Placement(visible = true, transformation(origin = {-410, 200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain trq2force3(k = 1000 / 45.2) annotation (
    Placement(visible = true, transformation(origin = {650, 200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain trq2force4(k = 1000 / 43.395) annotation (
    Placement(visible = true, transformation(origin = {1150, 200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation (
    Placement(visible = true, transformation(origin = {650, 230}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation (
    Placement(visible = true, transformation(origin = {1150, 230}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const13(k = 0) annotation (
    Placement(visible = true, transformation(origin = {-410, 230}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const4(k = 0) annotation (
    Placement(visible = true, transformation(origin = {-1330, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay unitDelay1(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-1368, 160}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  Modelica.Blocks.Discrete.UnitDelay unitDelay2(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-372, 220}, extent = {{8, -8}, {-8, 8}}, rotation = 90)));
  Modelica.Blocks.Discrete.UnitDelay unitDelay3(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {688, 220}, extent = {{8, -8}, {-8, 8}}, rotation = 90)));
  Modelica.Blocks.Discrete.UnitDelay unitDelay4(samplePeriod = 0.01, startTime = 0, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {1112, 220}, extent = {{8, -8}, {-8, 8}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation (
    Placement(visible = true, transformation(origin = {2010, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed2 annotation (
    Placement(visible = true, transformation(origin = {-2110, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed5 annotation (
    Placement(visible = true, transformation(origin = {-2080, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed14 annotation (
    Placement(visible = true, transformation(origin = {-2050, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed15 annotation (
    Placement(visible = true, transformation(origin = {-2020, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed16 annotation (
    Placement(visible = true, transformation(origin = {-1990, 56}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.HydraulicSystem hydraulicSystem(TPMAP_CL1_Filename = "TPMAP_CL1.txt", TPMAP_CL2_Filename = "TPMAP_CL2.txt", TPMAP_CL3_Filename = "TPMAP_CL3.txt", TPMAP_LC_Filename = "TPMAP_LC.txt") annotation (
    Placement(visible = true, transformation(origin = {-2254, 100}, extent = {{-14, -40}, {14, 60}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.SealRingPrsDistribution sealRingPrsDistribution annotation (
    Placement(visible = true, transformation(origin = {-2194, 100}, extent = {{-14, -40}, {14, 40}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_lockup_cap annotation (
    Placement(visible = true, transformation(origin = {-2360, 130}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 150}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = tau_clutch_cap1.y6[1]) annotation (
    Placement(visible = true, transformation(origin = {-2310, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = tau_clutch_cap1.y5[1]) annotation (
    Placement(visible = true, transformation(origin = {-2310, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression6(y = tau_clutch_cap1.y4[1]) annotation (
    Placement(visible = true, transformation(origin = {-2310, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression24(y = p_line_Pa) annotation (
    Placement(visible = true, transformation(origin = {-2310, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed17 annotation (
    Placement(visible = true, transformation(origin = {-1800, 416}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed18 annotation (
    Placement(visible = true, transformation(origin = {-1770, 416}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  connect(gain3.y, torqueToAngleAdaptor1.tau) annotation (
    Line(points = {{-2299, -20}, {-2280, -20}, {-2280, -8}, {-2261, -8}}, color = {0, 0, 127}));
  connect(trq_TM_PNT_TC_Nm, gain3.u) annotation (
    Line(points = {{-2360, -20}, {-2322, -20}}, color = {0, 0, 127}));
  connect(w_TM_PNT_TC_radps, torqueToAngleAdaptor1.w) annotation (
    Line(points = {{-2350, 20}, {-2280, 20}, {-2280, 6}, {-2261, 6}, {-2261, 5}}, color = {0, 0, 127}));
  connect(fixed6.flange, SN1.flange_a) annotation (
    Line(points = {{-1936, 240}, {-1881, 240}}));
  connect(SN5.flange_a, ClutchC2.flange_b) annotation (
    Line(points = {{-781, 240}, {-840, 240}, {-840, 400}, {-900, 400}}));
  connect(ClutchC2.flange_b, inertia_RingGear_P2.flange_a) annotation (
    Line(points = {{-900, 400}, {-700, 400}}));
  connect(N1.flange_b, SN2.flange_a) annotation (
    Line(points = {{-1860, 0}, {-1840, 0}, {-1840, 240}, {-1651, 240}}));
  connect(N1.flange_b, N2.flange_a) annotation (
    Line(points = {{-1860, 0}, {-1580, 0}}));
  connect(N2.flange_b, inertia_SunGear_P1.flange_a) annotation (
    Line(points = {{-1560, 0}, {-1520, 0}, {-1520, 150}, {-1500, 150}}));
  connect(SR9.flange_b, N3.flange_a) annotation (
    Line(points = {{-1120, 0}, {-990, 0}}));
  connect(inertia_Carrier_P1.flange_b, N3.support) annotation (
    Line(points = {{-1200, 240}, {-980, 240}, {-980, 10}}));
  connect(inertia_Carrier_P1.flange_b, SR9.support) annotation (
    Line(points = {{-1200, 240}, {-980, 240}, {-980, 60}, {-1130, 60}, {-1130, 10}}));
  connect(realExpression9.y, SN5.nu_oil_m2ps) annotation (
    Line(points = {{-799, 220}, {-790, 220}, {-790, 234}, {-782, 234}}, color = {0, 255, 0}));
  connect(inertia_Carrier_P1.flange_b, ClutchC2.flange_a) annotation (
    Line(points = {{-1200, 240}, {-980, 240}, {-980, 400}, {-920, 400}}));
  connect(inertia_Carrier_P1.flange_b, SN3.flange_a) annotation (
    Line(points = {{-1200, 240}, {-921, 240}}));
  connect(N3.flange_b, N6.flange_a) annotation (
    Line(points = {{-970, 0}, {-580, 0}}));
  connect(ClutchC2.flange_b, N5.flange_a) annotation (
    Line(points = {{-900, 400}, {-840, 400}, {-840, 60}, {-510, 60}}));
  connect(ClutchC2.flange_b, N6.support) annotation (
    Line(points = {{-900, 400}, {-840, 400}, {-840, 60}, {-570, 60}, {-570, 10}}));
  connect(const7.y, N4.Fr) annotation (
    Line(points = {{-689, 90}, {-662, 90}, {-662, 108}}, color = {0, 255, 0}));
  connect(const7.y, N4.Fth) annotation (
    Line(points = {{-689, 90}, {-680, 90}, {-680, 112}, {-672, 112}}, color = {0, 255, 0}));
  connect(ClutchC2.flange_b, SN3.flange_b) annotation (
    Line(points = {{-900, 400}, {-840, 400}, {-840, 240}, {-900, 240}}));
  connect(SN6.flange_b, inertia_SunGear_P2.flange_b) annotation (
    Line(points = {{-140, 300}, {-120, 300}, {-120, 200}, {-240, 200}}));
  connect(N4.flange_b, inertia_SunGear_P2.flange_b) annotation (
    Line(points = {{-650, 120}, {-120, 120}, {-120, 200}, {-240, 200}}));
  connect(N5.support, inertia_SunGear_P2.flange_b) annotation (
    Line(points = {{-500, 70}, {-500, 120}, {-120, 120}, {-120, 200}, {-240, 200}}));
  connect(SN7.flange_b, inertia_RingGear_P3.flange_a) annotation (
    Line(points = {{70, 300}, {90, 300}, {90, 400}, {360, 400}}));
  connect(SN7.flange_b, SN8.flange_a) annotation (
    Line(points = {{70, 300}, {259, 300}}));
  connect(inertia_SunGear_P2.flange_b, SN7.flange_a) annotation (
    Line(points = {{-240, 200}, {-120, 200}, {-120, 300}, {49, 300}}));
  connect(SN8.flange_b, inertia_Carrier_P3.flange_a) annotation (
    Line(points = {{280, 300}, {520, 300}}));
  connect(N8.support, N7.flange_a) annotation (
    Line(points = {{370, 10}, {370, 60}, {500, 60}}));
  connect(N6.flange_b, N8.flange_a) annotation (
    Line(points = {{-560, 0}, {360, 0}}));
  connect(realExpression16.y, N7.nu_oil_m2ps) annotation (
    Line(points = {{481, 80}, {490, 80}, {490, 66}, {498, 66}}, color = {0, 255, 0}));
  connect(N7.flange_b, inertia_SunGear_P3.flange_b) annotation (
    Line(points = {{520, 60}, {860, 60}, {860, 200}, {820, 200}}));
  connect(N7.flange_b, inertia_SunGear_P4.flange_a) annotation (
    Line(points = {{520, 60}, {860, 60}, {860, 200}, {980, 200}}));
  connect(realExpression18.y, SN9.nu_oil_m2ps) annotation (
    Line(points = {{881, 280}, {890, 280}, {890, 294}, {898, 294}}, color = {0, 255, 0}));
  connect(N8.flange_b, inertia_Carrier_P4.flange_b) annotation (
    Line(points = {{380, 0}, {1480, 0}, {1480, 300}, {1280, 300}}));
  connect(SN10.flange_b, SN11.flange_a) annotation (
    Line(points = {{1560, 300}, {1679, 300}}));
  connect(realExpression19.y, SN10.nu_oil_m2ps) annotation (
    Line(points = {{1521, 280}, {1529.5, 280}, {1529.5, 294}, {1538, 294}}, color = {0, 255, 0}));
  connect(realExpression20.y, SN11.nu_oil_m2ps) annotation (
    Line(points = {{1661, 280}, {1671.5, 280}, {1671.5, 294}, {1678, 294}}, color = {0, 255, 0}));
  connect(N7.flange_a, N5.flange_b) annotation (
    Line(points = {{500, 60}, {-490, 60}}));
  connect(inertia_RingGear_P4.flange_b, SN10.flange_b) annotation (
    Line(points = {{1440, 400}, {1620, 400}, {1620, 300}, {1560, 300}}));
  connect(N1.flange_b, SN1.flange_b) annotation (
    Line(points = {{-1860, 0}, {-1840, 0}, {-1840, 240}, {-1860, 240}}));
  connect(inertia_Carrier_P4.flange_b, SN10.flange_a) annotation (
    Line(points = {{1280, 300}, {1539, 300}}));
  connect(N8.flange_b, N9.flange_a) annotation (
    Line(points = {{380, 0}, {1820, 0}}));
  connect(fixed8.flange, N10.support) annotation (
    Line(points = {{1940, 56}, {1940, 10}}));
  connect(realExpression22.y, N10.nu_oil_m2ps) annotation (
    Line(points = {{1911, 20}, {1920, 20}, {1920, 6}, {1928, 6}}, color = {0, 255, 0}));
  connect(const17.y, N10.Fth) annotation (
    Line(points = {{1911, -30}, {1920, -30}, {1920, -8}, {1928, -8}}, color = {0, 255, 0}));
  connect(const17.y, N10.Fr) annotation (
    Line(points = {{1911, -30}, {1938, -30}, {1938, -12}}, color = {0, 255, 0}));
  connect(realExpression23.y, BB1.nu_oil_m2ps) annotation (
    Line(points = {{2121, 20}, {2130, 20}, {2130, 6}, {2138, 6}}, color = {0, 255, 0}));
  connect(BB1.flange_b, OS1.flange_a) annotation (
    Line(points = {{2160, 0}, {2200, 0}}));
  connect(OS1.flange_b, angleToTorqueAdaptor2.flange) annotation (
    Line(points = {{2220, 0}, {2256, 0}}));
  connect(SR11.flange_b, BB1.flange_a) annotation (
    Line(points = {{2050, 0}, {2140, 0}}));
  connect(SR11.support, fixed9.flange) annotation (
    Line(points = {{2040, 10}, {2040, 56}}));
  connect(BB1.support, fixed10.flange) annotation (
    Line(points = {{2150, 10}, {2150, 56}}));
  connect(OS1.support, fixed11.flange) annotation (
    Line(points = {{2210, 10}, {2210, 56}}));
  connect(inertia_RingGear_P1.flange_b, stirring2D.support) annotation (
    Line(points = {{-1040, 360}, {-1000, 360}, {-1000, 500}, {-940, 500}, {-940, 550}, {-900, 550}}));
  connect(realExpression26.y, stirring2D1.nu_oil_m2ps) annotation (
    Line(points = {{1801, 370}, {1809.5, 370}, {1809.5, 358}, {1818, 358}}, color = {0, 255, 0}));
  connect(stirring2D1.flange_b, fixed13.flange) annotation (
    Line(points = {{1840, 350}, {1876, 350}}));
  connect(ClutchC1.flange_b, SN2.flange_b) annotation (
    Line(points = {{-1630, 400}, {-1570, 400}, {-1570, 240}, {-1630, 240}}));
  connect(ClutchC1.flange_b, N2.support) annotation (
    Line(points = {{-1630, 400}, {-1570, 400}, {-1570, 10}}));
  connect(inertia_Carrier_P1.flange_b, stirring3D_C2.flange_a) annotation (
    Line(points = {{-1200, 240}, {-980, 240}, {-980, 340}, {-920, 340}}));
  connect(stirring3D_C2.flange_b, inertia_RingGear_P2.flange_a) annotation (
    Line(points = {{-900, 340}, {-840, 340}, {-840, 400}, {-700, 400}}));
  connect(inertia_RingGear_P4.flange_b, stirring3D_C3.flange_a) annotation (
    Line(points = {{1440, 400}, {1680, 400}}));
  connect(stirring3D_C3.flange_b, N10.flange_a) annotation (
    Line(points = {{1700, 400}, {1760, 400}, {1760, 60}, {1860, 60}, {1860, 0}, {1930, 0}}));
  connect(realExpression40.y, ClutchC3.tau_clutch_cap) annotation (
    Line(points = {{1661, 470}, {1690, 470}, {1690, 462}}, color = {0, 0, 127}));
  connect(realExpression41.y, ClutchC2.tau_clutch_cap) annotation (
    Line(points = {{-939, 430}, {-910, 430}, {-910, 412}}, color = {0, 0, 127}));
  connect(realExpression42.y, ClutchC1.tau_clutch_cap) annotation (
    Line(points = {{-1669, 420}, {-1640, 420}, {-1640, 412}}, color = {0, 0, 127}));
  connect(tau_clutch_cap, tau_clutch_cap1.u) annotation (
    Line(points = {{-2360, 190}, {-2322, 190}}, color = {0, 0, 127}, thickness = 0.5));
  connect(Planet_Ring_P2.ring, inertia_RingGear_P2.flange_b) annotation (
    Line(points = {{-620, 380}, {-660, 380}, {-660, 400}, {-680, 400}}));
  connect(Planet_Ring_P3.ring, inertia_RingGear_P3.flange_b) annotation (
    Line(points = {{440, 380}, {400, 380}, {400, 400}, {380, 400}}));
  connect(inertia_SunGear_P4.flange_b, Planet_Planet_P4.sun) annotation (
    Line(points = {{1000, 200}, {1020, 200}, {1020, 254}, {1040, 254}}));
  connect(Planet_Ring_P4.ring, inertia_RingGear_P4.flange_a) annotation (
    Line(points = {{1360, 380}, {1400, 380}, {1400, 400}, {1420, 400}}));
  connect(inertia_SunGear_P3.flange_a, Planet_Planet_P3.sun) annotation (
    Line(points = {{800, 200}, {780, 200}, {780, 254}, {760, 254}}));
  connect(inertia_PlanetGear_P3.flange_a, Planet_Ring_P3.pinion) annotation (
    Line(points = {{520, 392}, {480, 392}}));
  connect(Planet_Ring_P3.carrier, inertia_Carrier_P3.flange_a) annotation (
    Line(points = {{480, 380}, {500, 380}, {500, 300}, {520, 300}}));
  connect(Planet_Planet_P2.sun, inertia_SunGear_P2.flange_a) annotation (
    Line(points = {{-300, 254}, {-280, 254}, {-280, 200}, {-260, 200}}));
  connect(Planet_Ring_P2.carrier, inertia_Carrier_P2.flange_a) annotation (
    Line(points = {{-580, 380}, {-560, 380}, {-560, 300}, {-540, 300}}));
  connect(Planet_Ring_P2.pinion, inertia_PlanetGear_P2.flange_a) annotation (
    Line(points = {{-580, 392}, {-540, 392}}));
  connect(inertia_PlanetGear_P4.flange_b, Planet_Ring_P4.pinion) annotation (
    Line(points = {{1280, 392}, {1320, 392}}));
  connect(Planet_Ring_P4.carrier, inertia_Carrier_P4.flange_b) annotation (
    Line(points = {{1320, 380}, {1300, 380}, {1300, 300}, {1280, 300}}));
  connect(realExpression45.y, Planet_Ring_P4.nu_oil_m2ps) annotation (
    Line(points = {{1319, 330}, {1310, 330}, {1310, 368}, {1316, 368}}, color = {0, 255, 0}));
  connect(Planet_Ring_P1.pinion, inertia_PlanetGear_P1.flange_b) annotation (
    Line(points = {{-1160, 332}, {-1200, 332}}));
  connect(Planet_Ring_P1.carrier, inertia_Carrier_P1.flange_b) annotation (
    Line(points = {{-1160, 320}, {-1180, 320}, {-1180, 240}, {-1200, 240}}));
  connect(realExpression46.y, Planet_Ring_P1.nu_oil_m2ps) annotation (
    Line(points = {{-1161, 270}, {-1170.5, 270}, {-1170.5, 308}, {-1164, 308}}, color = {0, 255, 0}));
  connect(integrator2.u, w_TM_PNT_AT_Gear_radps) annotation (
    Line(points = {{2322, 20}, {2360, 20}}, color = {0, 0, 127}));
  connect(gain4.y, trq_TM_PNT_AT_GEAR_Nm) annotation (
    Line(points = {{2321, -20}, {2350, -20}}, color = {0, 0, 127}));
  connect(integrator2.y, angleToTorqueAdaptor2.phi) annotation (
    Line(points = {{2299, 20}, {2280, 20}, {2280, 8}, {2261, 8}}, color = {0, 0, 127}));
  connect(angleToTorqueAdaptor2.tau, gain4.u) annotation (
    Line(points = {{2261, -8}, {2280, -8}, {2280, -20}, {2298, -20}}, color = {0, 0, 127}));
  connect(const18.y, BB1.Fr) annotation (
    Line(points = {{2121, -30}, {2148, -30}, {2148, -12}}, color = {0, 255, 0}));
  connect(realExpression14.y, SN7.nu_oil_m2ps) annotation (
    Line(points = {{31, 280}, {40, 280}, {40, 294}, {48, 294}}, color = {0, 255, 0}));
  connect(inertia_Carrier_P3.flange_a, N7.support) annotation (
    Line(points = {{520, 300}, {320, 300}, {320, 120}, {510, 120}, {510, 70}}));
  connect(realExpression15.y, SN8.nu_oil_m2ps) annotation (
    Line(points = {{241, 280}, {250, 280}, {250, 294}, {258, 294}}, color = {0, 255, 0}));
  connect(const11.y, N7.Fth) annotation (
    Line(points = {{481, 30}, {490, 30}, {490, 52}, {498, 52}}, color = {0, 255, 0}));
  connect(realExpression17.y, N8.nu_oil_m2ps) annotation (
    Line(points = {{337, 20}, {350, 20}, {350, 6}, {358, 6}}, color = {0, 255, 0}));
  connect(const11.y, N7.Fr) annotation (
    Line(points = {{481, 30}, {508, 30}, {508, 48}}, color = {0, 255, 0}));
  connect(const12.y, N8.Fth) annotation (
    Line(points = {{341, -30}, {350, -30}, {350, -8}, {358, -8}}, color = {0, 255, 0}));
  connect(const12.y, N8.Fr) annotation (
    Line(points = {{341, -30}, {368, -30}, {368, -12}}, color = {0, 255, 0}));
  connect(realExpression44.y, Planet_Ring_P3.nu_oil_m2ps) annotation (
    Line(points = {{481, 330}, {490, 330}, {490, 368}, {484, 368}}, color = {0, 255, 0}));
  connect(realExpression44.y, Planet_Planet_P3.nu_oil_m2ps) annotation (
    Line(points = {{481, 330}, {780, 330}, {780, 272}, {764, 272}}, color = {0, 255, 0}));
  connect(realExpression45.y, Planet_Planet_P4.nu_oil_m2ps) annotation (
    Line(points = {{1319, 330}, {1020, 330}, {1020, 272}, {1036, 272}}, color = {0, 255, 0}));
  connect(ClutchC3.flange_a, inertia_RingGear_P4.flange_b) annotation (
    Line(points = {{1680, 450}, {1620, 450}, {1620, 400}, {1440, 400}}));
  connect(realExpression36.y, stirring3D_C3.nu_oil_m2ps) annotation (
    Line(points = {{1661, 420}, {1670, 420}, {1670, 408}, {1678, 408}}, color = {0, 255, 0}));
  connect(const16.y, N9.Fr) annotation (
    Line(points = {{1801, -30}, {1828, -30}, {1828, -12}}, color = {0, 255, 0}));
  connect(N9.Fth, const16.y) annotation (
    Line(points = {{1818, -8}, {1810, -8}, {1810, -30}, {1801, -30}}, color = {0, 255, 0}));
  connect(realExpression21.y, N9.nu_oil_m2ps) annotation (
    Line(points = {{1801, 20}, {1810, 20}, {1810, 6}, {1818, 6}}, color = {0, 255, 0}));
  connect(realExpression43.y, Planet_Ring_P2.nu_oil_m2ps) annotation (
    Line(points = {{-579, 330}, {-570, 330}, {-570, 368}, {-576, 368}}, color = {0, 255, 0}));
  connect(inertia_Carrier_P2.flange_a, N4.support) annotation (
    Line(points = {{-540, 300}, {-740, 300}, {-740, 160}, {-660, 160}, {-660, 130}}));
  connect(realExpression43.y, Planet_Planet_P2.nu_oil_m2ps) annotation (
    Line(points = {{-579, 330}, {-280, 330}, {-280, 272}, {-296, 272}}, color = {0, 255, 0}));
  connect(realExpression13.y, SN6.nu_oil_m2ps) annotation (
    Line(points = {{-179, 280}, {-170, 280}, {-170, 294}, {-162, 294}}, color = {0, 255, 0}));
  connect(realExpression11.y, N5.nu_oil_m2ps) annotation (
    Line(points = {{-529, 80}, {-520, 80}, {-520, 66}, {-512, 66}}, color = {0, 255, 0}));
  connect(const6.y, N5.Fr) annotation (
    Line(points = {{-529, 30}, {-502, 30}, {-502, 48}}, color = {0, 255, 0}));
  connect(N5.Fth, const6.y) annotation (
    Line(points = {{-512, 52}, {-520, 52}, {-520, 30}, {-529, 30}}, color = {0, 255, 0}));
  connect(const5.y, N6.Fr) annotation (
    Line(points = {{-599, -30}, {-572, -30}, {-572, -12}}, color = {0, 255, 0}));
  connect(realExpression10.y, N6.nu_oil_m2ps) annotation (
    Line(points = {{-599, 20}, {-590, 20}, {-590, 6}, {-582, 6}}, color = {0, 255, 0}));
  connect(N6.Fth, const5.y) annotation (
    Line(points = {{-582, -8}, {-590, -8}, {-590, -30}, {-599, -30}}, color = {0, 255, 0}));
  connect(realExpression12.y, N4.nu_oil_m2ps) annotation (
    Line(points = {{-689, 140}, {-680, 140}, {-680, 126}, {-672, 126}}, color = {0, 255, 0}));
  connect(SN5.flange_b, N4.support) annotation (
    Line(points = {{-760, 240}, {-740, 240}, {-740, 160}, {-660, 160}, {-660, 130}}));
  connect(realExpression7.y, N3.nu_oil_m2ps) annotation (
    Line(points = {{-1009, 20}, {-1000, 20}, {-1000, 6}, {-992, 6}}, color = {0, 255, 0}));
  connect(realExpression31.y, stirring3D_C2.nu_oil_m2ps) annotation (
    Line(points = {{-939, 360}, {-930, 360}, {-930, 348}, {-922, 348}}, color = {0, 255, 0}));
  connect(realExpression8.y, SN3.nu_oil_m2ps) annotation (
    Line(points = {{-939, 220}, {-930, 220}, {-930, 234}, {-922, 234}}, color = {0, 255, 0}));
  connect(const3.y, N3.Fr) annotation (
    Line(points = {{-1009, -30}, {-982, -30}, {-982, -12}}, color = {0, 255, 0}));
  connect(N3.Fth, const3.y) annotation (
    Line(points = {{-992, -8}, {-1000, -8}, {-1000, -30}, {-1009, -30}}, color = {0, 255, 0}));
  connect(Planet_Ring_P1.ring, inertia_RingGear_P1.flange_a) annotation (
    Line(points = {{-1120, 320}, {-1080, 320}, {-1080, 360}, {-1060, 360}}));
  connect(Planet_Planet_P1.sun, inertia_SunGear_P1.flange_b) annotation (
    Line(points = {{-1440, 194}, {-1460, 194}, {-1460, 150}, {-1480, 150}}));
  connect(realExpression46.y, Planet_Planet_P1.nu_oil_m2ps) annotation (
    Line(points = {{-1161, 270}, {-1460, 270}, {-1460, 212}, {-1444, 212}}, color = {0, 255, 0}));
  connect(realExpression25.y, stirring2D.nu_oil_m2ps) annotation (
    Line(points = {{-919, 570}, {-910, 570}, {-910, 558}, {-902, 558}}, color = {0, 255, 0}));
  connect(constant2.y, N2.Fr) annotation (
    Line(points = {{-1599, -20}, {-1572, -20}, {-1572, -12}}, color = {0, 255, 0}));
  connect(N2.Fth, constant2.y) annotation (
    Line(points = {{-1582, -8}, {-1590, -8}, {-1590, -20}, {-1599, -20}}, color = {0, 255, 0}));
  connect(realExpression5.y, N2.nu_oil_m2ps) annotation (
    Line(points = {{-1599, 20}, {-1590, 20}, {-1590, 6}, {-1582, 6}}, color = {0, 255, 0}));
  connect(realExpression4.y, SN2.nu_oil_m2ps) annotation (
    Line(points = {{-1669, 220}, {-1660, 220}, {-1660, 234}, {-1652, 234}}, color = {0, 255, 0}));
  connect(realExpression33.y, stirring3D_C1.nu_oil_m2ps) annotation (
    Line(points = {{-1669, 360}, {-1660, 360}, {-1660, 348}, {-1652, 348}}, color = {0, 255, 0}));
  connect(realExpression3.y, SN1.nu_oil_m2ps) annotation (
    Line(points = {{-1899, 220}, {-1890, 220}, {-1890, 234}, {-1882, 234}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN1[2], SN1.Fth) annotation (
    Line(points = {{-1763, 859}, {-1890, 859}, {-1890, 248}, {-1882, 248}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN1[1], SN1.Fr) annotation (
    Line(points = {{-1763, 859}, {-1890, 859}, {-1890, 260}, {-1872, 260}, {-1872, 252}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN2[2], SN2.Fth) annotation (
    Line(points = {{-1763, 845}, {-1880, 845}, {-1880, 612}, {-1700, 612}, {-1700, 248}, {-1652, 248}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN2[1], SN2.Fr) annotation (
    Line(points = {{-1763, 845}, {-1880, 845}, {-1880, 612}, {-1700, 612}, {-1700, 260}, {-1642, 260}, {-1642, 252}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN3[2], SN3.Fth) annotation (
    Line(points = {{-1763, 831}, {-1870, 831}, {-1870, 620}, {-970, 620}, {-970, 248}, {-922, 248}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN3[1], SN3.Fr) annotation (
    Line(points = {{-1763, 831}, {-1870, 831}, {-1870, 620}, {-970, 620}, {-970, 260}, {-912, 260}, {-912, 252}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN5[2], SN5.Fth) annotation (
    Line(points = {{-1763, 817}, {-1860, 817}, {-1860, 630}, {-790, 630}, {-790, 248}, {-782, 248}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN5[1], SN5.Fr) annotation (
    Line(points = {{-1763, 817}, {-1860, 817}, {-1860, 630}, {-790, 630}, {-790, 260}, {-772, 260}, {-772, 252}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN6[2], SN6.Fth) annotation (
    Line(points = {{-1763, 804}, {-1850, 804}, {-1850, 640}, {-170, 640}, {-170, 308}, {-162, 308}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN6[1], SN6.Fr) annotation (
    Line(points = {{-1763, 804}, {-1850, 804}, {-1850, 640}, {-170, 640}, {-170, 320}, {-152, 320}, {-152, 312}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN7[2], SN7.Fth) annotation (
    Line(points = {{-1763, 790}, {-1840, 790}, {-1840, 650}, {40, 650}, {40, 308}, {48, 308}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN7[1], SN7.Fr) annotation (
    Line(points = {{-1763, 790}, {-1840, 790}, {-1840, 650}, {40, 650}, {40, 320}, {58, 320}, {58, 312}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN8[2], SN8.Fth) annotation (
    Line(points = {{-1763, 776}, {-1830, 776}, {-1830, 660}, {250, 660}, {250, 308}, {258, 308}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN8[1], SN8.Fr) annotation (
    Line(points = {{-1763, 776}, {-1830, 776}, {-1830, 660}, {250, 660}, {250, 320}, {268, 320}, {268, 312}}, color = {0, 255, 0}));
  connect(Planet_Planet_P1.PHI_W, Sum_GearLoss.u[1]) annotation (
    Line(points = {{-1398, 183}, {-1398, 185}, {-1390, 185}, {-1390, -170}, {2240, -170}}, color = {170, 0, 0}));
  connect(Planet_Ring_P1.PHI_W, Sum_GearLoss.u[2]) annotation (
    Line(points = {{-1118, 304}, {-1100, 304}, {-1100, -170}, {2240, -170}}, color = {170, 0, 0}));
  connect(Planet_Planet_P2.PHI_W, Sum_GearLoss.u[3]) annotation (
    Line(points = {{-342, 243}, {-350, 243}, {-350, -170}, {2240, -170}}, color = {170, 0, 0}));
  connect(Planet_Ring_P2.PHI_W, Sum_GearLoss.u[4]) annotation (
    Line(points = {{-622, 364}, {-640, 364}, {-640, -170}, {2240, -170}}, color = {170, 0, 0}));
  connect(Planet_Planet_P3.PHI_W, Sum_GearLoss.u[5]) annotation (
    Line(points = {{718, 243}, {710, 243}, {710, -170}, {2240, -170}}, color = {170, 0, 0}));
  connect(Planet_Ring_P3.PHI_W, Sum_GearLoss.u[6]) annotation (
    Line(points = {{438, 364}, {420, 364}, {420, -170}, {2240, -170}}, color = {170, 0, 0}));
  connect(Planet_Planet_P4.PHI_W, Sum_GearLoss.u[7]) annotation (
    Line(points = {{1082, 243}, {1090, 243}, {1090, -170}, {2240, -170}}, color = {170, 0, 0}));
  connect(Planet_Ring_P4.PHI_W, Sum_GearLoss.u[8]) annotation (
    Line(points = {{1362, 364}, {1380, 364}, {1380, -170}, {2240, -170}}, color = {170, 0, 0}));
  connect(ClutchC1.PHI_W, Sum_ClutchLoss.u[1]) annotation (
    Line(points = {{-1629, 390}, {-1550, 390}, {-1550, -250}, {2240, -250}}, color = {170, 0, 0}));
  connect(ClutchC2.PHI_W, Sum_ClutchLoss.u[2]) annotation (
    Line(points = {{-899, 390}, {-890, 390}, {-890, -250}, {2240, -250}}, color = {170, 0, 0}));
  connect(ClutchC3.PHI_W, Sum_ClutchLoss.u[3]) annotation (
    Line(points = {{1701, 440}, {1710, 440}, {1710, -250}, {2240, -250}}, color = {170, 0, 0}));
  connect(stirring3D_C1.PHI_W, Sum_Stirring.u[1]) annotation (
    Line(points = {{-1629, 332}, {-1550, 332}, {-1550, -210}, {2240, -210}}, color = {170, 0, 0}));
  connect(stirring3D_C2.PHI_W, Sum_Stirring.u[2]) annotation (
    Line(points = {{-899, 332}, {-890, 332}, {-890, -210}, {2240, -210}}, color = {170, 0, 0}));
  connect(stirring3D_C3.PHI_W, Sum_Stirring.u[3]) annotation (
    Line(points = {{1701, 392}, {1710, 392}, {1710, -210}, {2240, -210}}, color = {170, 0, 0}));
  connect(stirring2D1.PHI_W, Sum_Stirring.u[4]) annotation (
    Line(points = {{1841, 342}, {1850, 342}, {1850, -210}, {2240, -210}}, color = {170, 0, 0}));
  connect(stirring2D.PHI_W, Sum_Stirring.u[5]) annotation (
    Line(points = {{-879, 542}, {-860, 542}, {-860, -210}, {2240, -210}}, color = {170, 0, 0}));
  connect(SN1.PHI_W, Sum_Brg.u[1]) annotation (
    Line(points = {{-1859, 232}, {-1850, 232}, {-1850, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(SN2.PHI_W, Sum_Brg.u[2]) annotation (
    Line(points = {{-1629, 232}, {-1550, 232}, {-1550, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(SN3.PHI_W, Sum_Brg.u[3]) annotation (
    Line(points = {{-899, 232}, {-890, 232}, {-890, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(SN5.PHI_W, Sum_Brg.u[4]) annotation (
    Line(points = {{-759, 232}, {-750, 232}, {-750, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(SN6.PHI_W, Sum_Brg.u[5]) annotation (
    Line(points = {{-139, 292}, {-130, 292}, {-130, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(SN7.PHI_W, Sum_Brg.u[6]) annotation (
    Line(points = {{71, 292}, {80, 292}, {80, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(SN8.PHI_W, Sum_Brg.u[7]) annotation (
    Line(points = {{281, 292}, {290, 292}, {290, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(SN9.PHI_W, Sum_Brg.u[8]) annotation (
    Line(points = {{921, 292}, {930, 292}, {930, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(SN10.PHI_W, Sum_Brg.u[9]) annotation (
    Line(points = {{1561, 292}, {1570, 292}, {1570, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(SN11.PHI_W, Sum_Brg.u[10]) annotation (
    Line(points = {{1701, 292}, {1710, 292}, {1710, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N1.PHI_W, Sum_Brg.u[11]) annotation (
    Line(points = {{-1859, 8}, {-1850, 8}, {-1850, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N2.PHI_W, Sum_Brg.u[12]) annotation (
    Line(points = {{-1559, 8}, {-1550, 8}, {-1550, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N3.PHI_W, Sum_Brg.u[13]) annotation (
    Line(points = {{-969, 8}, {-960, 8}, {-960, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N4.PHI_W, Sum_Brg.u[14]) annotation (
    Line(points = {{-649, 128}, {-640, 128}, {-640, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N5.PHI_W, Sum_Brg.u[15]) annotation (
    Line(points = {{-489, 68}, {-480, 68}, {-480, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N6.PHI_W, Sum_Brg.u[16]) annotation (
    Line(points = {{-559, 8}, {-480, 8}, {-480, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N7.PHI_W, Sum_Brg.u[17]) annotation (
    Line(points = {{521, 68}, {560, 68}, {560, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N8.PHI_W, Sum_Brg.u[18]) annotation (
    Line(points = {{381, 8}, {400, 8}, {400, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N9.PHI_W, Sum_Brg.u[19]) annotation (
    Line(points = {{1841, 8}, {1850, 8}, {1850, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N10.PHI_W, Sum_Brg.u[20]) annotation (
    Line(points = {{1951, 8}, {1960, 8}, {1960, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(BB1.PHI_W, Sum_Brg.u[21]) annotation (
    Line(points = {{2161, 8}, {2170, 8}, {2170, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(SR1.PHI_W, Sum_SealRing.u[1]) annotation (
    Line(points = {{-2099, 8}, {-2089.5, 8}, {-2089.5, 20}, {-1950, 20}, {-1950, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR2.PHI_W, Sum_SealRing.u[2]) annotation (
    Line(points = {{-2069, 8}, {-2060, 8}, {-2060, 20}, {-1950, 20}, {-1950, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR3.PHI_W, Sum_SealRing.u[3]) annotation (
    Line(points = {{-2039, 8}, {-2030, 8}, {-2030, 20}, {-1950, 20}, {-1950, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR4.PHI_W, Sum_SealRing.u[4]) annotation (
    Line(points = {{-2009, 8}, {-2000, 8}, {-2000, 20}, {-1950, 20}, {-1950, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR5.PHI_W, Sum_SealRing.u[5]) annotation (
    Line(points = {{-1979, 8}, {-1970, 8}, {-1970, 20}, {-1950, 20}, {-1950, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR6.PHI_W, Sum_SealRing.u[6]) annotation (
    Line(points = {{-1209, 8}, {-1200, 8}, {-1200, 20}, {-1100, 20}, {-1100, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR7.PHI_W, Sum_SealRing.u[7]) annotation (
    Line(points = {{-1179, 8}, {-1170, 8}, {-1170, 20}, {-1100, 20}, {-1100, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR8.PHI_W, Sum_SealRing.u[8]) annotation (
    Line(points = {{-1149, 8}, {-1140, 8}, {-1140, 20}, {-1100, 20}, {-1100, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR9.PHI_W, Sum_SealRing.u[9]) annotation (
    Line(points = {{-1119, 8}, {-1109.5, 8}, {-1109.5, 20}, {-1100, 20}, {-1100, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR10.PHI_W, Sum_SealRing.u[10]) annotation (
    Line(points = {{2021, 8}, {2030, 8}, {2030, 20}, {2070, 20}, {2070, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR11.PHI_W, Sum_SealRing.u[11]) annotation (
    Line(points = {{2051, 8}, {2060.5, 8}, {2060.5, 20}, {2070, 20}, {2070, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR12.PHI_W, Sum_SealRing.u[12]) annotation (
    Line(points = {{-1789, 378}, {-1780, 378}, {-1780, 392}, {-1740, 392}, {-1740, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(SR13.PHI_W, Sum_SealRing.u[13]) annotation (
    Line(points = {{-1759, 378}, {-1750, 378}, {-1750, 392}, {-1740, 392}, {-1740, -330}, {2240, -330}}, color = {170, 0, 0}));
  connect(multiSum.y, Qf_GB_PNT_W) annotation (
    Line(points = {{2322, -130}, {2350, -130}}, color = {0, 0, 127}));
  connect(Sum_GearLoss.y, multiSum.u[1]) annotation (
    Line(points = {{2262, -170}, {2280, -170}, {2280, -130}, {2300, -130}}, color = {170, 0, 0}));
  connect(Sum_Stirring.y, multiSum.u[2]) annotation (
    Line(points = {{2262, -210}, {2280, -210}, {2280, -130}, {2300, -130}}, color = {170, 0, 0}));
  connect(Sum_ClutchLoss.y, multiSum.u[3]) annotation (
    Line(points = {{2262, -250}, {2280, -250}, {2280, -130}, {2300, -130}}, color = {170, 0, 0}));
  connect(Sum_Brg.y, multiSum.u[4]) annotation (
    Line(points = {{2262, -290}, {2280, -290}, {2280, -130}, {2300, -130}}, color = {170, 0, 0}));
  connect(Sum_SealRing.y, multiSum.u[5]) annotation (
    Line(points = {{2262, -330}, {2280, -330}, {2280, -130}, {2300, -130}}, color = {170, 0, 0}));
  connect(OS1.PHI_W, multiSum.u[6]) annotation (
    Line(points = {{2221, 8}, {2230, 8}, {2230, -130}, {2300, -130}}, color = {170, 0, 0}));
  connect(Planet_Planet_P1.carrier, torqueSensor1.flange_a) annotation (
    Line(points = {{-1400, 190}, {-1370, 190}}));
  connect(inertia_RingGear_P1.flange_b, inertia_Carrier_P2.flange_b) annotation (
    Line(points = {{-1040, 360}, {-1000, 360}, {-1000, 500}, {-200, 500}, {-200, 300}, {-520, 300}}));
  connect(SN6.flange_a, inertia_Carrier_P2.flange_b) annotation (
    Line(points = {{-161, 300}, {-520, 300}}));
  connect(SN9.flange_a, inertia_Carrier_P3.flange_b) annotation (
    Line(points = {{899, 300}, {540, 300}}));
  connect(ClutchC3.flange_b, inertia_Carrier_P3.flange_b) annotation (
    Line(points = {{1700, 450}, {1760, 450}, {1760, 500}, {860, 500}, {860, 300}, {540, 300}}));
  connect(SN11.flange_b, inertia_Carrier_P3.flange_b) annotation (
    Line(points = {{1700, 300}, {1760, 300}, {1760, 500}, {860, 500}, {860, 300}, {540, 300}}));
  connect(N10.flange_a, inertia_Carrier_P3.flange_b) annotation (
    Line(points = {{1930, 0}, {1860, 0}, {1860, 60}, {1760, 60}, {1760, 500}, {860, 500}, {860, 300}, {540, 300}}));
  connect(N9.support, inertia_Carrier_P3.flange_b) annotation (
    Line(points = {{1830, 10}, {1830, 60}, {1760, 60}, {1760, 500}, {860, 500}, {860, 300}, {540, 300}}));
  connect(stirring2D1.support, inertia_Carrier_P3.flange_b) annotation (
    Line(points = {{1820, 350}, {1760, 350}, {1760, 500}, {860, 500}, {860, 300}, {540, 300}}));
  connect(SN9.flange_b, inertia_Carrier_P4.flange_a) annotation (
    Line(points = {{920, 300}, {1260, 300}}));
  connect(unitDelay1.y, trq2force1.u) annotation (
    Line(points = {{-1368, 151}, {-1368.5, 151}, {-1368.5, 140}, {-1342, 140}}, color = {0, 255, 0}));
  connect(BrakeB1.flange_a, ClutchC1.flange_b) annotation (
    Line(points = {{-1480, 570}, {-1570, 570}, {-1570, 400}, {-1630, 400}}));
  connect(BrakeB1.flange_b, fixed3.flange) annotation (
    Line(points = {{-1460, 570}, {-1400, 570}, {-1400, 596}}));
  connect(stirring2D_B1.flange_b, fixed3.flange) annotation (
    Line(points = {{-1460, 520}, {-1400, 520}, {-1400, 596}}));
  connect(realExpression32.y, stirring2D_B1.nu_oil_m2ps) annotation (
    Line(points = {{-1499, 540}, {-1490, 540}, {-1490, 528}, {-1482, 528}}, color = {0, 255, 0}));
  connect(realExpression39.y, BrakeB1.tau_clutch_cap) annotation (
    Line(points = {{-1499, 590}, {-1470, 590}, {-1470, 582}}, color = {0, 0, 127}));
  connect(BrakeB1.PHI_W, Sum_ClutchLoss.u[4]) annotation (
    Line(points = {{-1459, 560}, {-1450, 560}, {-1450, 492}, {-1550, 492}, {-1550, -250}, {2240, -250}}, color = {170, 0, 0}));
  connect(stirring2D_B1.PHI_W, Sum_Stirring.u[6]) annotation (
    Line(points = {{-1459, 512}, {-1450, 512}, {-1450, 492}, {-1550, 492}, {-1550, -210}, {2240, -210}}, color = {170, 0, 0}));
  connect(BrakeB2.flange_a, inertia_SunGear_P2.flange_b) annotation (
    Line(points = {{-60, 570}, {-120, 570}, {-120, 200}, {-240, 200}}));
  connect(stirring2D_B2.support, inertia_SunGear_P2.flange_b) annotation (
    Line(points = {{-60, 520}, {-120, 520}, {-120, 200}, {-240, 200}}));
  connect(BrakeB2.flange_b, fixed1.flange) annotation (
    Line(points = {{-40, 570}, {20, 570}, {20, 596}}));
  connect(stirring2D_B2.flange_b, fixed1.flange) annotation (
    Line(points = {{-40, 520}, {20, 520}, {20, 596}}));
  connect(realExpression34.y, stirring2D_B2.nu_oil_m2ps) annotation (
    Line(points = {{-79, 540}, {-69.5, 540}, {-69.5, 528}, {-62, 528}}, color = {0, 255, 0}));
  connect(realExpression37.y, BrakeB2.tau_clutch_cap) annotation (
    Line(points = {{-79, 590}, {-50, 590}, {-50, 582}}, color = {0, 0, 127}));
  connect(BrakeB2.PHI_W, Sum_ClutchLoss.u[5]) annotation (
    Line(points = {{-39, 560}, {-30, 560}, {-30, -250}, {2240, -250}}, color = {170, 0, 0}));
  connect(stirring2D_B2.PHI_W, Sum_Stirring.u[7]) annotation (
    Line(points = {{-39, 512}, {-30, 512}, {-30, -210}, {2240, -210}}, color = {170, 0, 0}));
  connect(BrakeB3.flange_a, inertia_RingGear_P3.flange_a) annotation (
    Line(points = {{150, 570}, {90, 570}, {90, 400}, {360, 400}}));
  connect(BrakeB3.flange_b, fixed7.flange) annotation (
    Line(points = {{170, 570}, {230, 570}, {230, 596}}));
  connect(stirring2D_B3.support, inertia_RingGear_P3.flange_a) annotation (
    Line(points = {{150, 520}, {90, 520}, {90, 400}, {360, 400}}));
  connect(stirring2D_B3.flange_b, fixed7.flange) annotation (
    Line(points = {{170, 520}, {230, 520}, {230, 596}}));
  connect(realExpression35.y, stirring2D_B3.nu_oil_m2ps) annotation (
    Line(points = {{131, 540}, {140, 540}, {140, 527}, {148, 527}, {148, 528}}, color = {0, 255, 0}));
  connect(realExpression38.y, BrakeB3.tau_clutch_cap) annotation (
    Line(points = {{131, 590}, {160, 590}, {160, 582}}, color = {0, 0, 127}));
  connect(BrakeB3.PHI_W, Sum_ClutchLoss.u[6]) annotation (
    Line(points = {{171, 560}, {180, 560}, {180, -250}, {2240, -250}}, color = {170, 0, 0}));
  connect(stirring2D_B3.PHI_W, Sum_Stirring.u[8]) annotation (
    Line(points = {{171, 512}, {180, 512}, {180, -210}, {2240, -210}}, color = {170, 0, 0}));
  connect(Planet_Planet_P1.pinion, inertia_PlanetGear_P1.flange_a) annotation (
    Line(points = {{-1400, 208}, {-1260, 208}, {-1260, 332}, {-1220, 332}}));
  connect(const4.y, N12_15.Fth) annotation (
    Line(points = {{-1319, 170}, {-1310, 170}, {-1310, 182}, {-1302, 182}}, color = {0, 255, 0}));
  connect(unitDelay1.u, torqueSensor1.tau) annotation (
    Line(points = {{-1368, 170}, {-1368, 179}}, color = {0, 255, 0}));
  connect(trq2force1.y, N12_15.Fr) annotation (
    Line(points = {{-1319, 140}, {-1292, 140}, {-1292, 178}}, color = {0, 255, 0}));
  connect(ClutchC1.flange_b, inertia_Carrier_P1.flange_a) annotation (
    Line(points = {{-1630, 400}, {-1570, 400}, {-1570, 240}, {-1220, 240}}));
  connect(stirring3D_C1.flange_b, inertia_Carrier_P1.flange_a) annotation (
    Line(points = {{-1630, 340}, {-1570, 340}, {-1570, 240}, {-1220, 240}}));
  connect(stirring2D_B1.support, inertia_Carrier_P1.flange_a) annotation (
    Line(points = {{-1480, 520}, {-1570, 520}, {-1570, 240}, {-1220, 240}}));
  connect(torqueSensor1.flange_b, N12_15.flange_a) annotation (
    Line(points = {{-1350, 190}, {-1300, 190}}));
  connect(N12_15.flange_b, inertia_Carrier_P1.flange_a) annotation (
    Line(points = {{-1280, 190}, {-1240, 190}, {-1240, 240}, {-1220, 240}}));
  connect(Planet_Planet_P1.pinion, N12_15.support) annotation (
    Line(points = {{-1400, 208}, {-1290, 208}, {-1290, 200}}));
  connect(realExpression46.y, N12_15.nu_oil_m2ps) annotation (
    Line(points = {{-1161, 270}, {-1310, 270}, {-1310, 196}, {-1302, 196}}, color = {0, 255, 0}));
  connect(torqueSensor2.flange_a, Planet_Planet_P2.carrier) annotation (
    Line(points = {{-370, 250}, {-340, 250}}));
  connect(N16_19.flange_a, torqueSensor2.flange_b) annotation (
    Line(points = {{-440, 250}, {-390, 250}}));
  connect(N16_19.flange_b, inertia_Carrier_P2.flange_b) annotation (
    Line(points = {{-460, 250}, {-500, 250}, {-500, 300}, {-520, 300}}));
  connect(Planet_Planet_P2.pinion, inertia_PlanetGear_P2.flange_b) annotation (
    Line(points = {{-340, 268}, {-480, 268}, {-480, 392}, {-520, 392}}));
  connect(Planet_Planet_P2.pinion, N16_19.support) annotation (
    Line(points = {{-340, 268}, {-450, 268}, {-450, 260}}));
  connect(const13.y, N16_19.Fth) annotation (
    Line(points = {{-421, 230}, {-430, 230}, {-430, 242}, {-438, 242}}, color = {0, 255, 0}));
  connect(realExpression43.y, N16_19.nu_oil_m2ps) annotation (
    Line(points = {{-579, 330}, {-430, 330}, {-430, 255}, {-438, 255}, {-438, 256}}, color = {0, 255, 0}));
  connect(torqueSensor2.tau, unitDelay2.u) annotation (
    Line(points = {{-372, 239}, {-372, 230}}, color = {0, 255, 0}));
  connect(trq2force2.y, N16_19.Fr) annotation (
    Line(points = {{-421, 200}, {-448, 200}, {-448, 238}}, color = {0, 255, 0}));
  connect(trq2force2.u, unitDelay2.y) annotation (
    Line(points = {{-398, 200}, {-372, 200}, {-372, 211}}, color = {0, 255, 0}));
  connect(torqueSensor3.flange_a, Planet_Planet_P3.carrier) annotation (
    Line(points = {{690, 250}, {720, 250}}));
  connect(N20_23.flange_a, torqueSensor3.flange_b) annotation (
    Line(points = {{620, 250}, {670, 250}}));
  connect(N20_23.flange_b, inertia_Carrier_P3.flange_b) annotation (
    Line(points = {{600, 250}, {560, 250}, {560, 300}, {540, 300}}));
  connect(Planet_Planet_P3.pinion, inertia_PlanetGear_P3.flange_b) annotation (
    Line(points = {{720, 268}, {580, 268}, {580, 392}, {540, 392}}));
  connect(Planet_Planet_P3.pinion, N20_23.support) annotation (
    Line(points = {{720, 268}, {610, 268}, {610, 260}}));
  connect(realExpression44.y, N20_23.nu_oil_m2ps) annotation (
    Line(points = {{481, 330}, {630, 330}, {630, 256}, {622, 256}}, color = {0, 255, 0}));
  connect(const.y, N20_23.Fth) annotation (
    Line(points = {{639, 230}, {630, 230}, {630, 242}, {622, 242}}, color = {0, 255, 0}));
  connect(torqueSensor3.tau, unitDelay3.u) annotation (
    Line(points = {{688, 239}, {688, 230}}, color = {0, 255, 0}));
  connect(trq2force3.y, N20_23.Fr) annotation (
    Line(points = {{639, 200}, {612, 200}, {612, 238}}, color = {0, 255, 0}));
  connect(trq2force3.u, unitDelay3.y) annotation (
    Line(points = {{662, 200}, {688, 200}, {688, 211}}, color = {0, 255, 0}));
  connect(Planet_Planet_P4.carrier, torqueSensor4.flange_a) annotation (
    Line(points = {{1080, 250}, {1110, 250}}));
  connect(torqueSensor4.flange_b, N24_27.flange_a) annotation (
    Line(points = {{1130, 250}, {1180, 250}}));
  connect(N24_27.flange_b, inertia_Carrier_P4.flange_a) annotation (
    Line(points = {{1200, 250}, {1240, 250}, {1240, 300}, {1260, 300}}));
  connect(Planet_Planet_P4.pinion, inertia_PlanetGear_P4.flange_a) annotation (
    Line(points = {{1080, 268}, {1220, 268}, {1220, 392}, {1260, 392}}));
  connect(Planet_Planet_P4.pinion, N24_27.support) annotation (
    Line(points = {{1080, 268}, {1190, 268}, {1190, 260}}));
  connect(const1.y, N24_27.Fth) annotation (
    Line(points = {{1161, 230}, {1170, 230}, {1170, 242}, {1178, 242}}, color = {0, 255, 0}));
  connect(torqueSensor4.tau, unitDelay4.u) annotation (
    Line(points = {{1112, 239}, {1112, 230}}, color = {0, 255, 0}));
  connect(trq2force4.u, unitDelay4.y) annotation (
    Line(points = {{1138, 200}, {1112, 200}, {1112, 211}}, color = {0, 255, 0}));
  connect(trq2force4.y, N24_27.Fr) annotation (
    Line(points = {{1161, 200}, {1188, 200}, {1188, 238}}, color = {0, 255, 0}));
  connect(realExpression45.y, N24_27.nu_oil_m2ps) annotation (
    Line(points = {{1319, 330}, {1170, 330}, {1170, 256}, {1178, 256}}, color = {0, 255, 0}));
  connect(N12_15.PHI_W, Sum_Brg.u[22]) annotation (
    Line(points = {{-1279, 198}, {-1260, 198}, {-1260, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N16_19.PHI_W, Sum_Brg.u[23]) annotation (
    Line(points = {{-461, 258}, {-480, 258}, {-480, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N20_23.PHI_W, Sum_Brg.u[24]) annotation (
    Line(points = {{599, 258}, {580, 258}, {580, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(N24_27.PHI_W, Sum_Brg.u[25]) annotation (
    Line(points = {{1201, 258}, {1220, 258}, {1220, -290}, {2240, -290}}, color = {170, 0, 0}));
  connect(brgLoadDistribution_TM.F_SN11[1], SN11.Fr) annotation (
    Line(points = {{-1763, 735}, {-1800, 735}, {-1800, 690}, {1540, 690}, {1540, 360}, {1670, 360}, {1670, 320}, {1688, 320}, {1688, 312}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN11[2], SN11.Fth) annotation (
    Line(points = {{-1763, 735}, {-1800, 735}, {-1800, 690}, {1540, 690}, {1540, 360}, {1670, 360}, {1670, 309}, {1678, 309}, {1678, 308}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN10[1], SN10.Fr) annotation (
    Line(points = {{-1763, 748}, {-1810, 748}, {-1810, 680}, {1530, 680}, {1530, 320}, {1548, 320}, {1548, 312}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN10[2], SN10.Fth) annotation (
    Line(points = {{-1763, 748}, {-1810, 748}, {-1810, 680}, {1530, 680}, {1530, 308}, {1538, 308}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN9[1], SN9.Fr) annotation (
    Line(points = {{-1763, 762}, {-1820, 762}, {-1820, 670}, {890, 670}, {890, 320}, {908.5, 320}, {908.5, 312}, {908, 312}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN9[2], SN9.Fth) annotation (
    Line(points = {{-1763, 762}, {-1820, 762}, {-1820, 670}, {890, 670}, {890, 308}, {898, 308}}, color = {0, 255, 0}));
  connect(SR8.flange_b, SR9.flange_a) annotation (
    Line(points = {{-1150, 0}, {-1140, 0}}));
  connect(SR7.flange_b, SR8.flange_a) annotation (
    Line(points = {{-1180, 0}, {-1170, 0}}));
  connect(SR6.flange_b, SR7.flange_a) annotation (
    Line(points = {{-1210, 0}, {-1200, 0}}));
  connect(N2.flange_b, SR6.flange_a) annotation (
    Line(points = {{-1560, 0}, {-1230, 0}}));
  connect(SR9.support, SR8.support) annotation (
    Line(points = {{-1130, 10}, {-1130, 60}, {-1160, 60}, {-1160, 10}}));
  connect(SR8.support, SR7.support) annotation (
    Line(points = {{-1160, 10}, {-1160, 60}, {-1190, 60}, {-1190, 10}}));
  connect(SR7.support, SR6.support) annotation (
    Line(points = {{-1190, 10}, {-1190, 60}, {-1220, 60}, {-1220, 10}}));
  connect(N10.flange_b, SR10.flange_a) annotation (
    Line(points = {{1950, 0}, {2000, 0}}));
  connect(SR10.flange_b, SR11.flange_a) annotation (
    Line(points = {{2020, 0}, {2030, 0}}));
  connect(fixed.flange, SR10.support) annotation (
    Line(points = {{2010, 56}, {2010, 10}}));
  connect(realExpression2.y, N1.nu_oil_m2ps) annotation (
    Line(points = {{-1898, 20}, {-1890, 20}, {-1890, 6}, {-1882, 6}, {-1882, 6}}, color = {0, 255, 0}));
  connect(constant1.y, N1.Fr) annotation (
    Line(points = {{-1898, -20}, {-1872, -20}, {-1872, -12}, {-1872, -12}}, color = {0, 255, 0}));
  connect(N1.Fth, constant1.y) annotation (
    Line(points = {{-1882, -8}, {-1890, -8}, {-1890, -20}, {-1898, -20}, {-1898, -20}}, color = {0, 255, 0}));
  connect(SR5.flange_b, N1.flange_a) annotation (
    Line(points = {{-1980, 0}, {-1880, 0}}));
  connect(fixed4.flange, N1.support) annotation (
    Line(points = {{-1870, 56}, {-1870, 10}}));
  connect(SR4.flange_b, SR5.flange_a) annotation (
    Line(points = {{-2010, 0}, {-2000, 0}}));
  connect(SR3.flange_b, SR4.flange_a) annotation (
    Line(points = {{-2040, 0}, {-2030, 0}}));
  connect(SR2.flange_b, SR3.flange_a) annotation (
    Line(points = {{-2070, 0}, {-2060, 0}}));
  connect(SR1.flange_b, SR2.flange_a) annotation (
    Line(points = {{-2100, 0}, {-2090, 0}}));
  connect(torqueToAngleAdaptor1.flange, SR1.flange_a) annotation (
    Line(points = {{-2256, 0}, {-2120, 0}}));
  connect(SR1.support, fixed2.flange) annotation (
    Line(points = {{-2110, 10}, {-2110, 56}}));
  connect(SR2.support, fixed5.flange) annotation (
    Line(points = {{-2080, 10}, {-2080, 56}}));
  connect(SR3.support, fixed14.flange) annotation (
    Line(points = {{-2050, 10}, {-2050, 56}}));
  connect(SR4.support, fixed15.flange) annotation (
    Line(points = {{-2020, 10}, {-2020, 56}}));
  connect(SR5.support, fixed16.flange) annotation (
    Line(points = {{-1990, 10}, {-1990, 56}}));
  connect(stirring2D.flange_b, fixed12.flange) annotation (
    Line(points = {{-880, 550}, {-840, 550}, {-840, 596}}));
  connect(hydraulicSystem.p_clutch_cap_lup_fil, sealRingPrsDistribution.p_clutch_cap_lup) annotation (
    Line(points = {{-2239, 130}, {-2210, 130}}, color = {0, 0, 127}));
  connect(hydraulicSystem.p_clutch_cap_c1_fil, sealRingPrsDistribution.p_clutch_cap_c1) annotation (
    Line(points = {{-2239, 110}, {-2210, 110}}, color = {0, 0, 127}));
  connect(hydraulicSystem.p_clutch_cap_c2_fil, sealRingPrsDistribution.p_clutch_cap_c2) annotation (
    Line(points = {{-2239, 90}, {-2210, 90}}, color = {0, 0, 127}));
  connect(hydraulicSystem.p_clutch_cap_c3_fil, sealRingPrsDistribution.p_clutch_cap_c3) annotation (
    Line(points = {{-2239, 70}, {-2210, 70}}, color = {0, 0, 127}));
  connect(tau_lockup_cap, hydraulicSystem.tau_clutch_cap_lup) annotation (
    Line(points = {{-2360, 130}, {-2270, 130}}, color = {0, 0, 127}));
  connect(realExpression.y, hydraulicSystem.tau_clutch_cap_c1) annotation (
    Line(points = {{-2298, 110}, {-2270, 110}}, color = {0, 0, 127}));
  connect(realExpression1.y, hydraulicSystem.tau_clutch_cap_c2) annotation (
    Line(points = {{-2298, 90}, {-2270, 90}}, color = {0, 0, 127}));
  connect(realExpression6.y, hydraulicSystem.tau_clutch_cap_c3) annotation (
    Line(points = {{-2298, 70}, {-2272, 70}, {-2272, 70}, {-2270, 70}}, color = {0, 0, 127}));
  connect(realExpression24.y, hydraulicSystem.p_line_Pa) annotation (
    Line(points = {{-2298, 150}, {-2272, 150}, {-2272, 150}, {-2270, 150}}, color = {0, 0, 127}));
  connect(Planet_Planet_P1.SunGearKa, brgLoadDistribution_TM.P1sKa) annotation (
    Line(points = {{-1398, 218}, {-1380, 218}, {-1380, 868}, {-1682, 868}}, color = {255, 85, 0}));
  connect(Planet_Planet_P2.SunGearKa, brgLoadDistribution_TM.P2sKa) annotation (
    Line(points = {{-342, 278}, {-360, 278}, {-360, 826}, {-1682, 826}}, color = {255, 85, 0}));
  connect(Planet_Planet_P3.SunGearKa, brgLoadDistribution_TM.P3sKa) annotation (
    Line(points = {{718, 278}, {710, 278}, {710, 784}, {-1682, 784}}, color = {255, 85, 0}));
  connect(Planet_Planet_P4.SunGearKa, brgLoadDistribution_TM.P4sKa) annotation (
    Line(points = {{1082, 278}, {1090, 278}, {1090, 744}, {-1682, 744}}, color = {255, 85, 0}));
  connect(Planet_Ring_P1.RingGearKa, brgLoadDistribution_TM.P1rKa) annotation (
    Line(points = {{-1118, 336}, {-1100, 336}, {-1100, 868}, {-1660, 868}, {-1660, 850}, {-1682, 850}}, color = {255, 85, 0}));
  connect(Planet_Ring_P2.RingGearKa, brgLoadDistribution_TM.P2rKa) annotation (
    Line(points = {{-622, 396}, {-640, 396}, {-640, 826}, {-1660, 826}, {-1660, 808}, {-1682, 808}}, color = {255, 85, 0}));
  connect(Planet_Ring_P3.RingGearKa, brgLoadDistribution_TM.P3rKa) annotation (
    Line(points = {{438, 396}, {420, 396}, {420, 784}, {-1660, 784}, {-1660, 766}, {-1682, 766}}, color = {255, 85, 0}));
  connect(Planet_Ring_P4.RingGearKa, brgLoadDistribution_TM.P4rKa) annotation (
    Line(points = {{1362, 396}, {1380, 396}, {1380, 744}, {-1660, 744}, {-1660, 726}, {-1682, 726}}, color = {255, 85, 0}));
  connect(N1.flange_b, SR12.flange_a) annotation (
    Line(points = {{-1860, 0}, {-1840, 0}, {-1840, 370}, {-1810, 370}}));
  connect(SR12.flange_b, SR13.flange_a) annotation (
    Line(points = {{-1790, 370}, {-1780, 370}}));
  connect(SR13.flange_b, ClutchC1.flange_a) annotation (
    Line(points = {{-1760, 370}, {-1720, 370}, {-1720, 400}, {-1650, 400}}));
  connect(SR13.flange_b, stirring3D_C1.flange_a) annotation (
    Line(points = {{-1760, 370}, {-1720, 370}, {-1720, 340}, {-1650, 340}}));
  connect(fixed17.flange, SR12.support) annotation (
    Line(points = {{-1800, 416}, {-1800, 380}}));
  connect(fixed18.flange, SR13.support) annotation (
    Line(points = {{-1770, 416}, {-1770, 380}}));
  connect(sealRingPrsDistribution.p_SR_Pa[1], SR1.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2130, -50}, {-2130, -8}, {-2122, -8}, {-2122, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[2], SR1.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2130, -50}, {-2130, -8}, {-2122, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[3], SR2.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2100, -50}, {-2100, -8}, {-2092, -8}, {-2092, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[4], SR2.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2100, -50}, {-2100, -8}, {-2092, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[5], SR3.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2070, -50}, {-2070, -8}, {-2062, -8}, {-2062, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[6], SR3.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2070, -50}, {-2070, -8}, {-2062, -8}, {-2062, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[7], SR4.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2040, -50}, {-2040, -8}, {-2032, -8}, {-2032, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[8], SR4.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2040, -50}, {-2040, -8}, {-2032, -8}, {-2032, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[9], SR5.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2010, -50}, {-2010, -8}, {-2002, -8}, {-2002, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[10], SR5.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-2010, -50}, {-2010, -8}, {-2002, -8}, {-2002, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[11], SR6.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1240, -50}, {-1240, -8}, {-1232, -8}, {-1232, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[12], SR6.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1240, -50}, {-1240, -8}, {-1232, -8}, {-1232, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[13], SR7.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1210, -50}, {-1210, -8}, {-1202, -8}, {-1202, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[14], SR7.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1210, -50}, {-1210, -8}, {-1202, -8}, {-1202, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[15], SR8.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1180, -50}, {-1180, -8}, {-1172, -8}, {-1172, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[16], SR8.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1180, -50}, {-1180, -8}, {-1172, -8}, {-1172, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[17], SR9.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1150, -50}, {-1150, -8}, {-1142, -8}, {-1142, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[18], SR9.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1150, -50}, {-1150, -8}, {-1142, -8}, {-1142, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[19], SR10.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {1990, -50}, {1990, -8}, {1998, -8}, {1998, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[20], SR10.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {1990, -50}, {1990, -8}, {1998, -8}, {1998, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[21], SR11.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {2020, -50}, {2020, -8}, {2028, -8}, {2028, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[22], SR11.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {2020, -50}, {2020, -8}, {2028, -8}, {2028, -8}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[23], SR12.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1820, -50}, {-1820, 362}, {-1812, 362}, {-1812, 362}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[24], SR12.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1820, -50}, {-1820, 362}, {-1812, 362}, {-1812, 362}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[25], SR13.p_line_Pa[1]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1790, -50}, {-1790, 362}, {-1782, 362}, {-1782, 362}}, color = {0, 255, 0}));
  connect(sealRingPrsDistribution.p_SR_Pa[26], SR13.p_line_Pa[2]) annotation (
    Line(points = {{-2178, 100}, {-2160, 100}, {-2160, -50}, {-1790, -50}, {-1790, 362}, {-1782, 362}, {-1782, 362}}, color = {0, 255, 0}));
  connect(brgLoadDistribution_TM.F_SN11[2], BB1.Fth) annotation (
    Line(points = {{-1762, 734}, {-1798, 734}, {-1798, 692}, {2088, 692}, {2088, -8}, {2138, -8}, {2138, -8}}, color = {0, 255,0}));
  annotation (
    Icon(coordinateSystem(extent = {{-100, -260}, {100, 260}}, initialScale = 0.1), graphics={  Rectangle(origin = {0, 60}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 200}, {100, -320}}), Text(origin = {0, -286}, lineColor = {0, 0, 255}, extent = {{-140, 26}, {140, -26}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-2340, -440}, {2340, 940}}, initialScale = 0.1), graphics = {Rectangle(origin = {520, 310}, lineColor = {170, 170, 255}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-180, 110}, {320, -130}}), Rectangle(origin = {1140, 310}, lineColor = {170, 170, 255}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-180, 110}, {320, -130}}), Rectangle(origin = {-540, 308}, lineColor = {170, 170, 255}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-180, 112}, {320, -128}}), Rectangle(origin = {-1340, 250}, lineColor = {170, 170, 255}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-200, 130}, {320, -130}})}),
    uses(Modelica(version = "3.2.3")),
    version = "");
end TransmissionGear;
