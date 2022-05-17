within TRAMI_L3_STEP_AT.Control;
block TCU_Main_Execution
  extends Modelica.Blocks.Interfaces.DiscreteBlock;

  function TCU_Main_AT_DCT
    output Real x1[12];
    output Real x2[11];
    output Real x3;
    output Real x4;
    output Real x5;
    output Real x6;
    output Real x7;
    output Real x8;
    output Real x9;
    output Real x10;
    output Real x11;
    output Real x12;
    output Real x13;
    input Real z1;
    input Real z2;
    input Real z3;
    input Real z4[:];
    input Real z5;
    input Real z6;
    input Real z7;
    input Real z8;
    input Real z9;
    input Real z10;
    input Real z11;
    input Real z12;
    input Real z13;
    input Real z14;
    input Real z15;
    input Real z16;

  external"C" TCU_Main_AT_DCT(
        x1,
        x2,
        x3,
        x4,
        x5,
        x6,
        x7,
        x8,
        x9,
        x10,
        x11,
        x12,
        x13,
        z1,
        z2,
        z3,
        z4,
        z5,
        z6,
        z7,
        z8,
        z9,
        z10,
        z11,
        z12,
        z13,
        z14,
        z15,
        z16) annotation (Include="#include <TCU_Main_AT_DCT.c>",
        IncludeDirectory="modelica://TRAMI_L3_STEP_AT/library_etc");
  end TCU_Main_AT_DCT;

  //__Maplesoft_source = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT/library_etc")+"\\TCU_Main_AT_DCT_ForMapleSim.c");
  Modelica.Blocks.Interfaces.RealOutput Sfunction_Out1[34] annotation (
      Placement(
      visible=true,
      transformation(
        origin={110,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput SFunction_in1[26] annotation (Placement(
      visible=true,
      transformation(
        origin={-112,0},
        extent={{-12,-12},{12,12}},
        rotation=0),
      iconTransformation(
        origin={-120,50},
        extent={{-20,-20},{5,5}},
        rotation=0)));
  //output
  Real MO_tau_clutch_cap[12];
  Real MO_f_synchro_n[11];
  Real MO_p_line_pa;
  Real MO_i_actuator_ampere;
  Real MO_i_eop_ampere;
  Real MO_qv_cooler_trans_fluid_m3ps;
  Real MO_qv_cooler_eng_water_m3ps;
  Real MO_tau_engine_max_req;
  Real MO_tau_engine_min_req;
  Real MO_w_engine_target_radps;
  Real MO_tau_trans_input;
  Real MO_trans_gear_ratio;
  Real MO_flag_trans_lock_up;
  //Input
  Real MO_flag_initialize=SFunction_in1[1];
  Real MO_floatw_gearbox_input_radps=SFunction_in1[2];
  Real MO_floatw_gearbox_output_radps=SFunction_in1[3];
  Real MO_floatw_synchoro_dif_radps[11]={SFunction_in1[4],SFunction_in1[5],
      SFunction_in1[6],SFunction_in1[7],SFunction_in1[8],SFunction_in1[9],
      SFunction_in1[10],SFunction_in1[11],SFunction_in1[12],SFunction_in1[13],
      SFunction_in1[14]};
  Real MO_floatt_trans_fluid_k=SFunction_in1[15];
  Real MO_floatt_engine_water_k=SFunction_in1[16];
  Real MO_floataccel_position_per=SFunction_in1[17];
  Real MO_sshortrans_shifter_position=SFunction_in1[18];
  Real MO_floatv_vehicle_mps=SFunction_in1[19];
  Real MO_floattau_brake=SFunction_in1[20];
  Real MO_floatw_engine_radps=SFunction_in1[21];
  Real MO_floatw_engine_idle_radps=SFunction_in1[22];
  Real MO_floattau_engine_target=SFunction_in1[23];
  Real MO_floattau_engine=SFunction_in1[24];
  Real MO_floattau_engine_min_pos=SFunction_in1[25];
  Real MO_floattau_engine_max_pos=SFunction_in1[26];
  Real y(start=0, fixed=true);
equation
  when {sampleTrigger,initial()} then
    (MO_tau_clutch_cap,MO_f_synchro_n,MO_p_line_pa,MO_i_actuator_ampere,
      MO_i_eop_ampere,MO_qv_cooler_trans_fluid_m3ps,MO_qv_cooler_eng_water_m3ps,
      MO_tau_engine_max_req,MO_tau_engine_min_req,MO_w_engine_target_radps,
      MO_tau_trans_input,MO_trans_gear_ratio,MO_flag_trans_lock_up) =
      TCU_Main_AT_DCT(
      MO_flag_initialize,
      MO_floatw_gearbox_input_radps,
      MO_floatw_gearbox_output_radps,
      MO_floatw_synchoro_dif_radps,
      MO_floatt_trans_fluid_k,
      MO_floatt_engine_water_k,
      MO_floataccel_position_per,
      MO_sshortrans_shifter_position,
      MO_floatv_vehicle_mps,
      MO_floattau_brake,
      MO_floatw_engine_radps,
      MO_floatw_engine_idle_radps,
      MO_floattau_engine_target,
      MO_floattau_engine,
      MO_floattau_engine_min_pos,
      MO_floattau_engine_max_pos);
    Sfunction_Out1[1] = MO_tau_clutch_cap[1];
    Sfunction_Out1[2] = MO_tau_clutch_cap[2];
    Sfunction_Out1[3] = MO_tau_clutch_cap[3];
    Sfunction_Out1[4] = MO_tau_clutch_cap[4];
    Sfunction_Out1[5] = MO_tau_clutch_cap[5];
    Sfunction_Out1[6] = MO_tau_clutch_cap[6];
    Sfunction_Out1[7] = MO_tau_clutch_cap[7];
    Sfunction_Out1[8] = MO_tau_clutch_cap[8];
    Sfunction_Out1[9] = MO_tau_clutch_cap[9];
    Sfunction_Out1[10] = MO_tau_clutch_cap[10];
    Sfunction_Out1[11] = MO_tau_clutch_cap[11];
    Sfunction_Out1[12] = MO_tau_clutch_cap[12];
    Sfunction_Out1[13] = MO_f_synchro_n[1];
    Sfunction_Out1[14] = MO_f_synchro_n[2];
    Sfunction_Out1[15] = MO_f_synchro_n[3];
    Sfunction_Out1[16] = MO_f_synchro_n[4];
    Sfunction_Out1[17] = MO_f_synchro_n[5];
    Sfunction_Out1[18] = MO_f_synchro_n[6];
    Sfunction_Out1[19] = MO_f_synchro_n[7];
    Sfunction_Out1[20] = MO_f_synchro_n[8];
    Sfunction_Out1[21] = MO_f_synchro_n[9];
    Sfunction_Out1[22] = MO_f_synchro_n[10];
    Sfunction_Out1[23] = MO_f_synchro_n[11];
    Sfunction_Out1[24] = MO_p_line_pa;
    Sfunction_Out1[25] = MO_i_actuator_ampere;
    Sfunction_Out1[26] = MO_i_eop_ampere;
    Sfunction_Out1[27] = MO_qv_cooler_trans_fluid_m3ps;
    Sfunction_Out1[28] = MO_qv_cooler_eng_water_m3ps;
    Sfunction_Out1[29] = MO_tau_engine_max_req;
    Sfunction_Out1[30] = MO_tau_engine_min_req;
    Sfunction_Out1[31] = MO_w_engine_target_radps;
    Sfunction_Out1[32] = MO_tau_trans_input;
    Sfunction_Out1[33] = MO_trans_gear_ratio;
    Sfunction_Out1[34] = MO_flag_trans_lock_up;
    y = pre(y) + 1;
  end when;
  annotation (Icon(graphics={
        Polygon(
          lineColor={0,170,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Sphere,
          points={{-60,100},{60,100},{100,62},{100,-60},{60,-98},{-60,-100},{-100,
              -58},{-100,60},{-100,60},{-60,100}}),
        Text(
          origin={34,-44},
          extent={{-98,58},{32,-8}},
          textString="Main"),
        Text(
          origin={-4,26},
          extent={{-82,24},{82,-24}},
          textString="TCU")}, coordinateSystem(initialScale=0.1)));
end TCU_Main_Execution;
