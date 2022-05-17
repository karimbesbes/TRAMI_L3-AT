within TRAMI_L3_STEP_AT.TransMission.Mechanics;
model FinalGear
  parameter Real GearRatio = 3.066;
  parameter Modelica.SIunits.Inertia Jdf = 0.01;
  parameter Modelica.SIunits.RotationalSpringConstant c = 1e5;
  parameter Modelica.SIunits.RotationalDampingConstant d = 1e3;
  parameter Real Oil_Viscosity_Breakpoint[:] = {12.4e-6, 20.4e-6, 37.7e-6, 82.0e-6, 223.4e-6};
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Jdf) annotation (
    Placement(visible = true, transformation(origin = {-84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c = c, d = d, phi_rel(fixed = true), w_rel(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {172, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-300, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_AT_Gear_Nm annotation (
    Placement(visible = true, transformation(origin = {-300, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_AT_Gear_radps annotation (
    Placement(visible = true, transformation(origin = {-290, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput trq_TM_PNT_DF_Nm annotation (
    Placement(visible = true, transformation(origin = {250, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_TM_PNT_DF_radps annotation (
    Placement(visible = true, transformation(origin = {260, 30}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, 40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor1(use_a = false, use_w = true) annotation (
    Placement(visible = true, transformation(origin = {-242, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorqueAdaptor1(use_a = false, use_w = false) annotation (
    Placement(visible = true, transformation(origin = {202, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qf_DF_PNT_W annotation (
    Placement(visible = true, transformation(origin = {250, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = -1) annotation (
    Placement(visible = true, transformation(origin = {-266, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = 1, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {226, 30}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = -1) annotation (
    Placement(visible = true, transformation(origin = {226, -30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_DoubleRowAngular D_AGB1(BRG_Friction_Filename = "D_AGB1.txt") annotation (
    Placement(visible = true, transformation(origin = {-168, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_DoubleRowAngular D_AGB2(BRG_Friction_Filename = "D_AGB2.txt") annotation (
    Placement(visible = true, transformation(origin = {-122, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.HypoidGear hypoidGear(GearRatio = GearRatio, Gear_K_Filename = "DF_LoadK.txt", LoadLossFilename = "DF_LoadLoss.txt", Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, StirringLossFilename = "DF_StirringLoss.txt") annotation (
    Placement(visible = true, transformation(origin = {-46, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_Taper D_TRB2(BRG_Friction_Filename = "D_TRB2.txt") annotation (
    Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.OilSeal D_OS2(OilSeal_friction_filename = "D_OS2.txt") annotation (
    Placement(visible = true, transformation(origin = {130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation (
    Placement(visible = true, transformation(origin = {4, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.OilSeal D_OS1(OilSeal_friction_filename = "D_OS1.txt") annotation (
    Placement(visible = true, transformation(origin = {36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.BRG_Taper D_TRB1(BRG_Friction_Filename = "D_TRB1.txt") annotation (
    Placement(visible = true, transformation(origin = {4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation (
    Placement(visible = true, transformation(origin = {36, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed2 annotation (
    Placement(visible = true, transformation(origin = {96, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed3 annotation (
    Placement(visible = true, transformation(origin = {130, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum multiSum(nu = 8) annotation (
    Placement(visible = true, transformation(origin = {174, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.BrgLoadDistribution_DF_A1A2 LoadDistribution_A1A2(D = 56.92798, Y1 = 1.24, Y2 = 1.24, a = 36.38, alpha_AGB1 = -13.317, alpha_AGB2 = -13.317, b = 51.87, beta_AGB1 = 2266.3, beta_AGB2 = 2266.3) annotation (
    Placement(visible = true, transformation(origin = {-101, 65}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc.BrgLoadDistribution_DF_T1T2 LoadDistribution_T1T2(D = 147.9573, Y1 = 1.10, Y2 = 1.10, alpha_TRB1 = -63.136, alpha_TRB2 = -63.136, beta_TRB1 = 6329.4, beta_TRB2 = 6329.4, c = 85.16, d = 79.225) annotation (
    Placement(visible = true, transformation(origin = {-39, 65}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput t_trans_fluid_K annotation (
    Placement(visible = true, transformation(origin = {-300, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.To_degC to_degC annotation (
    Placement(visible = true, transformation(origin = {-210, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements.OilSeal D_OS3(OilSeal_friction_filename = "D_OS3.txt") annotation (
    Placement(visible = true, transformation(origin = {-214, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed4 annotation (
    Placement(visible = true, transformation(origin = {-214, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed5 annotation (
    Placement(visible = true, transformation(origin = {-122, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed6 annotation (
    Placement(visible = true, transformation(origin = {-168, -20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(w_TM_PNT_DF_radps, integrator1.u) annotation (
    Line(points = {{260, 30}, {233, 30}}, color = {0, 0, 127}));
  connect(gain3.y, trq_TM_PNT_DF_Nm) annotation (
    Line(points = {{233, -30}, {250, -30}}, color = {0, 0, 127}));
  connect(gain2.y, torqueToAngleAdaptor1.tau) annotation (
    Line(points = {{-259, -30}, {-252, -30}, {-252, -8}, {-245, -8}}, color = {0, 0, 127}));
  connect(trq_TM_PNT_AT_Gear_Nm, gain2.u) annotation (
    Line(points = {{-300, -30}, {-273, -30}}, color = {0, 0, 127}));
  connect(springDamper1.flange_b, angleToTorqueAdaptor1.flange) annotation (
    Line(points = {{182, 0}, {200, 0}}));
  connect(torqueToAngleAdaptor1.w, w_TM_PNT_AT_Gear_radps) annotation (
    Line(points = {{-245, 5}, {-252, 5}, {-252, 30}, {-290, 30}}, color = {0, 0, 127}));
  connect(integrator1.y, angleToTorqueAdaptor1.phi) annotation (
    Line(points = {{219, 30}, {210, 30}, {210, 8}, {205, 8}}, color = {0, 0, 127}));
  connect(angleToTorqueAdaptor1.tau, gain3.u) annotation (
    Line(points = {{205, -8}, {210, -8}, {210, -30}, {219, -30}}, color = {0, 0, 127}));
  connect(D_TRB2.flange_b, D_OS2.flange_a) annotation (
    Line(points = {{106, 0}, {120, 0}}));
  connect(D_TRB1.support, fixed.flange) annotation (
    Line(points = {{4, -10}, {4, -20}}));
  connect(fixed1.flange, D_OS1.support) annotation (
    Line(points = {{36, -20}, {36, -10}}));
  connect(fixed2.flange, D_TRB2.support) annotation (
    Line(points = {{96, -20}, {96, -10}}));
  connect(fixed3.flange, D_OS2.support) annotation (
    Line(points = {{130, -20}, {130, -10}}));
  connect(D_OS2.flange_b, springDamper1.flange_a) annotation (
    Line(points = {{140, 0}, {162, 0}}));
  connect(D_TRB1.flange_b, D_OS1.flange_a) annotation (
    Line(points = {{14, 0}, {26, 0}}));
  connect(inertia1.flange_b, hypoidGear.pinion) annotation (
    Line(points = {{-74, 0}, {-56, 0}}));
  connect(D_AGB2.flange_b, inertia1.flange_a) annotation (
    Line(points = {{-112, 0}, {-94, 0}}));
  connect(hypoidGear.nu_oil_m2ps, nu_oil_m2ps) annotation (
    Line(points = {{-58, -6}, {-64, -6}, {-64, -70}, {-300, -70}}, color = {0, 255, 0}));
  connect(D_AGB2.nu_oil_m2ps, nu_oil_m2ps) annotation (
    Line(points = {{-134, -6}, {-140, -6}, {-140, -70}, {-300, -70}}, color = {0, 255, 0}));
  connect(D_AGB1.nu_oil_m2ps, nu_oil_m2ps) annotation (
    Line(points = {{-180, -6}, {-186, -6}, {-186, -70}, {-300, -70}}, color = {0, 255, 0}));
  connect(multiSum.y, Qf_DF_PNT_W) annotation (
    Line(points = {{186, -80}, {250, -80}}, color = {191, 0, 0}));
  connect(hypoidGear.PHI_W, multiSum.u[1]) annotation (
    Line(points = {{-35, -8}, {-30, -8}, {-30, -80}, {164, -80}}, color = {191, 0, 0}));
  connect(D_AGB1.PHI_W, multiSum.u[2]) annotation (
    Line(points = {{-157, -8}, {-152, -8}, {-152, -80}, {164, -80}}, color = {191, 0, 0}));
  connect(D_AGB2.PHI_W, multiSum.u[3]) annotation (
    Line(points = {{-111, -8}, {-106, -8}, {-106, -80}, {164, -80}}, color = {191, 0, 0}));
  connect(D_TRB1.PHI_W, multiSum.u[4]) annotation (
    Line(points = {{15, -8}, {20, -8}, {20, -80}, {164, -80}}, color = {191, 0, 0}));
  connect(D_OS1.PHI_W, multiSum.u[5]) annotation (
    Line(points = {{47, -8}, {52, -8}, {52, -80}, {164, -80}}, color = {191, 0, 0}));
  connect(D_TRB2.PHI_W, multiSum.u[6]) annotation (
    Line(points = {{107, -8}, {112, -8}, {112, -80}, {164, -80}}, color = {191, 0, 0}));
  connect(D_OS2.PHI_W, multiSum.u[7]) annotation (
    Line(points = {{141, -8}, {146, -8}, {146, -80}, {164, -80}}, color = {191, 0, 0}));
  connect(D_TRB1.nu_oil_m2ps, nu_oil_m2ps) annotation (
    Line(points = {{-8, -6}, {-14, -6}, {-14, -70}, {-300, -70}}, color = {0, 255, 0}));
  connect(D_TRB2.nu_oil_m2ps, nu_oil_m2ps) annotation (
    Line(points = {{84, -6}, {76, -6}, {76, -70}, {-300, -70}}, color = {0, 255, 0}));
  connect(hypoidGear.ring, D_TRB1.flange_a) annotation (
    Line(points = {{-36, 0}, {-6, 0}}));
  connect(D_OS1.flange_b, D_TRB2.flange_a) annotation (
    Line(points = {{46, 0}, {86, 0}}));
  connect(D_AGB1.flange_b, D_AGB2.flange_a) annotation (
    Line(points = {{-158, 0}, {-134, 0}, {-134, 0}, {-132, 0}}));
  connect(hypoidGear.GearLoad, LoadDistribution_A1A2.GearLoad) annotation (
    Line(points = {{-35, 5}, {-30, 5}, {-30, 30}, {-70, 30}, {-70, 65}, {-83, 65}}, color = {255, 85, 0}, thickness = 0.5));
  connect(LoadDistribution_A1A2.F_AGB1[1], D_AGB1.Fr) annotation (
    Line(points = {{-117.5, 71}, {-186, 71}, {-186, 30}, {-170, 30}, {-170, 12}}, color = {0, 255, 0}));
  connect(LoadDistribution_A1A2.F_AGB1[2], D_AGB1.Fth) annotation (
    Line(points = {{-117.5, 71}, {-186, 71}, {-186, 8}, {-180, 8}}, color = {0, 255, 0}));
  connect(LoadDistribution_A1A2.F_AGB2[1], D_AGB2.Fr) annotation (
    Line(points = {{-117.5, 59}, {-140, 59}, {-140, 30}, {-124, 30}, {-124, 12}}, color = {0, 255, 0}));
  connect(LoadDistribution_A1A2.F_AGB2[2], D_AGB2.Fth) annotation (
    Line(points = {{-117.5, 59}, {-140, 59}, {-140, 8}, {-134, 8}}, color = {0, 255, 0}));
  connect(LoadDistribution_T1T2.F_TRB2[1], D_TRB2.Fr) annotation (
    Line(points = {{-22.5, 59}, {76, 59}, {76, 30}, {94, 30}, {94, 12}}, color = {0, 255, 0}));
  connect(LoadDistribution_T1T2.F_TRB2[2], D_TRB2.Fth) annotation (
    Line(points = {{-22.5, 59}, {76, 59}, {76, 8}, {84, 8}}, color = {0, 255, 0}));
  connect(LoadDistribution_T1T2.F_TRB1[1], D_TRB1.Fr) annotation (
    Line(points = {{-22.5, 71}, {-14, 71}, {-14, 30}, {2, 30}, {2, 12}}, color = {0, 255, 0}));
  connect(LoadDistribution_T1T2.F_TRB1[2], D_TRB1.Fth) annotation (
    Line(points = {{-22.5, 71}, {-14, 71}, {-14, 8}, {-8, 8}}, color = {0, 255, 0}));
  connect(LoadDistribution_T1T2.GearLoad, hypoidGear.GearLoad) annotation (
    Line(points = {{-57, 65}, {-70, 65}, {-70, 30}, {-30, 30}, {-30, 5}, {-35, 5}}, color = {255, 85, 0}, thickness = 0.5));
  connect(t_trans_fluid_K, to_degC.u) annotation (
    Line(points = {{-300, 90}, {-222, 90}}, color = {0, 0, 127}));
  connect(to_degC.y, LoadDistribution_A1A2.Toil) annotation (
    Line(points = {{-198, 90}, {-100, 90}, {-100, 84}, {-100, 84}}, color = {0, 0, 127}));
  connect(to_degC.y, LoadDistribution_T1T2.Toil) annotation (
    Line(points = {{-198, 90}, {-38, 90}, {-38, 84}, {-38, 84}}, color = {0, 0, 127}));
  connect(torqueToAngleAdaptor1.flange, D_OS3.flange_a) annotation (
    Line(points = {{-240, 0}, {-224, 0}, {-224, 0}, {-224, 0}}));
  connect(fixed4.flange, D_OS3.support) annotation (
    Line(points = {{-214, -20}, {-214, -20}, {-214, -10}, {-214, -10}}));
  connect(D_OS3.flange_b, D_AGB1.flange_a) annotation (
    Line(points = {{-204, 0}, {-178, 0}, {-178, 0}, {-178, 0}}));
  connect(D_OS3.PHI_W, multiSum.u[8]) annotation (
    Line(points = {{-202, -8}, {-198, -8}, {-198, -80}, {164, -80}, {164, -80}}, color = {191, 0, 0}));
  connect(D_AGB2.support, fixed5.flange) annotation (
    Line(points = {{-122, -10}, {-122, -10}, {-122, -20}, {-122, -20}}));
  connect(D_AGB1.support, fixed6.flange) annotation (
    Line(points = {{-168, -10}, {-168, -10}, {-168, -20}, {-168, -20}}));
  annotation (
    Icon(coordinateSystem(extent = {{-100, -160}, {100, 100}}, initialScale = 0.1), graphics={  Text(origin = {0, -180}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -160}}), Rectangle(origin = {1, 10}, extent = {{-13, 36}, {13, -50}}), Rectangle(origin = {2, -62}, extent = {{-14, -30}, {12, 22}}), Line(origin = {-32.25, 2.66667}, points = {{19, 0}, {-19, 0}}), Line(origin = {27.75, -63.3333}, points = {{-15, 0}, {15, 0}}), Text(origin = {134, -82}, extent = {{-36, 10}, {20, -10}}, textString = "QfDF"), Text(origin = {130, -24}, extent = {{-40, 20}, {20, -10}}, textString = "T"), Text(origin = {130, 72}, extent = {{-40, 20}, {20, -10}}, textString = "w"), Text(origin = {-110, 62}, extent = {{-40, 20}, {20, -10}}, textString = "w"), Text(origin = {-110, -16}, extent = {{-40, 20}, {20, -10}}, textString = "T"), Text(origin = {-124, -78}, extent = {{-82, 22}, {20, -10}}, textString = "Oil Viscosity"), Text(origin = {-120, -130}, extent = {{-60, 10}, {20, -10}}, textString = "ToutOil")}),
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-280, -100}, {240, 100}}, initialScale = 0.1), graphics = {Text(origin = {20, 24}, extent = {{-16, 8}, {16, -8}}, textString = "L側"), Text(origin = {114, 24}, extent = {{-16, 8}, {16, -8}}, textString = "R側")}),
    __OpenModelica_commandLineOptions = "",
    version = "");
end FinalGear;
