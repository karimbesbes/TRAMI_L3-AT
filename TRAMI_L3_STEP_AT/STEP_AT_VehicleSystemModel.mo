within TRAMI_L3_STEP_AT;
model STEP_AT_VehicleSystemModel
    constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
   parameter Real Oil_Viscosity_Breakpoint[5]={5.1e-6, 6.0e-6, 9.7e-6, 18.0e-6, 39.4e-6};
    Modelica.Blocks.Interfaces.RealOutput y annotation (
      Placement(visible = true, transformation(origin = {190, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {190, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y1 annotation (
      Placement(visible = true, transformation(origin = {190, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {190, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Clock clock(offset = 0, startTime = 0) annotation (
      Placement(visible = true, transformation(origin = {-294, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(columns = 2:8, fileName = currDir + "/ModelicaInputData.txt", smoothness = Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1, tableName = "tab1", tableOnFile = true) annotation (
      Placement(visible = true, transformation(origin = {-258, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TRAMI_L3_STEP_AT.Control.MultiSignal_Input multiSignal_Input annotation (
      Placement(visible = true, transformation(origin = {-84, 62}, extent = {{-10, -30}, {10, 30}}, rotation = 0)));
    TRAMI_L3_STEP_AT.Control.TCU_Main_Execution tCU_Main_Execution(samplePeriod = 0.01) annotation (
      Placement(visible = true, transformation(origin = {-52, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TRAMI_L3_STEP_AT.Control.MultiSignal_Output multiSignal_Output annotation (
      Placement(visible = true, transformation(origin={-21.8, 66}, extent={{-10, -20}, {10, 20}})));
    TRAMI_L3_STEP_AT.Vehicle.Driver driver(Accelerator_FileName = "Accelerator_open_per_MAP.txt", Accelerator_tabName = "Accelerator_open_per_MAP", Coef_A = vehicle.Coef_A, Coef_C = vehicle.Coef_C, Final_GearRatio = transMission.at_ds.finalGear.GearRatio, Jfw = transMission.Flywheel.Jfw, Mv = vehicle.Mv, Rt = vehicle.Rt) annotation (
      Placement(visible = true, transformation(origin = {-168, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TRAMI_L3_STEP_AT.Vehicle.EngineController engineController1 annotation (
      Placement(visible = true, transformation(origin = {-172, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TRAMI_L3_STEP_AT.Vehicle.ENGINE engine1 annotation (
      Placement(visible = true, transformation(origin = {-144, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TRAMI_L3_STEP_AT.Libraries.Utilities.Min min2 annotation (
      Placement(visible = true, transformation(origin = {-118, -6}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    TRAMI_L3_STEP_AT.TransMission.Mechanics.TransMission transMission(Oil_Viscosity_Breakpoint = {4.1e-6, 6.0e-6, 9.7e-6, 18.0e-6, 39.4e-6}) annotation (
      Placement(visible = true, transformation(origin={57.6, -18.6}, extent={{-10.3, -30}, {10.3, 30}})));
    TRAMI_L3_STEP_AT.Vehicle.VEHICLE vehicle annotation (
      Placement(visible = true, transformation(origin = {154, -4}, extent = {{-25, -15}, {20, 15}}, rotation = 0)));
    TRAMI_L3_STEP_AT.TransMission.Thermal.ThermalModelAll thermalModelAll(Nutable1 = {{-30, 39.4}, {0, 39.4}, {20, 39.4}, {40, 18.0}, {60, 9.7}, {80, 6.0}, {100, 4.1}, {120, 4.1}}, R1 = 100, R2 = 0.340, R3 = 100, R4 = 100, R5 = 0.004, R6 = 0.0001, R7 = 0.07, RhoTable1 = {{-30, 39.4}, {0, 39.4}, {20, 39.4}, {40, 18.0}, {60, 9.7}, {80, 6.0}, {100, 4.1}, {120, 4.1}}, T0(displayUnit = "degC") = 300, T1(displayUnit = "degC") = 300, T2(displayUnit = "degC") = 300, T3(displayUnit = "degC") = 300, c1 = 10000, c2 = 30000, c3 = 15000, c4 = 10000, table1 = {{0, 0.015}, {10, 0.015}, {20, 0.015}, {30, 0.014}, {40, 0.014}, {50, 0.014}, {60, 0.013}, {70, 0.013}, {80, 0.013}, {90, 0.012}, {100, 0.012}, {110, 0.012}, {120, 0.012}, {130, 0.011}, {140, 0.011}, {150, 0.011}, {160, 0.010}}) annotation (
      Placement(visible = true, transformation(origin = {40, -112}, extent = {{-12.5, -50}, {12.5, 50}}, rotation = -90)));
    Modelica.Blocks.Sources.Constant degC2K(k = 273.15) annotation (
      Placement(visible = true, transformation(origin = {-86, -70}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Add air annotation (
      Placement(visible = true, transformation(origin = {-52, -56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Add eng annotation (
      Placement(visible = true, transformation(origin = {-52, -74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Add pt_th annotation (
      Placement(visible = true, transformation(origin = {-52, -92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Math.Gain rads2rpm(k = 60 / (2 * Modelica.Constants.pi)) annotation (
      Placement(visible = true, transformation(origin = {-208, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant dummy_Batt_V(k = 12) annotation (
      Placement(visible = true, transformation(origin = {-28, -46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Step initialize(height = -1, offset = 1, startTime = 0.001) annotation (
      Placement(visible = true, transformation(origin = {-134, 92}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
    connect(engine1.tau_engine_target, multiSignal_Input.tau_engine_target) annotation (
      Line(points={{-135,2},{-130,2},{-130,44},{-96,44}},          color = {0, 0, 127}));
    connect(transMission.w_ENG_PNT_radps, engine1.w_ENG_PNT_radps) annotation (
      Line(points={{68.93,-11.1},{26,-11.1},{26,20},{86,20},{86,6},{-135,6}}));
    connect(engine1.accel_position_per1, engineController1.accel_position_per1) annotation (
      Line(points={{-153.4,4},{-161,4}},    color = {0, 0, 127}));
    connect(engine1.tau_engine_target, min2.u1) annotation (
      Line(points={{-135,2},{-130,2},{-130,-2.4},{-125.2,-2.4}},    color = {0, 0, 127}));
    connect(multiSignal_Output.ratio_AT, driver.Ratio_AT) annotation (
      Line(points={{-10.8, 52}, {-4, 52}, {-4, -24}, {-234, -24}, {-234, 40}, {-180, 40}}));
    connect(transMission.w_ENG_PNT_radps, driver.w_ENG_PNT_radps) annotation (
      Line(points={{68.93,-11.1},{-228,-11.1},{-228,-30},{-94,-30},{-94,-4},{28,
          -4},{28,10},{88,10},{88,30},{-180,30}}));
    connect(vehicle.v_vehicle_mps, driver.v_vehicle_mps) annotation (
      Line(points={{162.6,-0.6},{170,-0.6},{170,122},{-188,122},{-188,36},{-180,
          36}},                                                                            color = {0, 0, 127}));
    connect(driver.accel_position_per, multiSignal_Input.accel_position_per) annotation (
      Line(points={{-157.4,46},{-152,46},{-152,68},{-96,68}},        color = {0, 0, 127}));
    connect(driver.tau_brake, multiSignal_Input.tau_brake) annotation (
      Line(points={{-157.4,36},{-124,36},{-124,56},{-96,56}},        color = {0, 0, 127}));
    connect(driver.tau_brake, vehicle.tau_brake) annotation (
      Line(points={{-157.4,36},{-124,36},{-124,26},{138,26},{138,-6},{145.9,-6},
          {145.9,-4.9}},                                                                              color = {0, 0, 127}));
    connect(combiTable1Ds.y[1], driver.Target_Speed) annotation (
      Line(points={{-247,72},{-247,67},{-198,67},{-198,54},{-180,54}}));
    connect(driver.accel_position_per, engineController1.accel_position_per) annotation (
      Line(points={{-157.4,46},{-152,46},{-152,24},{-190,24},{-190,12},{-184,12}},            color = {0, 0, 127}));
    connect(combiTable1Ds.y[6], eng.u1) annotation (
      Line(points={{-247,72},{-238,72},{-238,-52},{-64,-52},{-64,-70.4},{-59.2,
          -70.4}}));
    connect(combiTable1Ds.y[7], pt_th.u1) annotation (
      Line(points={{-247,72},{-247,59},{-238,59},{-238,-52},{-64,-52},{-64,
          -88.4},{-59.2,-88.4}}));
    connect(combiTable1Ds.y[5], air.u1) annotation (
      Line(points={{-247,72},{-247,49.9},{-238,49.9},{-238,-52.4},{-59.2,-52.4}}));
    connect(combiTable1Ds.y[7], multiSignal_Input.t_engine_water_k) annotation (
      Line(points={{-247,72},{-247,79.9},{-96,79.9},{-96,72}}));
    connect(combiTable1Ds.y[2], multiSignal_Input.trans_shifter_position) annotation (
      Line(points={{-247,72},{-247,87.6},{-118,87.6},{-118,64},{-96,64}}));
    connect(combiTable1Ds.y[3], multiSignal_Input.tau_engine_min_pos) annotation (
      Line(points={{-247,72},{-247,111},{-118,111},{-118,36},{-96,36}}));
    connect(combiTable1Ds.y[4], multiSignal_Input.tau_engine_max_pos) annotation (
      Line(points={{-247,72},{-247,96},{-118,96},{-118,32},{-96,32}}));
    connect(clock.y, combiTable1Ds.u) annotation (
      Line(points = {{-283, 72}, {-270, 72}}, color = {0, 0, 127}));
    connect(transMission.w_ENG_PNT_radps, rads2rpm.u) annotation (
      Line(points={{68.93,-11.1},{86,-11.1},{86,20},{26,20},{26,6},{-96,6},{-96,
          -20},{-230,-20},{-230,0},{-220,0}}));
    connect(transMission.w_ENG_PNT_radps, multiSignal_Input.w_engine_radps) annotation (
      Line(points={{68.93,-11.1},{-20,-11.1},{-20,-12},{-110,-12},{-110,6},{28,
          6},{28,20},{88,20},{88,52},{-96,52}}));
    connect(multiSignal_Output.flag_trans_lock_up, engineController1.flag_trans_lock_up) annotation (
      Line(points={{-10.8, 48}, {-8, 48}, {-8, -14}, {-190, -14}, {-190, -4}, {-184, -4}}));
    connect(multiSignal_Output.ratio_AT, transMission.ratio_AT) annotation (
      Line(points={{-10.8, 52}, {-4, 52}, {-4, -19}, {45, -19}}));
    connect(multiSignal_Output.tau_lockup_cap, transMission.tau_lockup_cap) annotation (
      Line(points={{-10.8, 80}, {38, 80}, {38, 4}, {45, 4}}));
  connect(multiSignal_Output.qv_cooler_trans_fluid_m3ps, thermalModelAll.VIdot1OilCooler) annotation (
      Line(points={{-10.8, 64}, {10, 64}, {10, -100}, {5, -100}}));
    connect(multiSignal_Output.tau_engine_max_req, min2.u2) annotation (
      Line(points={{-10.8, 56}, {0, 56}, {0, 20}, {-128, 20}, {-128, -10}, {-125, -10}}));
  connect(multiSignal_Output.qv_cooler_eng_water_m3ps, thermalModelAll.VIdot2OilCooler) annotation (
      Line(points={{-10.8, 60}, {10, 60}, {10, -100}}));
    connect(tCU_Main_Execution.Sfunction_Out1, multiSignal_Output.u) annotation (
      Line(points={{-41, 66}, {-33.8, 66}}));
    connect(multiSignal_Output.p_line_Pa, transMission.p_line_Pa) annotation (
      Line(points={{-10.8, 76}, {34, 76}, {34, -24}, {45, -24}}));
    connect(transMission.I_actuator_A, multiSignal_Output.i_actuator_ampere) annotation (
      Line(points={{-10.8, 72}, {22, 72}, {22, -35}, {45, -35}}));
    connect(transMission.I_EOP_A, multiSignal_Output.i_eop_ampere) annotation (
      Line(points={{-10.8, 69.4}, {18, 69.4}, {18, -41}, {45, -41}}));
    connect(multiSignal_Output.tau_clutch_cap, transMission.tau_clutch_cap) annotation (
      Line(points={{-10.8, 84}, {42, 84}, {42, 10}, {45, 10}}));
    connect(multiSignal_Input.y, tCU_Main_Execution.SFunction_in1) annotation (
      Line(points={{-73,70},{-68,70},{-68,70.25},{-64.75,70.25}},
                                            color = {0, 0, 127}, thickness = 0.5));
    connect(min2.y, transMission.trq_FW_PNT_in_Nm) annotation (
      Line(points={{-111.4,-6},{-106,-6},{-106,-7.35},{45.24,-7.35}}));
    connect(min2.y, multiSignal_Input.tau_engine) annotation (
      Line(points={{-111.4,-6},{-108,-6},{-108,40},{-96,40}},        color = {0, 0, 127}));
    connect(rads2rpm.y, engineController1.Neng) annotation (
      Line(points = {{-197, 0}, {-184, 0}}, color = {0, 0, 127}));
    connect(engineController1.w_engine_idle_radps, multiSignal_Input.w_engine_idle_radps) annotation (
      Line(points={{-161,11},{-156,11},{-156,18},{-116,18},{-116,48},{-96,48}},              color = {0, 0, 127}));
    connect(initialize.y, multiSignal_Input.flag_initialize) annotation (
      Line(points={{-127.4,92},{-96,92}},    color = {0, 0, 127}));
    connect(vehicle.v_vehicle_mps, y) annotation (
      Line(points={{162.6,-0.6},{170,-0.6},{170,12},{190,12},{190,12}},    color = {0, 0, 127}));
    connect(vehicle.out_vehicle_G_g, y1) annotation (
      Line(points={{162.6,-2.8},{164.6,-2.8},{164.6,-2.8},{166.6,-2.8},{166.6,
          -2.8},{175,-2.8},{175,-10.8},{190.6,-10.8},{190.6,-10.8},{190.6,-10},
          {190,-10}},                                                                                                                                                                       color = {0, 0, 127}));
  connect(vehicle.v_vehicle_mps, thermalModelAll.vCaseHousing) annotation (
      Line(points={{162.6,-0.6},{170,-0.6},{170,-68},{40,-68},{40,-99.5}},    color = {0, 0, 127}));
    connect(vehicle.w_DS_PNT_out_radps, transMission.w_DS_PNT_out_radps) annotation (
      Line(points={{143,1.8},{30,1.8},{30,24},{90,24},{90,-12.975},{45.24,
          -12.975}}));
    connect(vehicle.v_vehicle_mps, multiSignal_Input.v_vehicle_mps) annotation (
      Line(points={{162.6,-0.6},{170,-0.6},{170,122},{-114,122},{-114,60},{-96,
          60}},                                                                           color = {0, 0, 127}));
  connect(eng.y, thermalModelAll.TinENtoCH) annotation (
      Line(points={{-45.4,-74},{25,-74},{25,-99.5}}));
  connect(thermalModelAll.ToutOil, multiSignal_Input.TinOil_K) annotation (
      Line(points={{65,-124.17},{65,-168},{66,-168},{66,-176},{-102,-176},{-102,
          76},{-96,76}},                                                                                   color = {191, 0, 0}));
    connect(transMission.w_gearbox_input_radps, multiSignal_Input.w_gearbox_input_radps) annotation (
      Line(points={{68.93,5.775},{-102,5.775},{-102,100},{74,100},{74,88},{-96,
          88}}));
    connect(transMission.w_gearbox_output_radps, multiSignal_Input.w_gearbox_output_radps) annotation (
      Line(points={{68.93,0.15},{-106,0.15},{-106,104},{78,104},{78,84},{-96,84}}));
    connect(transMission.V_BT_PNT_Lo_V, dummy_Batt_V.y) annotation (
      Line(points={{45.24,-46.725},{45.24,-51.8},{-16.4,-51.8},{-16.4,-46},{
          -21.4,-46}}));
  connect(thermalModelAll.QfStartDevice, transMission.Qf_SD_PNT_W) annotation (
      Line(points={{60,-99.5},{114,-99.5},{114,-80},{68.93,-80},{68.93,-27.975}}));
  connect(thermalModelAll.QfGear, transMission.Qf_GB_PNT_W) annotation (
      Line(points={{55,-99.5},{110,-99.5},{110,-76},{68.93,-76},{68.93,-33.6}}));
  connect(thermalModelAll.QfOil, transMission.Qf_HYD_W) annotation (
      Line(points={{50,-99.5},{106,-99.5},{106,-72},{68.93,-72},{68.93,-39.225}}));
  connect(thermalModelAll.nuOil, transMission.nu_oil_m2ps) annotation (
      Line(points={{70,-99.5},{70,-60},{45.24,-60},{45.24,-1.725}}));
  connect(air.y, thermalModelAll.TinAirtoCH) annotation (
      Line(points={{-45.4,-56},{35,-56},{35,-99.5}}));
  connect(eng.y, thermalModelAll.TinENtoSD) annotation (
      Line(points={{-45.4,-74},{30,-74},{30,-99.5}}));
  connect(pt_th.y, thermalModelAll.TinTStoOC) annotation (
      Line(points={{-45.4,-92},{0,-92},{0,-99.5}},      color = {0, 0, 127}));
    connect(degC2K.y, eng.u2) annotation (
      Line(points={{-79.4,-70},{-68,-70},{-68,-77.6},{-59.2,-77.6}},  color = {0, 0, 127}));
    connect(degC2K.y, pt_th.u2) annotation (
      Line(points={{-79.4,-70},{-68,-70},{-68,-95.6},{-59.2,-95.6}},  color = {0, 0, 127}));
    connect(degC2K.y, air.u2) annotation (
      Line(points={{-79.4,-70},{-68,-70},{-68,-59.6},{-59.2,-59.6}},  color = {0, 0, 127}));
  connect(thermalModelAll.ToutOil, transMission.ToutOil) annotation (
      Line(points={{65,-124.17},{66,-124.17},{66,-168},{45.24,-168},{45.24,
          -29.85}}));
    connect(transMission.trq_DS_PNT_out_Nm, vehicle.trq_DS_PNT_out_Nm) annotation (
      Line(points={{68.93,-16.725},{90,-16.725},{90,-2},{143.2,-2}}));
    annotation (
      Diagram(coordinateSystem(extent={{-360, -200}, {220, 200}})),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
      experiment(StartTime = 0, StopTime = 1800, Tolerance = 1e-06, Interval = 0.1),
      Icon(coordinateSystem(extent = {{-240, -200}, {280, 200}})),
      __OpenModelica_simulationFlags(cpu = "()", lv = "LOG_STATS", noEventEmit = "()", outputFormat = "mat", s = "dassl"));
end STEP_AT_VehicleSystemModel;
