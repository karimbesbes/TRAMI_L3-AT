within TRAMI_L3_STEP_AT.TransMission.Mechanics;
model TransMission
  constant Real GearRatio[9] = {5.354, 3.243, 2.252, 1.636, 1.211, 1, 0.865, 0.717, 0.601};
  Real SyncRev[9];
  parameter Real Oil_Viscosity_Breakpoint[5]={5.1e-6, 6.0e-6, 9.7e-6, 18.0e-6, 39.4e-6};
  Modelica.Blocks.Interfaces.RealInput tau_clutch_cap[6] annotation (
    Placement(visible = true, transformation(origin = {-120, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput trq_FW_PNT_in_Nm annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_DS_PNT_out_radps annotation (
    Placement(visible = true, transformation(origin={-221, -39.6}, extent={{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_ENG_PNT_radps annotation (
    Placement(visible = true, transformation(origin = {110, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput trq_DS_PNT_out_Nm annotation (
    Placement(visible = true, transformation(origin = {110, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qf_GB_PNT_W annotation (
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ratio_AT annotation (
    Placement(visible = true, transformation(origin = {-120, -76}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput p_line_Pa annotation (
    Placement(visible = true, transformation(origin = {-120, -108}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_gearbox_input_radps annotation (
    Placement(visible = true, transformation(origin = {110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 260}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_gearbox_output_radps annotation (
    Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I_actuator_A annotation (
    Placement(visible = true, transformation(origin = {-120, -170}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I_EOP_A annotation (
    Placement(visible = true, transformation(origin = {-120, -210}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -240}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput V_BT_PNT_Lo_V annotation (
    Placement(visible = true, transformation(origin = {-120, -250}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qf_HYD_W annotation (
    Placement(visible = true, transformation(origin = {110, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -220}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qf_SD_PNT_W annotation (
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.OilPump oilPump(Oil_Pump_Loss_Table_Filename = "OP.txt", Oil_Viscosity_Breakpoint = {5.1e-6, 6.0e-6, 9.7e-6, 18.0e-6, 39.4e-6}) annotation (
    Placement(visible = true, transformation(origin = {6, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Vehicle.Flywheel Flywheel(Jfw = 0.29) annotation (
    Placement(visible = true, transformation(origin = {-70, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Electrics.Actuator_eLoss actuator_eLoss annotation (
    Placement(visible = true, transformation(origin = {6, -174}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Electrics.EOP_eLoss eOP_eLoss annotation (
    Placement(visible = true, transformation(origin = {6, -214}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.TransMission.Mechanics.AT_DS at_ds(Oil_Viscosity_Breakpoint = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {6, 1.49012e-08}, extent = {{-10, -30}, {10, 28}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add3 annotation (
    Placement(visible = true, transformation(origin = {70, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_lockup_cap annotation (
    Placement(visible = true, transformation(origin = {-120, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 240}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ToutOil annotation (
    Placement(visible = true, transformation(origin = {-120, -138}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
 Modelica.Blocks.Continuous.Integrator integrator
   annotation (Placement(transformation(origin={-165, -40.4}, extent={{-10, -10}, {10, 10}})));
 Modelica.Blocks.Continuous.Derivative derivative
   annotation (Placement(transformation(origin={-122, -40.7}, extent={{-10, -10}, {10, 10}})));
equation
  for i in 1:9 loop
    SyncRev[i] = w_gearbox_output_radps * GearRatio[i];
  end for;
  connect(p_line_Pa, at_ds.p_line_Pa) annotation (
    Line(points = {{-120, -108}, {-30, -108}, {-30, -10}, {-6, -10}}, color = {0, 0, 127}));
  connect(Flywheel.w_TM_PNT_FW_radps, at_ds.w_TM_PNT_FW_radps) annotation (
    Line(points = {{-59, 8}, {-6, 8}}, color = {0, 0, 127}));
  connect(nu_oil_m2ps, at_ds.nu_oil_m2ps) annotation (
    Line(points = {{-120, 40}, {-44, 40}, {-44, 14}, {-6, 14}}, color = {0, 0, 127}));
  connect(nu_oil_m2ps, oilPump.nu_oil_m2ps) annotation (
    Line(points = {{-120, 40}, {-44, 40}, {-44, -72}, {-5, -72}}, color = {0, 0, 127}));
  connect(ratio_AT, at_ds.ratio_AT) annotation (
    Line(points = {{-120, -76}, {-36, -76}, {-36, -4}, {-6, -4}}, color = {0, 0, 127}));
  connect(oilPump.PHI_TM_PNT_OP_W, add3.u1) annotation (
    Line(points = {{17, -72}, {38, -72}, {38, -102}, {58, -102}}, color = {0, 0, 127}));
  connect(p_line_Pa, oilPump.p_Line_Pa) annotation (
    Line(points = {{-120, -108}, {-30, -108}, {-30, -68}, {-5, -68}}, color = {0, 0, 127}));
  connect(tau_lockup_cap, at_ds.tau_lockup_cap) annotation (
    Line(points = {{-120, 70}, {-20, 70}, {-20, 20}, {-6, 20}}, color = {0, 0, 127}));
  connect(tau_clutch_cap, at_ds.tau_clutch_cap) annotation (
    Line(points = {{-120, 100}, {-12, 100}, {-12, 26}, {-6, 26}}, color = {0, 0, 127}, thickness = 0.5));
  connect(add3.y, Qf_HYD_W) annotation (
    Line(points = {{81, -110}, {110, -110}}, color = {0, 0, 127}));
  connect(at_ds.Qf_GB_PNT_W, Qf_GB_PNT_W) annotation (
    Line(points = {{17, -16}, {50, -16}, {50, -70}, {110, -70}}, color = {0, 0, 127}));
  connect(at_ds.Qf_SD_PNT_W, Qf_SD_PNT_W) annotation (
    Line(points = {{17, -10}, {60, -10}, {60, -30}, {110, -30}}, color = {0, 0, 127}));
  connect(eOP_eLoss.PHI_TM_PNT_EOP_W, add3.u3) annotation (
    Line(points = {{17, -214}, {52, -214}, {52, -118}, {58, -118}}, color = {0, 0, 127}));
  connect(actuator_eLoss.PHI_TM_PNT_Actuator_W, add3.u2) annotation (
    Line(points = {{17, -174}, {37.5, -174}, {37.5, -110}, {58, -110}}, color = {0, 0, 127}));
  connect(at_ds.w_gearbox_output_radps, w_gearbox_output_radps) annotation (
    Line(points = {{17, 18}, {50, 18}, {50, 70}, {110, 70}}, color = {0, 0, 127}));
  connect(at_ds.w_gearbox_input_radps, w_gearbox_input_radps) annotation (
    Line(points = {{17, 26}, {40, 26}, {40, 90}, {110, 90}}, color = {0, 0, 127}));
  connect(Flywheel.w_ENG_PNT_radps, w_ENG_PNT_radps) annotation (
    Line(points = {{-81, 8}, {-88, 8}, {-88, 46}, {110, 46}}, color = {0, 0, 127}));
  connect(trq_FW_PNT_in_Nm, Flywheel.trq_ENG_PNT_in_Nm) annotation (
    Line(points = {{-120, 0}, {-82, 0}}, color = {0, 0, 127}));
  connect(V_BT_PNT_Lo_V, actuator_eLoss.V_BT_PNT_Lo_V) annotation (
    Line(points = {{-120, -250}, {-20, -250}, {-20, -178}, {-6, -178}}, color = {0, 0, 127}));
  connect(I_actuator_A, actuator_eLoss.I_actuator_A) annotation (
    Line(points = {{-120, -170}, {-6, -170}}, color = {0, 0, 127}));
  connect(V_BT_PNT_Lo_V, eOP_eLoss.V_BT_PNT_Lo_V) annotation (
    Line(points = {{-120, -250}, {-20, -250}, {-20, -218}, {-6, -218}}, color = {0, 0, 127}));
  connect(I_EOP_A, eOP_eLoss.I_EOP_A) annotation (
    Line(points = {{-120, -210}, {-6, -210}}, color = {0, 0, 127}));
  connect(at_ds.trq_TM_PNT_FW_Nm, Flywheel.trq_TM_PNT_FW_Nm) annotation (
    Line(points = {{17, 8}, {40, 8}, {40, -44}, {-52, -44}, {-52, 0}, {-58, 0}}, color = {0, 0, 127}));
  connect(at_ds.trq_DS_PNT_out_Nm, trq_DS_PNT_out_Nm) annotation (
    Line(points = {{18, 2}, {102, 2}, {102, 2}, {110, 2}}, color = {0, 0, 127}));
  connect(oilPump.trq_AT_PNT_Nm, at_ds.trq_TM_PNT_OP_Nm) annotation (
    Line(points = {{-4, -62}, {-18, -62}, {-18, -22}, {-6, -22}, {-6, -22}}, color = {0, 0, 127}));
  connect(at_ds.w_TM_PNT_OP_radps, oilPump.w_AT_PNT_radps) annotation (
    Line(points = {{-4, -26}, {-12, -26}, {-12, -56}, {-6, -56}, {-6, -56}}, color = {0, 0, 127}));
  connect(ToutOil, at_ds.t_trans_fluid_K) annotation (
    Line(points = {{-120, -138}, {-24, -138}, {-24, -16}, {-6, -16}, {-6, -16}}, color = {0, 0, 127}));
  connect(w_DS_PNT_out_radps, integrator.u)
  annotation(Line(points={{-221, -39.6}, {-177, -39.6}, {-177, -40.4}}));
  connect(integrator.y, derivative.u)
  annotation(Line(points={{-154, -40.4}, {-134, -40.4}, {-134, -40.7}}));
  connect(derivative.y, at_ds.w_DS_PNT_out_radps)
  annotation(Line(points={{-111, -40.7}, {-39.7, -40.7}, {-39.7, 2}, {-6, 2}}));
  annotation (
    Diagram(coordinateSystem(extent={{-100, -300}, {100, 280}})),
    __OpenModelica_commandLineOptions = "",
    Icon(coordinateSystem(extent = {{-100, -320}, {100, 320}}), graphics={  Rectangle(origin = {0, -10}, extent = {{-100, 330}, {100, -310}}), Text(origin = {0, -348}, lineColor = {0, 0, 255}, extent = {{-140, 26}, {140, -26}}, textString = "%name")}));
end TransMission;
