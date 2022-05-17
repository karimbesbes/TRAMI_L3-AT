within TRAMI_L3_STEP_AT.TransMission.Mechanics;
model AT_DS
  parameter Real Oil_Viscosity_Breakpoint[:];
  Modelica.Blocks.Interfaces.RealInput tau_lockup_cap annotation (
    Placement(visible = true, transformation(origin = {-140, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 200}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_clutch_cap[6] annotation (
    Placement(visible = true, transformation(origin = {-140, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 260}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_TM_PNT_FW_radps annotation (
    Placement(visible = true, transformation(origin = {-140, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_DS_PNT_out_radps annotation (
    Placement(visible = true, transformation(origin = {-140, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput trq_TM_PNT_FW_Nm annotation (
    Placement(visible = true, transformation(origin = {130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput trq_DS_PNT_out_Nm annotation (
    Placement(visible = true, transformation(origin = {130, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ratio_AT annotation (
    Placement(visible = true, transformation(origin = {-140, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput p_line_Pa annotation (
    Placement(visible = true, transformation(origin = {-140, -116}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-140, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qf_GB_PNT_W annotation (
    Placement(visible = true, transformation(origin = {130, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_gearbox_input_radps annotation (
    Placement(visible = true, transformation(origin = {130, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 260}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_gearbox_output_radps annotation (
    Placement(visible = true, transformation(origin = {130, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qf_SD_PNT_W annotation (
    Placement(visible = true, transformation(origin = {130, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.DriveShaft driveShaft(Jds = 0.01, c = 1e4, d = 632.5) annotation (
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.FinalGear finalGear(GearRatio = 3.066, Jdf = 0.01, Oil_Viscosity_Breakpoint = {12.4e-6, 20.4e-6, 37.7e-6, 82.0e-6, 223.4e-6}, c = 1e4, d = 1e6) annotation (
    Placement(visible = true, transformation(origin = {52.175, 0.251393}, extent = {{-13.681, -16.8381}, {13.681, 10.5238}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qf_DF_PNT_W annotation (
    Placement(visible = true, transformation(origin = {130, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -280}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.TransmissionGear transmissionGear(Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {0, -4}, extent = {{-10, -26}, {10, 26}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_TM_PNT_OP_radps annotation (
    Placement(visible = true, transformation(origin = {-130, -230}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, -270}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput trq_TM_PNT_OP_Nm annotation (
    Placement(visible = true, transformation(origin = {-140, -190}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -220}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.TorqueConverter torqueConverter(CapacityCoefficientTabName = "CapacityCoefficient", J_in = 0.08, J_out = 0.08, LUdamper_d = 1e1, Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint, StartDeviceFileName = "TorqueConverter.txt", TorqueRatioTabName = "TorqueRatio") annotation (
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -15}, {10, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput t_trans_fluid_K annotation (
    Placement(visible = true, transformation(origin = {-140, -152}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation (
    Placement(visible = true, transformation(origin = {100, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D nu_oil_AT2DF(table = [4.0e-06, 1.24e-05; 4.1e-06, 1.24e-05; 6.0e-06, 2.04e-05; 9.7e-06, 3.77e-05; 1.80e-05, 8.2e-05; 3.94e-05, 2.23e-04; 3.95e-05, 2.23e-04])  annotation (
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(finalGear.w_TM_PNT_AT_Gear_radps, w_gearbox_output_radps) annotation (
    Line(points = {{37, 4}, {26, 4}, {26, 80}, {130, 80}}, color = {0, 0, 127}));
  connect(finalGear.trq_TM_PNT_DF_Nm, driveShaft.trq_TM_PNT_DF_Nm) annotation (
    Line(points = {{67, -4}, {78, -4}}, color = {0, 0, 127}));
  connect(driveShaft.w_TM_PNT_DF_radps, finalGear.w_TM_PNT_DF_radps) annotation (
    Line(points = {{79, 4}, {69, 4}}, color = {0, 0, 127}));
  connect(finalGear.Qf_DF_PNT_W, Qf_DF_PNT_W) annotation (
    Line(points = {{67, -10}, {70, -10}, {70, -220}, {130, -220}}, color = {0, 0, 127}));
  connect(finalGear.w_TM_PNT_AT_Gear_radps, transmissionGear.w_TM_PNT_AT_Gear_radps) annotation (
    Line(points = {{37, 4}, {12, 4}}, color = {0, 0, 127}));
  connect(transmissionGear.ratio_AT, ratio_AT) annotation (
    Line(points = {{-12, -12}, {-34, -12}, {-34, -80}, {-140, -80}}, color = {0, 0, 127}));
  connect(transmissionGear.p_line_Pa, p_line_Pa) annotation (
    Line(points = {{-12, -20}, {-28, -20}, {-28, -116}, {-140, -116}}, color = {0, 0, 127}));
  connect(transmissionGear.w_TM_PNT_TC_radps, w_gearbox_input_radps) annotation (
    Line(points = {{-11, 4}, {-20, 4}, {-20, 100}, {130, 100}}, color = {0, 0, 127}));
  connect(nu_oil_m2ps, transmissionGear.Nu_oil_m2ps) annotation (
    Line(points = {{-140, 40}, {-108, 40}, {-108, -60}, {-20, -60}, {-20, -28}, {-12, -28}}, color = {0, 0, 127}));
  connect(tau_clutch_cap, transmissionGear.tau_clutch_cap) annotation (
    Line(points = {{-140, 100}, {-30, 100}, {-30, 18}, {-12, 18}}, color = {0, 0, 127}, thickness = 0.5));
  connect(transmissionGear.w_TM_PNT_TC_radps, torqueConverter.w_TM_PNT_TC_radps) annotation (
    Line(points = {{-11, 4}, {-48, 4}}, color = {0, 0, 127}));
  connect(torqueConverter.trq_TM_PNT_TC_Nm, transmissionGear.trq_TM_PNT_TC_Nm) annotation (
    Line(points = {{-49, -4}, {-30.5, -4}, {-30.5, -3}, {-12, -3}}, color = {0, 0, 127}));
  connect(tau_lockup_cap, torqueConverter.tau_lockup_cap) annotation (
    Line(points = {{-140, 70}, {-60, 70}, {-60, 17}}, color = {0, 0, 127}));
  connect(torqueConverter.Qf_SD_PNT_W, Qf_SD_PNT_W) annotation (
    Line(points = {{-49, -10}, {-40, -10}, {-40, -100}, {130, -100}}, color = {0, 0, 127}));
  connect(w_TM_PNT_FW_radps, torqueConverter.w_TM_PNT_FW_radps) annotation (
    Line(points = {{-140, -2}, {-72, -2}}, color = {0, 0, 127}));
  connect(transmissionGear.trq_TM_PNT_AT_GEAR_Nm, finalGear.trq_TM_PNT_AT_Gear_Nm) annotation (
    Line(points = {{11, -3}, {24, -3}, {24, -4}, {36, -4}}, color = {0, 0, 127}));
  connect(w_DS_PNT_out_radps, driveShaft.w_DS_PNT_out_radps) annotation (
    Line(points = {{-140, -40}, {110, -40}, {110, 4}, {102, 4}, {102, 4}}, color = {0, 0, 127}));
  connect(torqueConverter.w_TM_PNT_OP_radps, w_TM_PNT_OP_radps) annotation (
    Line(points = {{-71, 12}, {-100, 12}, {-100, -230}, {-130, -230}}, color = {0, 0, 127}));
  connect(torqueConverter.trq_TM_PNT_OP_Nm, trq_TM_PNT_OP_Nm) annotation (
    Line(points = {{-72, 6}, {-90, 6}, {-90, -190}, {-140, -190}}, color = {0, 0, 127}));
  connect(trq_TM_PNT_FW_Nm, torqueConverter.trq_TM_PNT_FW_Nm) annotation (
    Line(points = {{130, 60}, {-80, 60}, {-80, -8}, {-71, -8}}, color = {0, 0, 127}));
  connect(torqueConverter.nu_oil_m2ps, nu_oil_m2ps) annotation (
    Line(points = {{-72, -14}, {-80, -14}, {-80, -60}, {-108, -60}, {-108, 40}, {-140, 40}}, color = {0, 0, 127}));
  connect(add.y, Qf_GB_PNT_W) annotation (
    Line(points = {{112, -140}, {122, -140}, {122, -140}, {130, -140}}, color = {0, 0, 127}));
  connect(transmissionGear.Qf_GB_PNT_W, add.u2) annotation (
    Line(points = {{11, -20}, {18, -20}, {18, -146}, {88, -146}}, color = {0, 0, 127}));
  connect(torqueConverter.Qf_GB_PNT_W, add.u1) annotation (
    Line(points = {{-48, -14}, {-46, -14}, {-46, -106}, {80, -106}, {80, -134}, {88, -134}, {88, -134}}, color = {0, 0, 127}));
  connect(tau_lockup_cap, transmissionGear.tau_lockup_cap) annotation (
    Line(points = {{-140, 70}, {-40, 70}, {-40, 10}, {-12, 10}, {-12, 11}}, color = {0, 0, 127}));
  connect(driveShaft.trq_DS_PNT_out_Nm, trq_DS_PNT_out_Nm) annotation (
    Line(points = {{102, -4}, {122, -4}, {122, -4}, {130, -4}}, color = {0, 0, 127}));
  connect(t_trans_fluid_K, finalGear.t_trans_fluid_K) annotation (
    Line(points = {{-140, -152}, {30, -152}, {30, -18}, {36, -18}, {36, -16}}, color = {0, 0, 127}));
  connect(nu_oil_m2ps, nu_oil_AT2DF.u[1]) annotation (
    Line(points = {{-140, 40}, {-108, 40}, {-108, -60}, {-12, -60}}, color = {0, 0, 127}));
  connect(nu_oil_AT2DF.y[1], finalGear.nu_oil_m2ps) annotation (
    Line(points = {{11, -60}, {24, -60}, {24, -10}, {36, -10}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-120, -280}, {120, 280}})),
    __OpenModelica_commandLineOptions = "",
    Icon(coordinateSystem(extent = {{-100, -300}, {100, 280}}, initialScale = 0.1), graphics={  Rectangle(origin = {0, -10}, extent = {{-100, 290}, {100, -290}}), Text(origin = {0, -334}, lineColor = {0, 0, 255}, extent = {{-140, 26}, {140, -26}}, textString = "%name")}),
    uses(Modelica(version = "3.2.3")),
    version = "");
end AT_DS;
