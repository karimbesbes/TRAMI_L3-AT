// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
// ======                                                                 ======
// ====           TRAMI トランスミッション汎用制御仕様  Ver.2.30            ====
// ====                                                                     ====
// ====                                                                     ====
// ====  改暦情報                                                           ====
// ====     Version 2.30B       Release 2021/02/28                           ====
// ====                                                                     ====
// ======                                                                 ======
// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
typedef signed char       schar;
typedef unsigned char     uchar;
typedef signed short      sshort;
#define TRUE        1               //論理的「真」定義
#define FALSE       0               //論理的「偽」定義
#define _LoopTime   10.0f           //制御周期
#define _MaxGr      12              //最大ギヤ段数 (Neutral,Rev含む)
#define _MaxCL      _MaxGr          //最大クラッチ数(Rev含むギヤ段数+LUPクラッチ)
#define _MaxSyn     (_MaxGr - 1)    //最大シンクロ数
#define _GrRev      11              //ReverseGearの配列番号
#define _GrNP       0               //Neutralの配列番号
#define _Shift_Up   1
#define _Shift_CD   2
#define _Shift_TD   3
#define _Shift_ND   4
#define _Shift_NR   5
#define _PI  3.141592

#include "TRAMI_Standare_AT_StrategyData_v230_L3_9AT_d01.c"
//---------------------------
// GLOBAL VALIABLES
//---------------------------
    // Main
    float   r_starting_device_input     ;// Starting device input speed     [rpm]
    float   r_gearbox_input             ;// Gearbox input speed             [rpm]
    float   r_gearbox_output            ;// Gearbox output speed            [rpm]
    float   r_synchoro_dif [_MaxSyn]    ;// 各シンクロ差回転                [rpm]
    float   temp_trans_fluid            ;// トランスミッション油温          ['C]
    float   temp_engine_water           ;// Eng.冷却水温                    ['C]
    float   v_vehicle                   ;// 車速                            [km/h]
    float   tq_brake                    ;// ブレーキトルク                  [Nm]
    float   accel_position              ;// アクセル開度                    [%]
    sshort  shifter_position            ;// シフター位置 (Rev=-1; N=0 ; D=1)[  ]
    float   r_engine                    ;// Engine回転                      [rpm]
    float   r_engine_idle               ;// Engineアイドル回転              [rpm]
    float   tq_engine_target            ;// Engine目標トルク                [Nm]
    float   tq_engine                   ;// Engineトルク                    [Nm]
    float   tq_engine_min_pos           ;// Eng.出力可能最小トルク          [Nm]
    float   tq_engine_max_pos           ;// Eng.出力可能最小トルク          [Nm]
    float   tq_p2m_req                  ;// P2M要求トルク                   [Nm]
    schar   flag_k0cl_open_req          ;// Disconnect clutch 開放要求
    float   r_p2m                       ;// P2 Motor回転                    [rpm]
    float   f_synchro_old[_MaxSyn]      ;// シンクロの操作力(前回値)        [N]
    //----- Previous value
    float   gear_ratio_old              ;// [  ]
    schar   flag_shift_old              ;// [  ]
    schar   flag_shift_end_speed_old    ;// [  ]
    schar   flag_ap_load_shift_old      ;// [  ]
    schar   flag_tq_load_shift_old      ;// [  ]
    sshort  gear_shift_map_old          ;// [  ]
    sshort  gear_target_old             ;// [  ]
    sshort  gear_before_shift_old       ;// [  ]
    sshort  gear_sub1_tmp_old           ;// [  ]
    sshort  gear_sub2_tmp_old           ;// [  ]
    float   t_shift_wait_old            ;// [ms]
    float   t_shift_period_old          ;// [ms]
    float   t_shift_interval_old        ;// [ms]
    float   t_tq_phase_old              ;// [ms]
    float   t_shift_end_old             ;// [ms]
    float   t_neutral_old               ;// [ms]
    schar   flag_cvt_step_shift_old     ;// [  ]
    schar   flag_cvt_step_shift_ap_old  ;// [  ]

    //TCU_Engin_Idle_Control
    schar   flag_engine_idle_control    ;// [  ]

    //TCU_Creep_Control
    float   tq_cl_creep_cont            ;// [Nm]

    //TCU_Fluid_Coupling_Torque
    float   tq_torq_converter_input     ;// [Nm]
    float   tq_torq_converter_output    ;// [Nm]
    float   spd_ratio_torq_converter    ;// [  ]
    float   torq_ratio_torq_converter   ;// [  ]
    float   cap_factor_torq_converter   ;// [uNm/rpm2]

    //TCU_Slip_Control
    float   tq_cl_slip_control          ;// [Nm]
    float   r_cl_slip_target            ;// [rpm]
    float   r_cl_slip_act               ;// [rpm]
    float   r_starting_device_target    ;// [rpm]
    float   tq_torq_converter_slip_tg   ;// [Nm]
    float   tq_cl_slip_base             ;// [Nm]
    float   tq_cl_slip_correct          ;// [Nm]
    float   tq_flyweel_output           ;// [Nm]

    //TCU_Torque_Input_GearBox
    float   tq_gearbox_input            ;// [Nm]

    //TCU_Load_shift
    schar   flag_load_shift             ;// [  ]
    schar   flag_ap_load_shift          ;// [  ]
    schar   flag_tq_load_shift          ;// [  ]

    //TCU_CVT_Step_Shift
    schar   flag_cvt_step_shift         ;// [  ]
    schar   flag_cvt_step_shift_ap      ;// [  ]

    //TCU_Continuously_shift_schedule
    float   virtual_gear_cvt_map        ;// [  ]

    //TCU_Shift_Schedule
    sshort  gear_shift_map              ;// [  ]

    //TCU_Shift_End_Jugdement
    schar   flag_shift_end_judge        ;// [  ]
    schar   flag_shift_end_speed        ;// [  ]
    float   t_shift_end                 ;// [ms]

    //TCU_Gear_Target
    sshort  gear_target                 ;// [  ]
    sshort  gear_before_shift           ;// [  ]
    float   virtual_gear_target         ;// [  ]
    float   virtual_gear_before_shift   ;
    float   t_shift_wait                ;// [ms]
    float   t_shift_period              ;// [ms]
    float   t_shift_interval                ;// [ms]
    schar   flag_shift                  ;// [  ]
    float   r_gb_input_tg_gear          ;// [rpm]

    //TCU_Gear_Shift_Type
    sshort  gear_shift_kind             ;// [  ]

    //TCU_Target_Gear_Ratio
    float   gear_ratio                  ;// [  ]
    float   gear_ratio_before_shift     ;// [  ]
    float   gear_ratio_after_shift      ;// [  ]

    //TCU_Sub_Gear
    sshort  gear_sub                    ;// [  ]
    sshort  gear_sub1                   ;// [  ]
    sshort  gear_sub2                   ;// [  ]
    float   t_neutral                   ;// [ms]
    sshort  gear_sub1_tmp               ;// [  ]
    sshort  gear_sub2_tmp               ;// [  ]

    //TCU_SYNCHORO_STATUS
    schar   flag_synchro_ready          ;// [  ]

    //TCU_Gear_Clutch_Control
    sshort  gear_cl_com                 ;// [  ]

    //TCU_Shift_Clutch
    sshort  n_engage_clutch             ;// [  ]
    sshort  n_release_clutch            ;// [  ]

    //TCU_Shift_Inertia_Torq
    float   tq_inertia_engage_cl        ;// [Nm]
    float   tq_inertia_release_cl       ;// [Nm]
    float   tq_shift_up_reduction_req   ;// [Nm]
    float   tq_shift_up_reduction       ;// [Nm]
    float   tq_eng_shift_up_reduction   ;// [Nm]
    float   tq_p2m_shift_up_reduction   ;// [Nm]
    float   t_shift_time_tg             ;// [ms]
    float   r_delta_speed               ;// [rpm
    float   tq_inertia                  ;// [Nm]

    //TCU_Torque_Phase
    float   rate_torque_phase           ;// [  ]
    float   t_tq_phase                  ;// [ms]

    //TCU_Clutch_Control
    float   tq_clutch_cap_inp   [_MaxCL];// [Nm]
    float   tq_engage_cl_cap            ;// [Nm]
    float   tq_release_cl_cap           ;// [Nm]

    //TCU_Clutch_Torque_Capacity
    float   tq_clutch_cap       [_MaxCL];// [Nm]
    float   rate_clutch_share   [_MaxCL];// [  ]

    //TCU_SYNCHORO_CONTROL
    float   f_synchro           [_MaxSyn];// [N]
    schar   flag_synchro_com    [_MaxSyn];// [  ]

    //TCU_Trans_Fluid_Characteristic
    float   viscosity_trans_fluid       ;// [m2/s]
    float   density_trans_fluid         ;// [kg/m3]

    //TCU_Pressure_Line_Control
    float   p_line                      ;// [kPa]

    //TCU_Pressure_CVT_Pulley
    float   p_pulley_primary            ;// [kPa]
    float   p_pulley_secoundary         ;// [kPa]
    float   p_pulley_sec_base           ;// [kPa]
    float   factor_safety_pulley_sec    ;// [  ]
    float   p_pulley_sec_min            ;// [kPa]
    float   radius_pulley_pri           ;// [m]
    float   radius_pulley_sec           ;// [m]
    float   radius_pullye_sec_od        ;// [m]
    float   stroke_pulley_sec           ;// [m]
    float   f_spg_pulley_sec            ;// [N]
    float   f_centrifugal_pr_sec        ;// [N]
    float   f_clamp_pully_sec           ;// [N]
    float   ratio_variator_cap          ;// [ ]
    float   ratio_pulley_clamp          ;// [ ]
    float   f_clamp_pully_pri           ;// [N]
    float   f_centrifugal_pr_pri        ;// [N]

    //TCU_Acutuator_Control
    float   i_actuator                  ;// [A]

    //TCU_EOP_Control
    float   i_eop                       ;// [A]

    //TCU_Cooler_Flow_Rate_Control
    float   q_cooler_trans_fluid        ;// [L/min]
    float   q_cooler_engine_water       ;// [L/min]

    //TCU_Up_Shift_Torque_Reduction
    schar   flag_shift_up_tq_request    ;// [  ]

    //TCU_Engine_Torque_Request
    float   tq_engine_max_req           ;// [Nm]
    float   tq_engine_min_req           ;// [Nm]
    float   r_engine_target             ;// [rpm]

    //TCU_Information_For_ECU
    float   tq_trans_input              ;// [Nm]
    float   tq_gain_drivetrain          ;// [ ]
    schar   flag_lockup                 ;// [  ]

    //TCU_Disconnect_Clutch_Control
    float   tq_k0_clutch_cap            ;// [Nm]
    sshort  status_k0_clutch            ;// [  ]

    //TCU_P2_Motor_Control
    float   tq_p2m_target               ;// [Nm]

    //TCU_Torque_Input_Starting_Device
    float   tq_starting_device_input    ;// [Nm]

// =============================================================================
// ======                                                                 ======
// ====                     関数のプロトタイプ宣言                          ====
// ======                                                                 ======
// =============================================================================

extern void TCU_Main(
    //--------------  Output ------------------
    // Transmission plant
    float   *trans_gear                     ,   // 1.  目標ギヤ段
    float   *trans_gear_ratio               ,   // 2.  ギヤ比
    float   tau_clutch_cap  [_MaxCL]        ,   // 3.  各クラッチのトルク容量           [Nm]
    float   f_synchro_n     [_MaxSyn]       ,   // 4.  シンクロの操作力                 [N]
    float   *tau_k0_clutch_cap              ,   // 5.  Disconnect clutch トルク容量     [Nm]
    float   *tau_p2m_target                 ,   // 6.  (P2)Motore目標トルク             [Nm]
    float   *p_line_pa                      ,   // 7.  ライン圧                         [Pa]
    float   *p_pulley_pri_pa                ,   // 8.  CVTプライマリ圧                  [Pa]
    float   *p_pulley_sec_pa                ,   // 9.  CVTセカンダリ圧                  [Pa]
    float   *i_actuator_ampere              ,   // 10. アクチュエータ電流               [A]
    float   *i_eop_ampere                   ,   // 11. 電動オイルポンプ電流             [A]
    float   *qv_cooler_trans_fluid_m3ps     ,   // 12. クーラーのATF流量                [m3/s]
    float   *qv_cooler_eng_water_m3ps       ,   // 13. クーラーの冷却水流量             [m3/s]
    //  Driver Model
    float   *torque_gain_drivetrain         ,   // 14. ドライブトレインのトルク増幅率
    schar   *flag_trans_shift               ,   // 15. シフトフラグ
    // ECU
    float   *tau_engine_max_req             ,   // 16. エンジントルクリダクション要求       [Nm]
    float   *tau_engine_min_req             ,   // 17. エンジントルクアップ要求         [Nm]
    float   *w_engine_target_radps          ,   // 18. エンジン回転要求値               [rad/s]
    float   *tau_trans_input                ,   // 19. トランスミッション入力トルク     [Nm]
    schar   *flag_trans_lockup              ,   // 20. ロックアップ判定
    //--------------  Input ------------------
    schar   flag_initialize                 ,   // 0.  イニシャライズ要求
    // Transmission Plant
    float   w_starting_device_input_radps   ,   // 1.  Starting device input speed              [rad/s]
    float   w_gearbox_input_radps           ,   // 2.  Gearbox input speed              [rad/s]
    float   w_gearbox_output_radps          ,   // 3.  Gearbox output speed             [rad/s]
    float   w_synchoro_dif_radps[_MaxSyn]   ,   // 4.  各シンクロ差回転                 [rad/s]
    float   t_trans_fluid_k                 ,   // 5.  トランスミッション油温               [K]
    float   t_engine_water_k                ,   // 6.  Eng.冷却水温                     [K]
    // Vehicle Plant
    float   v_vehicle_mps                   ,   // 7.  車速                             [m/s]
    float   tau_brake                       ,   // 8.  ブレーキトルク                   [Nm]
    // Driver Model
    float   accel_position_per              ,   // 9.  アクセル開度                     [%]
    sshort  trans_shifter_position          ,   // 10.  シフター位置 (Rev=-1; N=0 ; D=1)
    // ECU
    float   w_engine_radps                  ,   // 11. Engine回転                       [rad/s]
    float   w_engine_idle_radps             ,   // 12. Engine目標アイドル回転           [rad/s]
    float   tau_engine_target               ,   // 13. Engine目標トルク                 [Nm]
    float   tau_engine                      ,   // 14. Engineトルク                     [Nm]
    float   tau_engine_min_pos              ,   // 15. Eng.出力可能最小トルク           [Nm]
    float   tau_engine_max_pos              ,   // 16. Eng.出力可能最小トルク           [Nm]
    // VCU
    float   tau_p2m_req                     ,   // 17. (P2)Motore要求トルク             [Nm]
    schar   flag_k0_clutch_open             ,   // 18. Disconnect clutch 開放要求(0=Open: 1=Close)
    sshort  drive_mode                      ,   // 19. ドライブモード(0=EV : 1= HEV : 2=Power mode)
    //--------------  observation-------------
    float   obs_tcu[10]                         // 内部状態量観測用
) ;

float      F_abs( float val  );
float      F_max( float val_1,float val_2  );
float      F_min( float val_1,float val_2  );
float      Table_search_2D( void *tbl, void *axis, float data, uchar num  );
float      Table_search_3D( void *map, float x_nrm, uchar xn, float y_nrm, uchar yn  );
float      Table_search_4D( void *map, float nrm_x, uchar xn, float nrm_y, uchar yn,  float nrm_z, uchar zn);
void       Switch_with_hys(schar *flag, schar flag_old, float val, float cal, float hys);
float      F_Pow ( float val , uchar n );
void    TCU_Engin_Idle_Control (
        //-----OUTPUT------
        schar   *flag_engine_idle_control,
        //----INPUT-------
        schar    flag_initialize,
        float   r_engine_idle,
        float   accel_position,
        float   v_vehicle,
        sshort  gear_target,
        float   r_gb_input_tg_gear
);
void    TCU_Creep_Control (
        //-----OUTPUT------
        float   *tq_cl_creep_cont,
        //----INPUT-------
        schar    flag_initialize,
        sshort  gear_target
);
void    TCU_Fluid_Coupling_Torque (
        //-----OUTPUT------
        float   *tq_torq_converter_input,
        float   *tq_torq_converter_output,
        float   *spd_ratio_torq_converter,
        float   *torq_ratio_torq_converter,
        float   *cap_factor_torq_converter,
        //----INPUT-------
        float   r_starting_device_input,
        float   r_gearbox_input
);
void    TCU_Slip_Control (
        //-----OUTPUT------
        float   *tq_cl_slip_control,        // スリップ制御クラッチのトルク容量                     
        float   *r_cl_slip_target,          // 目標スリップ量
        float   *r_cl_slip_act,             // 実スリップ量
        float   *r_starting_device_target,  // Startubg Device目標回転
        float   *tq_torq_converter_slip_tg, // 目標Slip時の流体伝達トルク
        float   *tq_cl_slip_base,
        float   *tq_cl_slip_correct,
        float   *tq_flyweel_output,
        //----INPUT-------
        schar    flag_initialize,
        schar   flag_shift,
        float   r_starting_device_input,
        float   r_gb_input_tg_gear,
        float   tq_starting_device_input,
        float   r_engine_idle,
        float   gear_ratio_after_shift,
        sshort  gear_target,
        sshort  gear_target_old,
        schar   flag_engine_idle_control,   // アイドル回転制御の実行判定フラグ
        schar   flag_k0cl_open_req
);
void    TCU_Torque_Input_GearBox(
        //-----OUTPUT------
        float   *tq_gearbox_input,
        //----INPUT-------
        float   tq_starting_device_input,
        float   torq_ratio_torq_converter
);
void     TCU_Load_shift(
        //===OUTPUT===
        schar   *flag_load_shift,
        schar   *flag_ap_load_shift,
        schar   *flag_tq_load_shift,
        //===INPUT====
        schar   flag_ap_load_shift_old,
        schar   flag_tq_load_shift_old,
        float   accel_position,
        float   tq_engine_target
);
void     TCU_CVT_Step_Shift (
        //===OUTPUT===
        schar   *flag_cvt_step_shift,    //CVTの疑似STEP変速
        schar   *flag_cvt_step_shift_ap, //CVTの疑似STEP変速アクセル開度
        //===INPUT====
        float   accel_position,
        schar   flag_cvt_step_shift_old,
        schar   flag_cvt_step_shift_ap_old,
        schar   flag_shift
);
void     TCU_Shift_Schedule(
        //===OUTPUT===
        sshort  *gear_shift_map,
        //===INPUT====
        sshort  gear_shift_map_old,
        sshort  shifter_position,
        float   accel_position,
        float   v_vehicle,
        schar   flag_cvt_step_shift,
        schar   flag_k0cl_open_req
);
void     TCU_Continuously_shift_schedule (
        //===OUTPUT===
        float   *virtual_gear_cvt_map,  //シフトマップから算出されるギヤ段
        //===INPUT====
        sshort  shifter_position,
        float   accel_position,
        float   v_vehicle
);

void     TCU_Shift_End_Jugdement (
        //===OUTPUT===
        schar   *flag_shift_end_judge,
        schar   *flag_shift_end_speed,
        float   *t_shift_end,
        //===INPUT====
        schar   flag_shift_end_speed_old,
        float   t_shift_end_old,
        float   r_gearbox_input,
        float   r_gb_input_tg_gear,
        float   rate_torque_phase,
        sshort  gear_shift_kind,
        float   t_shift_period
);
void     TCU_Gear_Target(
        //===OUTPUT===
        sshort  *gear_target,               //目標ギヤ段
        sshort  *gear_before_shift,         //変速前ギヤ段
        float   *virtual_gear_target,       //目標仮想ギヤ段
        float   *virtual_gear_before_shift, //目標仮想ギヤ段
        float   *t_shift_wait,
        float   *t_shift_period,
        float   *t_shift_interval,
        schar   *flag_shift,
        //===INPUT====
        schar    flag_initialize,
        sshort  gear_before_shift_old,
        float   t_shift_wait_old,
        float   t_shift_period_old,
        float   t_shift_interval_old,
        schar   flag_shift_old,
        sshort  gear_shift_map,
        sshort  gear_shift_map_old,
        schar   flag_load_shift,
        sshort  shifter_position,
        schar   flag_shift_end_judge,
        schar   flag_cvt_step_shift,
        schar   flag_cvt_step_shift_old,
        float   virtual_gear_cvt_map
);
void    TCU_Gear_Shift_Type (
        //===OUTPUT===
        sshort  *gear_shift_kind,
        //===INPUT====
        schar   flag_load_shift,
        schar   flag_shift,
        sshort  gear_target,
        sshort  gear_before_shift
);
void     TCU_Target_Gear_Ratio (
        //===OUTPUT===
        float   *gear_ratio         ,       //目標ギヤレシオ
        float   *gear_ratio_befire_shift,   //変速前のギヤレシオ
        float   *gear_ratio_after_shift,    //変速後のギヤレシオ
        float   *r_gb_input_tg_gear,        //目標ギヤ段でのGearBox入力回転（GearBox出力回転から演算)
        //===INPUT====
        float   gear_ratio_old,
        sshort  gear_target,
        sshort  gear_before_shift,
        float   virtual_gear_cvt_map
);
void     TCU_Sub_Gear(
        //===OUTPUT===
        sshort  *gear_sub,
        sshort  *gear_sub1,
        sshort  *gear_sub2,
        float   *t_neutral,
        sshort  *gear_sub1_tmp,
        sshort  *gear_sub2_tmp,
        //===INPUT====
        sshort  gear_sub1_tmp_old,
        sshort  gear_sub2_tmp_old,
        float   t_neutral_old,
        float   accel_position,
        float   v_vehicle,
        sshort  gear_target,
        sshort  gear_target_old,
        sshort  gear_before_shift,
        sshort  shifter_position,
        schar   flag_shift
);
void     TCU_SYNCHORO_STATUS (
        //---OUTPUT---
        schar   *flag_synchro_ready,
        //---INPUT---
        sshort  gear_target,
        float   f_synchro      [_MaxSyn],
        float   r_synchoro_dif [_MaxSyn]
);
void     TCU_Gear_Clutch_Control(
        //===OUTPUT===
        sshort  *gear_cl_com,
        //===INPUT====
        schar    flag_initialize,
        schar   flag_synchro_ready,
        sshort  gear_target,
        sshort  gear_before_shift,
        sshort  gear_shift_kind,
        float   r_gearbox_input,
        float   r_gb_input_tg_gear
);
void     TCU_Shift_Clutch (
    //-----OUTPUT------
        sshort  *n_engage_clutch,
        sshort  *n_release_clutch,
        //----INPUT-------
        sshort  gear_target,
        sshort  gear_before_shift
);
void    TCU_Shift_Inertia_Torq (
        //-----OUTPUT------
        float *tq_inertia_engage_cl,        // 締結クラッチのイナーシャトルク
        float *tq_inertia_release_cl,       // 解放クラッチのイナーシャトルク
        float *tq_shift_up_reduction_req,   // アップシフト時のトルクリダクション量要求値
        float *tq_shift_up_reduction,       // アップシフト時のトルクリダクション量実行値
        float *tq_eng_shift_up_reduction,   // アップシフト時のエンジントルクリダクション量
        float *tq_p2m_shift_up_reduction,   // アップシフト時のP2Mトルクリダクション量
        float *t_shift_time_tg,             // 目標変速時間
        float *r_delta_speed,               // 変速前後差回転
        float *tq_inertia,                  // イナーシャトルク
        //----INPUT-------
        schar    flag_initialize,
        sshort  gear_shift_kind,
        sshort  gear_target,
        sshort  gear_target_old,
        sshort  gear_before_shift,
        float   r_p2m,
        float   r_gearbox_input,
        float   r_gb_input_tg_gear,
        float   tq_engine_target,
        float   tq_engine_min_pos,
        schar   flag_k0cl_open_req,
        float   tq_p2m_req
);
void     TCU_Torque_Phase (
        //----- output ---------
        float   *rate_torque_phase,
        float   *t_tq_phase,
        //----- input ---------
        float   t_tq_phase_old,
        schar   flag_shift,
        sshort  gear_shift_kind,
        sshort  gear_cl_com,
        sshort  gear_target
);
void     TCU_Clutch_Control (
        //----- output ---------
        float   tq_clutch_cap_inp[_MaxCL],
        float   *tq_engage_cl_cap,
        float   *tq_release_cl_cap,
        //----- input ---------
        float   tq_gearbox_input,
        float   tq_cl_slip_control,
        float   tq_inertia_engage_cl,
        float   tq_inertia_release_cl,
        float   rate_torque_phase,
        schar   flag_shift,
        sshort  n_engage_clutch,
        sshort  n_release_clutch,
        sshort  gear_cl_com,
        sshort  gear_target,
        schar   flag_engine_idle_control,
        float   tq_cl_creep_cont
);
void     TCU_Clutch_Torque_Capacity (
        //----- output ---------
        float   *tq_clutch_cap,
        float   *rate_clutch_share,
        //-------------------------------
        sshort  gear_target,
        sshort  gear_before_shift,
        float   tq_clutch_cap_inp[]
);
void     TCU_SYNCHORO_CONTROL (
        //---OUTPUT---
        float   f_synchro     [_MaxSyn],
        schar   flag_synchro_com [_MaxSyn],
        //---INPUT---
        float   f_synchro_old [_MaxSyn],
        sshort  gear_target,
        sshort  gear_before_shift,
        sshort  gear_sub1,
        sshort  gear_sub2
);
void     TCU_Pressure_CVT_Pulley (
        //---OUTPUT---
        float   *p_pulley_primary,
        float   *p_pulley_secoundary,
        //---INPUT---
        float   tq_gearbox_input,
        float   r_gearbox_input,
        float   r_gearbox_output,
        float   gear_ratio,
        float   gear_ratio_after_shift,
        float   viscosity_trans_fluid,
        float   density_trans_fluid
);
void     TCU_Trans_Fluid_Characteristic (
        //---OUTPUT---
        float   *viscosity_trans_fluid,             // 動粘度 [m2/s]
        float   *density_trans_fluid,               // 密度   [kg/m3]
        //---INPUT---
        float   temp_trans_fluid
);
void     TCU_Pressure_Line_Control (
        //---OUTPUT---
        float   *p_line,
        //---INPUT---
        float   tq_gearbox_input,
        sshort  gear_target,
        float   p_pulley_primary,
        float   p_pulley_secoundary
);
void     TCU_Acutuator_Control (
        //---OUTPUT---
        float   *i_actuator,
        //---INPUT---
        sshort  gear_target
);
void     TCU_EOP_Control (
        //---OUTPUT---
        float   *i_eop,
        //---INPUT---
        float   r_engine,
        float   temp_trans_fluid
);
void     TCU_Cooler_Flow_Rate_Control (
        //---OUTPUT---
        float   *q_cooler_trans_fluid,
        float   *q_cooler_engine_water,
        //---INPUT---
        float   temp_trans_fluid
);
void     TCU_Up_Shift_Torque_Reduction (
        //---OUTPUT---
        schar   *flag_shift_up_tq_request,
        //---INPUT---
        float    tq_eng_shift_up_reduction,
        sshort  gear_shift_kind,
        sshort  gear_target,
        sshort  gear_before_shift,
        schar   flag_shift,
        float   rate_torque_phase,
        float   r_gb_input_tg_gear,
        float   r_gearbox_input,
        float   tq_engine_min_pos,
        float   tq_inertia_engage_cl
);
void     TCU_Engine_Torque_Request (
        //---OUTPUT---
        float   *tq_engine_max_req,         //エンジントルク最大値要求
        float   *tq_engine_min_req,         //エンジントルク最小値要求
        float   *r_engine_target,           //エンジン回転要求
        //---INPUT---
        float   tq_engine_target,
        float   tq_eng_shift_up_reduction,
        schar   flag_shift_up_tq_request,
        schar   flag_k0cl_open_req
);
void     TCU_Information_For_ECU (
        //---OUTPUT---
        float   *tq_trans_input             ,   // トランスミッション入力軸トルク   [Nm]
        float   *tq_gain_drivetrain         ,   // ドライブトレインのトルク増幅率
        schar   *flag_lockup                ,   // ロックアップ判定
        //---INPUT---
        sshort  gear_target,
        schar   flag_engine_idle_control,
        float   tq_torq_converter_input,
        float   tq_cl_creep_cont,
        float   tq_cl_slip_base,
        float   gear_ratio,
        float   torq_ratio_torq_converter
);
void     TCU_Disconnect_Clutch_Control(
        //---OUTPUT---
        float   *tq_k0_clutch_cap,      // Disconnect clutch(K0) トルク容量
        sshort  *status_k0_clutch,      // Disconnect clutch(K0) 締結状態 0=開放 1=Slip 2=CLose
        //---INPUT---
        schar   flag_k0cl_open_req, // Disconnect clutch(K0) 開放要求
        float   r_engine,               // エンジン回転
        float   r_starting_device_input,// Starting Device 入力回転
        float   tq_engine_target,       // 目標エンジントルク
        schar    flag_initialize

);
void     TCU_P2_Motor_Control(
        //---OUTPUT---
        float   *tq_p2m_target,         // P2 Motor目標トルク
        //---INPUT---
        sshort  status_k0_clutch,
        schar   flag_shift_up_tq_request,
        float   tq_starting_device_input,
        float   tq_p2m_req,
        float   r_engine,
        float   tq_p2m_shift_up_reduction
);
void    TCU_Torque_Input_Starting_Device(
        //-----OUTPUT------
        float   *tq_starting_device_input,      // 発進デバイス入力トルク
        //----INPUT-------
        float   tq_engine_target,
        float   tq_p2m_target
);

// =============================================================================
// =============================================================================
// ======                                                                 ======
// ====                              汎用関数                               ====
// ======                                                                 ======
// =============================================================================
// =============================================================================
float      F_abs( float val ){
    //----------------------------------------------------------------------
    // 絶対値
    //----------------------------------------------------------------------
    float ans;
    if( val > 0.0 ) { ans =  val; }
    else            { ans = -val; }
    return(ans);
}
// =============================================================================
float      F_max(float val_1,float val_2){
    //----------------------------------------------------------------------
    // MAX値
    //----------------------------------------------------------------------
    float ans;
    if( val_1 >= val_2 ) { ans = val_1; }
    else                 { ans = val_2; }
    return(ans);
}
// =============================================================================
float      F_min(float val_1,float val_2){
    //----------------------------------------------------------------------
    // MIN値
    //----------------------------------------------------------------------
    float ans;
    if( val_1 <= val_2 ) { ans = val_1; }
    else                 { ans = val_2; }
    return(ans);
}

// =============================================================================
float      Table_search_2D( void *tbl, void *axis, float data, uchar num ){
    //----------------------------------------------------------------------
    // 2D Table Search
    //----------------------------------------------------------------------
    uchar   data_int  ;
    uchar   i     ;
    float   xdata ;
    float   flt   ;
    float   ans   ;

    if (  data < *(float*)axis  )        {  data = *(float*)axis         ;}
    if (  *((float*)axis+num-1) < data  ){  data = *((float*)axis+num-1) ;}

    for(  i=1  ; ( i < num-1 ) && ( *((float*)axis+i) <= data )  ;  i++ );

    if ( *((float*)axis+i) - *((float*)axis+i-1) ==0 ) {
        xdata = (float)i - 1.0f;
    }
    else {
        xdata = ( data - *((float*)axis+i-1) )
                  / ( *((float*)axis+i) - *((float*)axis+i-1) ) + (float)i - 1.0f;
    }
    data_int = ( uchar ) xdata ;
    flt = xdata - ( float ) data_int ;
    if(data_int >= num-1){ ans = *((float*)tbl+num-1);}
    else{
        ans = flt * ( *((float*)tbl+data_int+1) - *((float*)tbl+data_int)) + *((float*)tbl+data_int);
    }
    return ans;
}

// =============================================================================
float      Table_search_3D( void *map, float nrm_x, uchar xn, float nrm_y, uchar yn ){
    //----------------------------------------------------------------------
    // 3D Table Search
    //----------------------------------------------------------------------
    uchar   int_x ;
    uchar   int_y ;
    uchar   offset1 ;
    uchar   offset2 ;
    float   flt_x  ;
    float   flt_y  ;
    float   x1    ;
    float   x2    ;
    float   ans   ;

    //  引数異常時の処置 (外挿はしない)
    nrm_x = F_max(  0.0, F_min( nrm_x,(float)(xn-1) )  );
    nrm_y = F_max(  0.0, F_min( nrm_y,(float)(yn-1) )  );
    //-----------------------------------------
    int_x = ( uchar ) nrm_x ;
    int_y = ( uchar ) nrm_y ;
    flt_x = nrm_x - ( float ) int_x ;
    flt_y = nrm_y - ( float ) int_y ;
    offset1 = xn * int_y;
    offset2 = xn *(int_y+1);
    //-----------------------------------------
    if( flt_x == 0.0 ){
        x1 = *( (float*)map + offset1+int_x );
    }
    else{
        x1 = flt_x * ( *((float*)map + offset1 + int_x + 1 ) - *( (float*)map + offset1 + int_x ) )
              + *( (float*)map + offset1 + int_x);
    }
    //-----------------------------------------
    if( flt_y ==0.0 ){
        x2 = x1;
    }
    else {
        if( flt_x == 0.0 ){
            x2 = *( (float*)map + offset2 + int_x );
        }
        else {
            x2 = flt_x * ( *((float*)map + offset2 + int_x + 1 ) - *( (float*)map + offset2 + int_x ) )
                + *((float*)map+offset2+int_x);
        }

    }
    //-----------------------------------------
    ans = flt_y * ( x2 - x1 ) + x1;
    return ans;
}

// =============================================================================
float      Table_search_4D( void *map, float nrm_x, uchar xn, float nrm_y, uchar yn,  float nrm_z, uchar zn){
    //----------------------------------------------------------------------
    // 4D Table Search
    //----------------------------------------------------------------------
    uchar   i_z1 ;
    uchar   i_z2 ;
    float   z1   ;
    float   z2   ;
    uchar   int_z ;
    float   flt_z  ;
    float   ans  ;
    //  引数異常時の処置 (外挿はしない)
    nrm_z = F_max(  0.0, F_min( nrm_z,(float)(zn-1) )  );
    //-----------------------------------------
    i_z1 = (uchar)nrm_z ;
    i_z2 = (uchar)nrm_z + 1 ;
    z1 = Table_search_3D( (float*)map + (xn * yn * i_z1), nrm_x, xn, nrm_y, yn );
    z2 = Table_search_3D( (float*)map + (xn * yn * i_z2), nrm_x, xn, nrm_y, yn );
    int_z = ( uchar ) nrm_z ;
    flt_z = nrm_z - ( float ) int_z ;
    ans = flt_z * ( z2 - z1 ) + z1;
    return ans;
}

// =============================================================================
void       Switch_with_hys(schar *flag, schar flag_old, float val, float cal, float hys){
   //----------------------------------------------------------------------
    // ヒス付きソフトスイッチ
    //----------------------------------------------------------------------
    if     ( val>=cal)     { *flag=TRUE; }
    else if( val< cal-hys) { *flag=FALSE;}
    else                   { *flag=flag_old;}
}
// =============================================================================
float      F_Pow ( float val , uchar n ){
   //----------------------------------------------------------------------
    // べき乗（nは整数に限る）
    //----------------------------------------------------------------------
    sshort   i;
    float ans;
    ans = val;
    for( i = 0 ; i < n-1 ; i++ ){
        ans = ans * val ;
    }
    return ans;
}

// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
// ======                                                                 ======
// ====                         Transmission制御                            ====
// ======                                                                 ======
// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
void     TCU_Main(
    //--------------  Output ------------------
    // Transmission plant
    float   *trans_gear                     ,   // 1.  目標ギヤ段
    float   *trans_gear_ratio               ,   // 2.  ギヤ比
    float   tau_clutch_cap  [_MaxCL]        ,   // 3.  各クラッチのトルク容量           [Nm]
    float   f_synchro_n     [_MaxSyn]       ,   // 4.  シンクロの操作力                 [N]
    float   *tau_k0_clutch_cap              ,   // 5.  Disconnect clutch トルク容量     [Nm]
    float   *tau_p2m_target                 ,   // 6.  (P2)Motore目標トルク             [Nm]
    float   *p_line_pa                      ,   // 7.  ライン圧                         [Pa]
    float   *p_pulley_pri_pa                ,   // 8.  CVTプライマリ圧                  [Pa]
    float   *p_pulley_sec_pa                ,   // 9.  CVTセカンダリ圧                  [Pa]
    float   *i_actuator_ampere              ,   // 10. アクチュエータ電流               [A]
    float   *i_eop_ampere                   ,   // 11. 電動オイルポンプ電流             [A]
    float   *qv_cooler_trans_fluid_m3ps     ,   // 12. クーラーのATF流量                [m3/s]
    float   *qv_cooler_eng_water_m3ps       ,   // 13. クーラーの冷却水流量             [m3/s]
    //  Driver Model
    float   *torque_gain_drivetrain         ,   // 14. ドライブトレインのトルク増幅率
    schar   *flag_trans_shift               ,   // 15. シフトフラグ
    // ECU
    float   *tau_engine_max_req             ,   // 16. エンジントルクリダクション要求       [Nm]
    float   *tau_engine_min_req             ,   // 17. エンジントルクアップ要求         [Nm]
    float   *w_engine_target_radps          ,   // 18. エンジン回転要求値               [rad/s]
    float   *tau_trans_input                ,   // 19. トランスミッション入力トルク     [Nm]
    schar   *flag_trans_lockup              ,   // 20. ロックアップ判定
    //--------------  Input ------------------
    schar   flag_initialize                 ,   // 0.  イニシャライズ要求
    // Transmission Plant
    float   w_starting_device_input_radps   ,   // 1.  Starting device input speed              [rad/s]
    float   w_gearbox_input_radps           ,   // 2.  Gearbox input speed              [rad/s]
    float   w_gearbox_output_radps          ,   // 3.  Gearbox output speed             [rad/s]
    float   w_synchoro_dif_radps[_MaxSyn]   ,   // 4.  各シンクロ差回転                 [rad/s]
    float   t_trans_fluid_k                 ,   // 5.  トランスミッション油温               [K]
    float   t_engine_water_k                ,   // 6.  Eng.冷却水温                     [K]
    // Vehicle Plant
    float   v_vehicle_mps                   ,   // 7.  車速                             [m/s]
    float   tau_brake                       ,   // 8.  ブレーキトルク                   [Nm]
    // Driver Model
    float   accel_position_per              ,   // 9.  アクセル開度                     [%]
    sshort  trans_shifter_position          ,   // 10.  シフター位置 (Rev=-1; N=0 ; D=1)
    // ECU
    float   w_engine_radps                  ,   // 11. Engine回転                       [rad/s]
    float   w_engine_idle_radps             ,   // 12. Engine目標アイドル回転           [rad/s]
    float   tau_engine_target               ,   // 13. Engine目標トルク                 [Nm]
    float   tau_engine                      ,   // 14. Engineトルク                     [Nm]
    float   tau_engine_min_pos              ,   // 15. Eng.出力可能最小トルク           [Nm]
    float   tau_engine_max_pos              ,   // 16. Eng.出力可能最小トルク           [Nm]
    // VCU
    float   tau_p2m_req                     ,   // 17. (P2)Motore要求トルク             [Nm]
    schar   flag_k0_clutch_open             ,   // 18. Disconnect clutch 開放要求(0=Open: 1=Close)
    sshort  drive_mode                      ,   // 19. ドライブモード(0=EV : 1= HEV : 2=Power mode)
    //--------------  observation-------------
    float   obs_tcu[10]                         // 内部状態量観測用
) {
    sshort  i;

    //----------------------------------------------------------------
    // Initialize
    //----------------------------------------------------------------
    // Main
    if( flag_initialize ){
        r_starting_device_input             = 0.0 ;
        r_gearbox_input                     = 0.0 ;
        r_gearbox_output                    = 0.0 ;
        r_synchoro_dif[10]                  = 0.0 ;
        temp_trans_fluid                    = 0.0 ;
        temp_engine_water                   = 0.0 ;
        v_vehicle                           = 0.0 ;
        tq_brake                            = 0.0 ;
        accel_position                      = 0.0 ;
        shifter_position                    = 0   ;
        r_engine                            = 0.0 ;
        r_engine_idle                       = 0.0 ;
        tq_engine_target                    = 0.0 ;
        tq_engine                           = 0.0 ;
        tq_engine_min_pos                   = 0.0 ;
        tq_engine_max_pos                   = 0.0 ;
        tq_p2m_req                          = 0.0 ;
        flag_k0cl_open_req                  = 0   ;
        r_p2m                               = 0.0 ;
        for( i=0; i<_MaxSyn ; i++){
            f_synchro_old[i]                = 0.0 ;
        }
        gear_ratio_old                      = 0.0 ;
        flag_shift_old                      = 0   ;
        flag_shift_end_speed_old            = 0   ;
        flag_ap_load_shift_old              = 0   ;
        flag_tq_load_shift_old              = 0   ;
        gear_shift_map_old                  = 0   ;
        gear_target_old                     = 0   ;
        gear_before_shift_old               = 0   ;
        gear_sub1_tmp_old                   = 0   ;
        gear_sub2_tmp_old                   = 0   ;
        t_shift_wait_old                    = 0.0 ;
        t_shift_period_old                  = 0.0 ;
        t_shift_interval_old                = 0.0 ;
        t_tq_phase_old                      = 0.0 ;
        t_shift_end_old                     = 0.0 ;
        t_neutral_old                       = 0.0 ;
        flag_cvt_step_shift_old             = 0   ;
        flag_cvt_step_shift_ap_old          = 0   ;

        //TCU_Engin_Idle_Control
        flag_engine_idle_control            = 0  ;

        //TCU_Creep_Control
        tq_cl_creep_cont                    = 0.0 ;

        //TCU_Fluid_Coupling_Torque
        tq_torq_converter_input             = 0.0 ;
        tq_torq_converter_output            = 0.0 ;
        spd_ratio_torq_converter            = 0.0 ;
        torq_ratio_torq_converter           = 0.0 ;
        cap_factor_torq_converter           = 0.0 ;

        //TCU_Slip_Control
        tq_cl_slip_control                  = 0.0 ;
        r_cl_slip_target                    = 0.0 ;
        r_cl_slip_act                       = 0.0 ;
        r_starting_device_target            = 0.0 ;
        tq_torq_converter_slip_tg           = 0.0 ;
        tq_cl_slip_base                     = 0.0 ;
        tq_cl_slip_correct                  = 0.0 ;
        tq_flyweel_output                   = 0.0 ;

        //TCU_Torque_Input_GearBox
        tq_gearbox_input                    = 0.0 ;// [Nm]

        //TCU_Load_shift
        flag_load_shift                     = 0   ;
        flag_ap_load_shift                  = 0   ;
        flag_tq_load_shift                  = 0   ;

        //TCU_CVT_Step_Shift
        flag_cvt_step_shift                 = 0   ;
        flag_cvt_step_shift_ap              = 0   ;

        //TCU_Continuously_shift_schedule
        virtual_gear_cvt_map                = 0.0 ;

        //TCU_Shift_Schedule
        gear_shift_map                      = 0   ;

        //TCU_Shift_End_Jugdement
        flag_shift_end_judge                = 0   ;
        flag_shift_end_speed                = 0   ;
        t_shift_end                         = 0.0 ;

        //TCU_Gear_Target
        gear_target                         = 0   ;
        gear_before_shift                   = 0    ;
        virtual_gear_target                 = 0.0 ;
        virtual_gear_before_shift           = 0.0 ;
        t_shift_wait                        = 0.0 ;
        t_shift_period                      = 0.0 ;
        t_shift_interval_old                = 0.0 ;
        flag_shift                          = 0   ;
        r_gb_input_tg_gear                  = 0.0 ;

        //TCU_Gear_Shift_Type
        gear_shift_kind                     = 0   ;

        //TCU_Target_Gear_Ratio
        gear_ratio                          = 0   ;
        gear_ratio_before_shift             = 0   ;
        gear_ratio_after_shift              = 0   ;
        r_gb_input_tg_gear                  = 0   ;

        //TCU_Sub_Gear
        gear_sub                            = 0   ;
        gear_sub1                           = 0   ;
        gear_sub2                           = 0   ;
        t_neutral                           = 0.0 ;
        gear_sub1_tmp                       = 0   ;
        gear_sub2_tmp                       = 0   ;

        //TCU_SYNCHORO_STATUS
        flag_synchro_ready                  = 0   ;

        //TCU_Gear_Clutch_Control
        gear_cl_com                         = 0   ;

        //TCU_Shift_Clutch
        n_engage_clutch                     = 0   ;
        n_release_clutch                    = 0   ;

        //TCU_Shift_Inertia_Torq
        tq_inertia_engage_cl                = 0.0 ;
        tq_inertia_release_cl               = 0.0 ;
        tq_shift_up_reduction_req           = 0.0 ;
        tq_shift_up_reduction               = 0.0 ;
        tq_eng_shift_up_reduction           = 0.0 ;
        tq_p2m_shift_up_reduction           = 0.0 ;
        t_shift_time_tg                     = 0.0 ;
        r_delta_speed                       = 0.0 ;
        tq_inertia                          = 0.0 ;

        //TCU_Torque_Phase
        rate_torque_phase                   = 0.0 ;
        t_tq_phase                          = 0.0 ;

        //TCU_Clutch_Control
        for( i=0; i<_MaxCL ; i++){
            tq_clutch_cap_inp [i]           = 0.0 ;
        }
        tq_engage_cl_cap                    = 0.0 ;
        tq_release_cl_cap                   = 0.0 ;

        //TCU_Clutch_Torque_Capacity
        for( i=0; i<_MaxCL ; i++){
            tq_clutch_cap     [i]           = 0.0 ;
            rate_clutch_share [i]           = 0.0 ;
        }
        //TCU_SYNCHORO_CONTROL
        for( i=0; i<_MaxSyn ; i++){
            f_synchro         [i]           = 0.0 ;
            flag_synchro_com  [i]           = 0   ;
        }

        //TCU_Trans_Fluid_Characteristic
        viscosity_trans_fluid               = 0.0 ;
        density_trans_fluid                 = 0.0 ;

        //TCU_Pressure_Line_Control
        p_line                              = 0.0 ;

        //TCU_Pressure_CVT_Pulley
        p_pulley_primary                    = 0.0 ;
        p_pulley_secoundary                 = 0.0 ;

        //TCU_Acutuator_Control
        i_actuator                          = 0.0 ;

        //TCU_EOP_Control
        i_eop                               = 0.0 ;

        //TCU_Cooler_Flow_Rate_Control
        q_cooler_trans_fluid                = 0.0 ;
        q_cooler_engine_water               = 0.0 ;

        //TCU_Up_Shift_Torque_Reduction
        flag_shift_up_tq_request            = 0   ;

        //TCU_Engine_Torque_Request
        tq_engine_max_req                   = 0.0 ;
        tq_engine_min_req                   = 0.0 ;
        r_engine_target                     = 0.0 ;

        //TCU_Information_For_ECU
        tq_trans_input                      = 0.0 ;
        tq_gain_drivetrain                  = 0.0 ;
        flag_lockup                         = 0   ;

        //TCU_Disconnect_Clutch_Control
        tq_k0_clutch_cap                    = 0.0 ;
        status_k0_clutch                    = 0   ;

        //TCU_P2_Motor_Control
        tq_p2m_target                       = 0.0 ;

        //TCU_Torque_Input_Starting_Device
        tq_starting_device_input            = 0.0 ;
    }

    //----------------------------------------------------------------
    //----------------------------------------------------------------
    //     入力変数の単位変換
    //----------------------------------------------------------------
    //----------------------------------------------------------------
    if( flag_initialize ){
        r_starting_device_input             = 0.0 ;
        r_gearbox_input                     = 0.0 ;
        r_gearbox_output                    = 0.0 ;
        r_synchoro_dif[10]                  = 0.0 ;
        temp_trans_fluid                    = 0.0 ;
        temp_engine_water                   = 0.0 ;
        v_vehicle                           = 0.0 ;
        tq_brake                            = 0.0 ;
        accel_position                      = 0.0 ;
        shifter_position                    = 0   ;
        r_engine                            = 0.0 ;
        r_engine_idle                       = 0.0 ;
        tq_engine_target                    = 0.0 ;
        tq_engine                           = 0.0 ;
        tq_engine_min_pos                   = 0.0 ;
        tq_engine_max_pos                   = 0.0 ;
        tq_p2m_req                          = 0.0 ;
        flag_k0cl_open_req                  = 0   ;
        r_p2m                               = 0.0 ;
    }
    else {
        r_starting_device_input = w_starting_device_input_radps * 60.0f / ( 2.0 * _PI ) ; // 1.  rad/s -> rpm
        r_gearbox_input     = w_gearbox_input_radps  * 60.0f / ( 2.0 * _PI )            ; // 2.  rad/s -> rpm
        r_gearbox_output    = w_gearbox_output_radps * 60.0f / ( 2.0 * _PI )            ; // 3.  rad/s -> rpm
        for( i=0; i<_MaxSyn ; i++){
            r_synchoro_dif [i] = w_synchoro_dif_radps[i] * 60.0f / ( 2.0f * _PI )       ; // 4.  rad/s -> rpm
        }
        temp_trans_fluid    = t_trans_fluid_k  - 273.15f                                ; // 5.  Kelvin -> degree Celsius
        temp_engine_water   = t_engine_water_k - 273.15f                                ; // 6.  Kelvin -> degree Celsius
        v_vehicle           = v_vehicle_mps * 3600.0f / 1000.0f                         ; // 7.  m/s -> km/h
        tq_brake            = tau_brake                                                 ; // 8.  Nm
        accel_position      = accel_position_per                                        ; // 9.  %
        shifter_position    = trans_shifter_position                                    ; // 10. 
        r_engine            = w_engine_radps        * 60.0f / ( 2.0 * _PI )             ; // 11. rad/s -> rpm
        r_engine_idle       = w_engine_idle_radps   * 60.0f / ( 2.0 * _PI )             ; // 12. rad/s -> rpm
        tq_engine_target    = tau_engine_target                                         ; // 13. Nm
        tq_engine           = tau_engine                                                ; // 14. Nm
        tq_engine_min_pos   = F_max( CONST_TQ_ENG_MIN_POS_L , F_min(CONST_TQ_ENG_MIN_POS_H, tau_engine_min_pos )) ; // 15. Nm
        tq_engine_max_pos   = F_max( CONST_TQ_ENG_MAX_POS_L , F_min(CONST_TQ_ENG_MAX_POS_H, tau_engine_max_pos )) ; // 16. Nm
        tq_p2m_req          = tau_p2m_req                                               ; // 17. Nm
        flag_k0cl_open_req = flag_k0_clutch_open                                        ; // 18. 
        //-----------------------------------
        r_p2m = r_starting_device_input;    // P2 Motor回転
    }
    //----------------------------------------------------------------
    //----------------------------------------------------------------
    //    BLOCK #0 Disconnect Clutch 制御
    //----------------------------------------------------------------
    //----------------------------------------------------------------
     TCU_Disconnect_Clutch_Control(
        //---OUTPUT---
        &tq_k0_clutch_cap,      // Disconnect clutch(K0) トルク容量
        &status_k0_clutch,      // Disconnect clutch(K0) 締結状態 0=開放 1=Slip 2=CLose
        //---INPUT---
        flag_k0cl_open_req, // Disconnect clutch(K0) 開放要求
        r_engine,               // エンジン回転
        r_starting_device_input,// Starting Device 入力回転
        tq_engine_target,       // 目標エンジントルク
        flag_initialize
     );

    // 発進デバイスへの入力トルク( ICE + P2M )
    TCU_Torque_Input_Starting_Device(
        //-----OUTPUT------
        &tq_starting_device_input,      // 発進デバイス入力トルク
        //----INPUT-------
        tq_engine_target,
        tq_p2m_target
    );

    //----------------------------------------------------------------
    //----------------------------------------------------------------
    //    BLOCK #1  発進デバイス制御
    //----------------------------------------------------------------
    //----------------------------------------------------------------

    // Engineによるアイドル回転制御の実行判定
    TCU_Engin_Idle_Control (
        //-----OUTPUT------
        &flag_engine_idle_control,      // アイドル回転制御の実行判定フラグ
        //----INPUT-------
        flag_initialize,
        r_engine_idle,
        accel_position,
        v_vehicle,
        gear_target,
        r_gb_input_tg_gear
    );

    // クリープトルク制御
    TCU_Creep_Control (
        //-----OUTPUT------
        &tq_cl_creep_cont,              // クリープトルク
        //----INPUT-------
        flag_initialize,
        gear_target
    );

    // トルクコンバータ特性の演算
    TCU_Fluid_Coupling_Torque (
        //-----OUTPUT------
        &tq_torq_converter_input,       // トルコン流体伝達トルク(入力）
        &tq_torq_converter_output,      // トルコン流体伝達トルク(出力)
        &spd_ratio_torq_converter,      // 速度比
        &torq_ratio_torq_converter,     // トルク比
        &cap_factor_torq_converter,     // 容量係数
        //----INPUT-------
        r_starting_device_input,
        r_gearbox_input
    );

    // 発進デバイスのスリップ制御
    TCU_Slip_Control (
        &tq_cl_slip_control,        // スリップ制御クラッチのトルク容量     
        &r_cl_slip_target,          // 目標スリップ量
        &r_cl_slip_act,             // 実スリップ量
        &r_starting_device_target,  // Startubg Device目標回転
        &tq_torq_converter_slip_tg, // 目標Slip時の流体伝達トルク
        &tq_cl_slip_base,
        &tq_cl_slip_correct,
        &tq_flyweel_output,
        //----INPUT-------
        flag_initialize,
        flag_shift,
        r_starting_device_input,
        r_gb_input_tg_gear,
        tq_starting_device_input,
        r_engine_idle,
        gear_ratio_after_shift,
        gear_target,
        gear_target_old,
        flag_engine_idle_control,   // アイドル回転制御の実行判定フラグ
        flag_k0cl_open_req
    );

    // GearBox入力トルクの算出
    TCU_Torque_Input_GearBox(
        //-----OUTPUT------
        &tq_gearbox_input,              // GearBox入力トルク
        //----INPUT-------
        tq_starting_device_input,
        torq_ratio_torq_converter
    );

    //----------------------------------------------------------------
    //----------------------------------------------------------------
    //    BLOCK #2 変速点制御
    //----------------------------------------------------------------
    //----------------------------------------------------------------
    // 駆動・被駆動判定
    if( flag_initialize ){
        flag_ap_load_shift_old  =  FALSE ;
        flag_tq_load_shift_old  =  FALSE ;
    }
    else{
        flag_ap_load_shift_old  =   flag_ap_load_shift  ;
        flag_tq_load_shift_old  =   flag_tq_load_shift  ;
    }
    TCU_Load_shift(
        //===OUTPUT===
        &flag_load_shift,       // Power on 判定
        &flag_ap_load_shift,    // Power on 判定アクセル開度
        &flag_tq_load_shift,    // Power on 判定エンジントルク
        //===INPUT====
        flag_ap_load_shift_old,
        flag_tq_load_shift_old,
        accel_position,
        tq_starting_device_input
    );

    // CVTにおける有段変速模擬シフト条件判定
    if( flag_initialize ){
        flag_cvt_step_shift_old    = FALSE ;
        flag_cvt_step_shift_ap_old = FALSE ;
    }
    else {
        flag_cvt_step_shift_old    = flag_cvt_step_shift    ;
        flag_cvt_step_shift_ap_old = flag_cvt_step_shift_ap ;
    }
    TCU_CVT_Step_Shift (
        //===OUTPUT===
        &flag_cvt_step_shift   , //CVTの疑似STEP変速
        &flag_cvt_step_shift_ap, //CVTの疑似STEP変速アクセル開度
        //===INPUT====
        accel_position,
        flag_cvt_step_shift_old,
        flag_cvt_step_shift_ap_old,
        flag_shift
    );

    // CVT無断変速時の仮想ギヤ段
    TCU_Continuously_shift_schedule(
        //===OUTPUT===
        &virtual_gear_cvt_map,      // シフトマップから算出される仮想ギヤ段
        //===INPUT====
        shifter_position,
        accel_position,
        v_vehicle
    );      

    // マップで定められたギヤ段の算出
    if( flag_initialize ){
        gear_shift_map_old = FALSE ;
    }
    else {
        gear_shift_map_old = gear_shift_map;
    }
    TCU_Shift_Schedule(
        //===OUTPUT===
        &gear_shift_map,        // シフトマップから算出されるギヤ段
        //===INPUT====
        gear_shift_map_old,
        shifter_position,
        accel_position,
        v_vehicle,
        flag_cvt_step_shift,
        flag_k0cl_open_req
    );

    if( flag_initialize ){
        flag_shift_end_speed_old = FALSE ;
        t_shift_end_old          = FALSE ;
    }
    else {
        flag_shift_end_speed_old = flag_shift_end_speed ;
        t_shift_end_old          = t_shift_end ;
    }
    //変速終了判定
    TCU_Shift_End_Jugdement (
        //===OUTPUT===
        &flag_shift_end_judge,  // 変速終了フラグ
        &flag_shift_end_speed,  // 回転による変速終了判定フラグ
        &t_shift_end,           // 変速終了判定タイマー
        //===INPUT====
        flag_shift_end_speed_old,
        t_shift_end_old,
        r_gearbox_input,
        r_gb_input_tg_gear,
        rate_torque_phase,
        gear_shift_kind,
        t_shift_period
    );

    // 目標ギヤ段の決定
    if( flag_initialize ){
        gear_target_old         = FALSE ;
        gear_before_shift_old   = FALSE ;
        t_shift_wait_old        = FALSE ;
        t_shift_period_old      = FALSE ;
        t_shift_interval_old    = FALSE ;
        flag_shift_old          = FALSE ;
    }
    else{
        gear_target_old         = gear_target           ;
        gear_before_shift_old   = gear_before_shift     ;
        t_shift_wait_old        = t_shift_wait          ;
        t_shift_period_old      = t_shift_period        ;
        t_shift_interval_old    = t_shift_interval      ;
        flag_shift_old          = flag_shift            ;
    }
    TCU_Gear_Target(
        //===OUTPUT===
        &gear_target,               // 目標ギヤ段
        &gear_before_shift,         // 変速前ギヤ段
        &virtual_gear_target,       // 目標仮想ギヤ段
        &virtual_gear_before_shift, //目標仮想ギヤ段
        &t_shift_wait,              // 変速判定待機時間
        &t_shift_period,            // 変速制御時間
        &t_shift_interval,          // 変速間隔
        &flag_shift,                // シフトフラグ
        //===INPUT====
        flag_initialize,
        gear_before_shift_old,
        t_shift_wait_old,
        t_shift_period_old,
        t_shift_interval_old,
        flag_shift_old,
        gear_shift_map,
        gear_shift_map_old,
        flag_load_shift,
        shifter_position,
        flag_shift_end_judge,
        flag_cvt_step_shift,
        flag_cvt_step_shift_old,
        virtual_gear_cvt_map
    );

    // 変速種別判定
    TCU_Gear_Shift_Type (
        //===OUTPUT===
        &gear_shift_kind,       // 変速種別
                                //  5 : N->R
                                //  4 : N->D
                                //  3 : Torque demand shift
                                //  2 : Coast down shift
                                //  1 : Schedule up shift
        //===INPUT====
        flag_load_shift,
        flag_shift,
        gear_target,
        gear_before_shift
    );

    // 目標ギヤ比
    if( flag_initialize ){
        gear_ratio_old = FALSE ;
    }
    else {
        gear_ratio_old = gear_ratio;
    }
    TCU_Target_Gear_Ratio (
        //===OUTPUT===
        &gear_ratio         ,       //目標ギヤレシオ
        &gear_ratio_before_shift,   //変速前のギヤレシオ
        &gear_ratio_after_shift,    //変速後のギヤレシオ
        &r_gb_input_tg_gear,        //目標ギヤ段でのGearBox入力回転（GearBox出力回転から演算)
        //===INPUT====
        gear_ratio_old,
        gear_target,
        gear_before_shift,
        virtual_gear_cvt_map
    );

    //DCTの待機ギヤ段の決定
    if( flag_initialize ){
        gear_sub2_tmp_old = FALSE ;
        gear_sub1_tmp_old = FALSE ;
        t_neutral_old = FALSE;
    }
    else {
        gear_sub2_tmp_old = gear_sub2_tmp;
        gear_sub1_tmp_old = gear_sub1_tmp;
        t_neutral_old = t_neutral;
    }
    TCU_Sub_Gear(
        //===OUTPUT===
        &gear_sub,          // 待機ギヤ段
        &gear_sub1,         // 待機ギヤ段（主軸）
        &gear_sub2,         // 待機ギヤ段（副軸）
        &t_neutral,         // ニュートラル移行タイマ
        &gear_sub1_tmp,
        &gear_sub2_tmp,
        //===INPUT====
        gear_sub1_tmp_old,
        gear_sub2_tmp_old,
        t_neutral_old,
        accel_position,
        v_vehicle,
        gear_target,
        gear_target_old,
        gear_before_shift,
        shifter_position,
        flag_shift
    );

    //----------------------------------------------------------------
    //----------------------------------------------------------------
    //    BLOCK #3 変速機構制御
    //----------------------------------------------------------------
    //----------------------------------------------------------------

    // シンクロ同期判定
    TCU_SYNCHORO_STATUS (
        //---OUTPUT---
        &flag_synchro_ready,    // シンクロの同期判定
        //---INPUT---
        gear_target,
        f_synchro,
        r_synchoro_dif
    );

    // Clutch制御用ギヤ段 (TorqPhase開始で切り替わる)の算出
    TCU_Gear_Clutch_Control(
        //===OUTPUT===
        &gear_cl_com,           //Clutch制御用ギヤ段
        //===INPUT====
        flag_initialize,
        flag_synchro_ready,
        gear_target,
        gear_before_shift,
        gear_shift_kind,
        r_gearbox_input,
        r_gb_input_tg_gear
    );

    // 締結・解放クラッチの算出
    TCU_Shift_Clutch (
        //-----OUTPUT------
        &n_engage_clutch,       // 締結クラッチ
        &n_release_clutch,      // 解放クラッチ
        //----INPUT-------
        gear_target,
        gear_before_shift
    );

    //変速時のイナーシャトルクの算出

    TCU_Shift_Inertia_Torq (
        //-----OUTPUT------
        &tq_inertia_engage_cl,      // 締結クラッチのイナーシャトルク
        &tq_inertia_release_cl,     // 解放クラッチのイナーシャトルク
        &tq_shift_up_reduction_req, // アップシフト時のトルクリダクション量要求値
        &tq_shift_up_reduction,     // アップシフト時のトルクリダクション量実行値
        &tq_eng_shift_up_reduction, // アップシフト時のエンジントルクリダクション量
        &tq_p2m_shift_up_reduction, // アップシフト時のP2Mトルクリダクション量
        &t_shift_time_tg,           // 目標変速時間
        &r_delta_speed,             // 変速前後差回転
        &tq_inertia,                // イナーシャトルク
        //----INPUT-------
        flag_initialize,
        gear_shift_kind,
        gear_target,
        gear_target_old,
        gear_before_shift,
        r_p2m,
        r_gearbox_input,
        r_gb_input_tg_gear,
        tq_engine_target,
        tq_engine_min_pos,
        flag_k0cl_open_req,
        tq_p2m_req
    );
    if( flag_initialize ){
        t_tq_phase_old = FALSE ;
    }
    else {
        t_tq_phase_old = t_tq_phase;
    }
    // トルクフェイズの移行レシオの算出
    TCU_Torque_Phase (
        &rate_torque_phase,         // トルクフェイズ移行比率
        &t_tq_phase,                // トルクフェイズ経過時間
        t_tq_phase_old,
        flag_shift,
        gear_shift_kind,
        gear_cl_com,
        gear_target
    );

    // 各クラッチ容量の計算（分担トルク未考慮）
    TCU_Clutch_Control (
        //----- output ---------
        tq_clutch_cap_inp,          // クラッチトルク容量（分担トルク未考慮）
        &tq_engage_cl_cap,          // 締結クラッチトルク容量
        &tq_release_cl_cap,         // 解放クラッチトルク容量
        //----- input ---------
        tq_gearbox_input,
        tq_cl_slip_control,
        tq_inertia_engage_cl,
        tq_inertia_release_cl,
        rate_torque_phase,
        flag_shift,
        n_engage_clutch,
        n_release_clutch,
        gear_cl_com,
        gear_target,
        flag_engine_idle_control,
        tq_cl_creep_cont
    );

    // 各クラッチの分担トルクを掛ける
    TCU_Clutch_Torque_Capacity (
        //----- output ---------
        tq_clutch_cap,          // クラッチのトルク容量
        rate_clutch_share,      // 分担トルク
        //-------------------------------
        gear_target,
        gear_before_shift,
        tq_clutch_cap_inp
    );

    // シンクロ制御
    if( flag_initialize ){
        for( i=0; i<_MaxSyn ; i++){
            f_synchro_old[i] = 0.0 ;
        }
    }
    else {
        for( i=0; i<_MaxSyn ; i++){
            f_synchro_old[i] = f_synchro[i] ;
        }
    }
    TCU_SYNCHORO_CONTROL (
        //---OUTPUT---
        f_synchro,              // シンクロの押し力
        flag_synchro_com,       // シンクロ締結指示
        //---INPUT---
        f_synchro_old,
        gear_target,
        gear_before_shift,
        gear_sub1,
        gear_sub2
    );

    //----------------------------------------------------------------
    //----------------------------------------------------------------
    //    BLOCK #4 油圧＆アクチュエータ制御
    //----------------------------------------------------------------
    //----------------------------------------------------------------
    // Transmission Fluid 特性
    TCU_Trans_Fluid_Characteristic (
        //---OUTPUT---
        &viscosity_trans_fluid,             // 動粘度 [m2/s]
        &density_trans_fluid,               // 密度   [kg/m3]
        //---INPUT---
        temp_trans_fluid
    );

    // CVT挟圧制御
    TCU_Pressure_CVT_Pulley (
        //---OUTPUT---
        &p_pulley_primary,
        &p_pulley_secoundary,
        //---INPUT---
        tq_gearbox_input,
        r_gearbox_input,
        r_gearbox_output,
        gear_ratio,
        gear_ratio_after_shift,
        viscosity_trans_fluid,
        density_trans_fluid
    );

    // ライン圧制御
    TCU_Pressure_Line_Control (
        //---OUTPUT---
        &p_line,                // ライン圧
        //---INPUT---
        tq_gearbox_input,
        gear_target,
        p_pulley_primary,
        p_pulley_secoundary

    );

    // アクチュエータ消費電流
    TCU_Acutuator_Control (
        //---OUTPUT---
        &i_actuator,            // アクチュエータ消費電流
        //---INPUT---
        gear_target
    );

    // 電動オイルポンプ消費電流
    TCU_EOP_Control (
        //---OUTPUT---
        &i_eop,                 // 電動オイルポンプの消費電流
        //---INPUT---
        r_engine,
        temp_trans_fluid
    );

    // クーラー流量
    TCU_Cooler_Flow_Rate_Control (
        //---OUTPUT---
        &q_cooler_trans_fluid,  // トランスミッションオイル流量
        &q_cooler_engine_water, // 冷却水量
        //---INPUT---
        temp_trans_fluid
    );

    //----------------------------------------------------------------
    //----------------------------------------------------------------
    //    BLOCK #5 エンジン制御
    //----------------------------------------------------------------
    //----------------------------------------------------------------

    // Up Shift時のトルクリダクション
    TCU_Up_Shift_Torque_Reduction (
        //---OUTPUT---
        &flag_shift_up_tq_request,      // アップシフト時のトルクリダクション実行フラグ
        //---INPUT---
        tq_eng_shift_up_reduction,
        gear_shift_kind,
        gear_target,
        gear_before_shift,
        flag_shift,
        rate_torque_phase,
        r_gb_input_tg_gear,
        r_gearbox_input,
        tq_engine_min_pos,
        tq_inertia_engage_cl
    );

    // エンジントルク制御要求
     TCU_Engine_Torque_Request (
        //---OUTPUT---
        &tq_engine_max_req,             // エンジントルク最大値要求(トルクリダクション要求）
        &tq_engine_min_req,             // エンジントルク最小値要求（トルクアップ要求)
        &r_engine_target,               // エンジン回転要求
        //---INPUT---
        tq_engine_target,
        tq_eng_shift_up_reduction,
        flag_shift_up_tq_request,
        flag_k0cl_open_req
    );

    // ECUに必要な情報の演算
    TCU_Information_For_ECU (
        //---OUTPUT---
        &tq_trans_input             ,   // トランスミッション入力軸トルク   [Nm]
        &tq_gain_drivetrain         ,   // ドライブトレインのトルク増幅率
        &flag_lockup                ,   // ロックアップ判定
        //---INPUT---
        gear_target,
        flag_engine_idle_control,
        tq_torq_converter_input,
        tq_cl_creep_cont,
        tq_cl_slip_base,
        gear_ratio,
        torq_ratio_torq_converter
    );

    //----------------------------------------------------------------
    //----------------------------------------------------------------
    //    BLOCK #6 P2モーター制御
    //----------------------------------------------------------------
    //----------------------------------------------------------------
    TCU_P2_Motor_Control(
        //---OUTPUT---
        &tq_p2m_target,         // P2 Motor目標トルク
        //---INPUT---
        status_k0_clutch,
        flag_shift_up_tq_request,
        tq_starting_device_input,
        tq_p2m_req,
        r_engine,
        tq_p2m_shift_up_reduction
    );

    //----------------------------------------------------------------
    //----------------------------------------------------------------
    //     出力変数のSI単位系への変換
    //----------------------------------------------------------------
    //----------------------------------------------------------------
    *trans_gear                 = virtual_gear_target                       ; // 1.
    *trans_gear_ratio           = gear_ratio                                ; // 2.
    for( i=0; i<_MaxCL ; i++){
        tau_clutch_cap[i] = tq_clutch_cap[i]                                ; // 3. Nm
    }
    for( i=0; i<_MaxSyn ; i++){
        f_synchro_n[i] = f_synchro[i]                                       ; // 4. N
    }
    *tau_k0_clutch_cap          = tq_k0_clutch_cap                          ; // 5. Nm
    *tau_p2m_target             = tq_p2m_target                             ; // 6. Nm
    *p_line_pa                  = p_line                * 1000.0f           ; // 7. kPa -> Pa
    *p_pulley_pri_pa            = p_pulley_primary      * 1000.0f           ; // 8. kPa -> Pa
    *p_pulley_sec_pa            = p_pulley_secoundary   * 1000.0f           ; // 9. kPa -> Pa
    *i_actuator_ampere          = i_actuator                                ; // 10. Ampere
    *i_eop_ampere               = i_eop                                     ; // 11. Ampere
    *qv_cooler_trans_fluid_m3ps = q_cooler_trans_fluid  / 1000.0f / 60.0f   ; // 12. L/min ->m3/s
    *qv_cooler_eng_water_m3ps   = q_cooler_engine_water / 1000.0f / 60.0f   ; // 13. L/min ->m3/s
    *torque_gain_drivetrain     = tq_gain_drivetrain                        ; // 14.
    *flag_trans_shift           = flag_shift                                ; // 15.
    *tau_engine_max_req         = tq_engine_max_req                         ; // 16. Nm
    *tau_engine_min_req         = tq_engine_min_req                         ; // 17. Nm
    *w_engine_target_radps      = r_engine_target / 60.0f * ( 2 * _PI )     ; // 18. rpm -> rad/s
    *tau_trans_input            = tq_trans_input                            ; // 19. Nm
    *flag_trans_lockup          = flag_lockup                               ; // 20.

}

// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
//                               サブルーチン
// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
void    TCU_Engin_Idle_Control (
        //-----OUTPUT------
        schar   *flag_engine_idle_control,  // アイドル回転制御の実行判定フラグ
        //----INPUT-------
        schar    flag_initialize,
        float   r_engine_idle,
        float   accel_position,
        float   v_vehicle,
        sshort  gear_target,
        float   r_gb_input_tg_gear
    ){
    //---------------------------------------------
    // Engineによるアイドル回転制御の実行判定
    //---------------------------------------------
    if ( flag_initialize ){
        *flag_engine_idle_control = FALSE ;
    }
    else if( gear_target == 0
        || ( r_gb_input_tg_gear < r_engine_idle || r_gb_input_tg_gear < MAT_R_SLIP_CONT_MIN[gear_target] || v_vehicle < CONST_V_IDLE_SPEED_CONT )
        && accel_position < CONST_AP_IDLE_SPEED_CONT )
    {
        *flag_engine_idle_control = TRUE ;
    }
    else {
        *flag_engine_idle_control = FALSE;
    }
}

// =============================================================================
void    TCU_Creep_Control (
        //-----OUTPUT------
        float   *tq_cl_creep_cont,  // クリープ制御のためのクラッチトルク容量
        //----INPUT-------
        schar    flag_initialize,
        sshort  gear_target
    ){
    //---------------------------------------------
    // クリープトルク制御
    //---------------------------------------------
    if( flag_initialize ){
        *tq_cl_creep_cont = 0.0f;
    }
    else if( gear_target==0 ){
        *tq_cl_creep_cont = 0.0f;
    }
    else{
        *tq_cl_creep_cont = CONST_TQ_CREEP_CONT;
    }
}

// =============================================================================
void    TCU_Fluid_Coupling_Torque (
        //-----OUTPUT------
        float   *tq_torq_converter_input,       // トルコン流体伝達トルク(入力）
        float   *tq_torq_converter_output,      // トルコン流体伝達トルク(出力)
        float   *spd_ratio_torq_converter,      // 速度比
        float   *torq_ratio_torq_converter,     // トルク比
        float   *cap_factor_torq_converter,     // 容量係数
        //----INPUT-------
        float   r_starting_device_input,
        float   r_gearbox_input
    ){
    //------------------------------------------------
    // トルクコンバータ特性の演算
    //------------------------------------------------
    //速度非
    if( r_engine <= 100.0f){
        *spd_ratio_torq_converter= 0.0f;
    }
    else{
        *spd_ratio_torq_converter = r_gearbox_input / r_engine;
    }
    //容量係数
    *cap_factor_torq_converter =
             Table_search_2D(T2D_COUPLING_CAP_FACT_Y, T2D_COUPLING_CAP_FACT_X, *spd_ratio_torq_converter, 15);
    //トルク比
    *torq_ratio_torq_converter =
             Table_search_2D(T2D_COUPLING_TQ_RATIO_Y, T2D_COUPLING_TQ_RATIO_X, *spd_ratio_torq_converter, 15);

    *tq_torq_converter_input
        = (*cap_factor_torq_converter) * r_starting_device_input * r_starting_device_input / 1000000.0f;
    *tq_torq_converter_output
        = (*tq_torq_converter_input) * (*torq_ratio_torq_converter);
}

// =============================================================================
void    TCU_Slip_Control (
        //-----OUTPUT------
        float   *tq_cl_slip_control,        // スリップ制御クラッチのトルク容量
        float   *r_cl_slip_target,          // 目標スリップ量
        float   *r_cl_slip_act,             // 実スリップ量
        float   *r_starting_device_target,  // Startubg Device目標回転
        float   *tq_torq_converter_slip_tg, // 目標Slip時の流体伝達トルク
        float   *tq_cl_slip_base,
        float   *tq_cl_slip_correct,
        float   *tq_flyweel_output,
        //----INPUT-------
        schar    flag_initialize,
        schar   flag_shift,
        float   r_starting_device_input,
        float   r_gb_input_tg_gear,
        float   tq_starting_device_input,
        float   r_engine_idle,
        float   gear_ratio_after_shift,
        sshort  gear_target,
        sshort  gear_target_old,
        schar   flag_engine_idle_control,   // アイドル回転制御の実行判定フラグ
        schar   flag_k0cl_open_req
    ){
    //====================================
    // 発進デバイスのスリップ制御
    //====================================

    //-----------------------------------------
    // 目標スリップ量

    float r_cl_slip_target_map;
    float r_cl_slip_target_temp;
    float spd_ratio_torq_converter_tg;
    float cap_factor_torq_converter_tg;
    float dw_flyweel            ;// [rad/s2]
    float total_gear_ratio      ;   
    float inertia_shift         ;

    //-------------------------------------------------------------
    if( flag_initialize ){
        *r_cl_slip_target = 0.0 ;
    }
    else if( flag_k0cl_open_req == FALSE ){  // HEV Drive 時
        if( gear_target == 1 || gear_target == _GrRev){ 
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G1 ,
                              Table_search_2D(T2DX_R_SLIP_G1_Y, T2DX_R_SLIP_G1_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G1_Y, T2DY_R_SLIP_G1_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 2){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G2 ,
                              Table_search_2D(T2DX_R_SLIP_G2_Y, T2DX_R_SLIP_G2_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G2_Y, T2DY_R_SLIP_G2_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 3){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G3 ,
                              Table_search_2D(T2DX_R_SLIP_G3_Y, T2DX_R_SLIP_G3_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G3_Y, T2DY_R_SLIP_G3_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 4){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G4 ,
                              Table_search_2D(T2DX_R_SLIP_G4_Y, T2DX_R_SLIP_G4_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G4_Y, T2DY_R_SLIP_G4_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 5){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G5 ,
                              Table_search_2D(T2DX_R_SLIP_G5_Y, T2DX_R_SLIP_G5_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G5_Y, T2DY_R_SLIP_G5_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 6){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G6 ,
                              Table_search_2D(T2DX_R_SLIP_G6_Y, T2DX_R_SLIP_G6_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G6_Y, T2DY_R_SLIP_G6_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 7){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G7 ,
                              Table_search_2D(T2DX_R_SLIP_G7_Y, T2DX_R_SLIP_G7_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G7_Y, T2DY_R_SLIP_G7_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 8){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G8 ,
                              Table_search_2D(T2DX_R_SLIP_G8_Y, T2DX_R_SLIP_G8_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G8_Y, T2DY_R_SLIP_G8_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else if( gear_target == 9){
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G9 ,
                              Table_search_2D(T2DX_R_SLIP_G9_Y, T2DX_R_SLIP_G9_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G9_Y, T2DY_R_SLIP_G9_X, tq_starting_device_input  , 9), 9 ) ;
        }
        else {
            r_cl_slip_target_map = Table_search_3D(T3D_R_SLIP_G10 ,
                              Table_search_2D(T2DX_R_SLIP_G10_Y, T2DX_R_SLIP_G10_X, r_gb_input_tg_gear, 9), 9,
                              Table_search_2D(T2DY_R_SLIP_G10_Y, T2DY_R_SLIP_G10_X, tq_starting_device_input  , 9), 9 ) ;
        }
        //----------------------------------------
        if( tq_starting_device_input>0 ){ r_cl_slip_target_temp = F_max(r_cl_slip_target_map, 0.0) ;}
        else                            { r_cl_slip_target_temp = F_min(r_cl_slip_target_map, 0.0) ;}

        //----------------------------------------
        *r_cl_slip_target = F_max( r_engine_idle - r_gb_input_tg_gear, r_cl_slip_target_temp);
    }
    else {  //EV Drive 時
        *r_cl_slip_target = 0.0 ;
    }
    //-------------------------------------------------------------
    if( flag_initialize ){
        *r_starting_device_target = 0.0;
    }
    else {
        *r_starting_device_target = r_gb_input_tg_gear + (*r_cl_slip_target);
    }
    //-----------------------------------------
    // 目標スリップ時の流体伝達トルクの計算
    // 速度比
    if( (*r_starting_device_target) <= 100.0f){
        spd_ratio_torq_converter_tg= 0.0f;
    }
    else{
        spd_ratio_torq_converter_tg = r_gb_input_tg_gear / (*r_starting_device_target);
    }
    // 容量係数
    cap_factor_torq_converter_tg =
         Table_search_2D(T2D_COUPLING_CAP_FACT_Y, T2D_COUPLING_CAP_FACT_X, spd_ratio_torq_converter_tg, 15);
    // 流体伝達トルク
    if( flag_initialize ){
        *tq_torq_converter_slip_tg = 0.0 ;
    }
    else if( flag_shift || gear_target != gear_target_old ){;} //変速時は前回値を使用
    else {
        *tq_torq_converter_slip_tg
            = cap_factor_torq_converter_tg
                 * (*r_starting_device_target) * (*r_starting_device_target) / 1000000.0f;
    }

    // イナーシャによる損失トルクを計算する。   
    if( flag_k0cl_open_req ){
        inertia_shift = CONST_INERTIA_P2M;
    }
    else {
        inertia_shift = CONST_INERTIA_P2M + CONST_INERTIA_CLANK;
    }
    total_gear_ratio = CONST_FGR * gear_ratio_after_shift;
    if( total_gear_ratio == 0 ){
        dw_flyweel = 0.0f ;
    }
    else {
        dw_flyweel =  tq_starting_device_input / 
            ( inertia_shift + CONST_CAR_WEIGHT * CONST_R_TIRE * CONST_R_TIRE /(total_gear_ratio * total_gear_ratio ) );
    }
    *tq_flyweel_output = tq_starting_device_input - inertia_shift * dw_flyweel;

    if( (*tq_flyweel_output) >= 0 ){
        *tq_cl_slip_base = F_max( (*tq_flyweel_output) - (*tq_torq_converter_slip_tg), 0.0f );
    }
    else{
        *tq_cl_slip_base = - F_min( (*tq_flyweel_output) - (*tq_torq_converter_slip_tg), 0.0f );
    }
    
    //-----------------------------------------
    // スリップ量補正
    if( flag_initialize ){
        *r_cl_slip_act = 0.0 ;
    }
    else {
        *r_cl_slip_act = r_starting_device_input - r_gb_input_tg_gear;
    }
    
    if( flag_initialize ){
        *tq_cl_slip_correct = 0.0f;
    }
    else if( flag_engine_idle_control == TRUE ){
        *tq_cl_slip_correct = 0.0f;
    }
    else if( flag_shift || gear_target != gear_target_old ){;} //変速時は補正を止める
    else{
        if( *r_cl_slip_act >0 ){
            *tq_cl_slip_correct
            = Table_search_2D(T2D_TQ_CL_SLIP_GAIN_Y, T2D_TQ_CL_SLIP_GAIN_X, *r_cl_slip_act - *r_cl_slip_target, 5);
        }
        else {
            *tq_cl_slip_correct
            = - Table_search_2D(T2D_TQ_CL_SLIP_GAIN_Y, T2D_TQ_CL_SLIP_GAIN_X, *r_cl_slip_act - *r_cl_slip_target, 5);
        }
    }

    //-----------------------------------------
    // 発進クラッチ容量
    if( F_abs(*r_cl_slip_act) < CONST_R_FULL_LOCKUP && F_abs(*r_cl_slip_target) <= CONST_R_FULL_LOCKUP ){
        *tq_cl_slip_control = F_max( (*tq_cl_slip_base) + (*tq_cl_slip_correct), 0.0f) + CONST_TQ_ENGAGE_CL_MARGIN;
    }
    else {
        *tq_cl_slip_control = F_max( (*tq_cl_slip_base) + (*tq_cl_slip_correct), 0.0f) ;
    }
}

// =============================================================================
void    TCU_Torque_Input_GearBox(
        //-----OUTPUT------
        float   *tq_gearbox_input,          // ギヤボックス入力トルク
        //----INPUT-------
        float   tq_starting_device_input,       // StartingDevice入力トルク
        float   torq_ratio_torq_converter       // トルク比
){
    //========================================
    // GearBox入力トルクの算出
    //========================================
    *tq_gearbox_input = tq_starting_device_input * torq_ratio_torq_converter;
}

// =============================================================================
void     TCU_Load_shift(
        //===OUTPUT===
        schar   *flag_load_shift,       // Power on 判定
        schar   *flag_ap_load_shift,    // Power on 判定アクセル開度
        schar   *flag_tq_load_shift,    // Power on 判定エンジントルク
        //===INPUT====
        schar   flag_ap_load_shift_old,
        schar   flag_tq_load_shift_old,
        float   accel_position,
        float   tq_starting_device_input
){
    //-------------------------------------------------------------
    // 駆動／被駆動判定
    //-------------------------------------------------------------
    Switch_with_hys( flag_ap_load_shift, flag_ap_load_shift_old, accel_position ,   CONST_AP_LOAD_SFT, CONST_AP_LOAD_SFT_HYS);
    Switch_with_hys( flag_tq_load_shift, flag_tq_load_shift_old, tq_starting_device_input , CONST_TQ_LOAD_SFT, CONST_TQ_LOAD_SFT_HYS);
    if( (*flag_ap_load_shift) == TRUE || (*flag_tq_load_shift) == TRUE ){
        *flag_load_shift = TRUE;
    }
    else{
        *flag_load_shift = FALSE;
    }
}

// =============================================================================
void     TCU_CVT_Step_Shift (
        //===OUTPUT===
        schar   *flag_cvt_step_shift,    //CVTの疑似STEP変速
        schar   *flag_cvt_step_shift_ap, //CVTの疑似STEP変速アクセル開度
        //===INPUT====
        float   accel_position,
        schar   flag_cvt_step_shift_old,
        schar   flag_cvt_step_shift_ap_old,
        schar   flag_shift
){
    //-------------------------------------------------------------
    // CVTの疑似Step変速判定
    //-------------------------------------------------------------
    Switch_with_hys( flag_cvt_step_shift_ap, flag_cvt_step_shift_ap_old, accel_position , CONST_AP_CVT_STEP_SHIFT, CONST_AP_CVT_STEP_SHIFT_HYS );
    if( flag_cvt_step_shift_old == TRUE ){
        if ( (*flag_cvt_step_shift_ap) == FALSE && flag_shift == FALSE ){ //Step変速中は無断変速に移行しない
            *flag_cvt_step_shift = FALSE ;
        }
        else {
            *flag_cvt_step_shift = TRUE ;
        }
    }
    else {
        if ( (*flag_cvt_step_shift_ap) == TRUE ){
            *flag_cvt_step_shift = TRUE ;
        }
        else {
            *flag_cvt_step_shift = FALSE ;
        }
    }
}

// =============================================================================
void     TCU_Continuously_shift_schedule (
        //===OUTPUT===
        float   *virtual_gear_cvt_map,  //シフトマップから算出されるギヤ段
        //===INPUT====
        sshort  shifter_position,
        float   accel_position,
        float   v_vehicle
){
    //-------------------------------------------------------------
    // 仮想ギヤ段の算出
    //-------------------------------------------------------------
    float v_shift_A;
    float v_shift_9;
    float v_shift_8;
    float v_shift_7;
    float v_shift_6;
    float v_shift_5;
    float v_shift_4;
    float v_shift_3;
    float v_shift_2;
    float v_shift_1;
    float v_shift_lo ;
    float v_shift_hi ;
    sshort tmp_gear_cvt_map;
    //=============================================
    v_shift_A = Table_search_2D(T2D_V_SFT_A_Y, T2D_V_SFT_A_X, accel_position, 10);
    v_shift_9 = Table_search_2D(T2D_V_SFT_9_Y, T2D_V_SFT_9_X, accel_position, 10);
    v_shift_8 = Table_search_2D(T2D_V_SFT_8_Y, T2D_V_SFT_8_X, accel_position, 10);
    v_shift_7 = Table_search_2D(T2D_V_SFT_7_Y, T2D_V_SFT_7_X, accel_position, 10);
    v_shift_6 = Table_search_2D(T2D_V_SFT_6_Y, T2D_V_SFT_6_X, accel_position, 10);
    v_shift_5 = Table_search_2D(T2D_V_SFT_5_Y, T2D_V_SFT_5_X, accel_position, 10);
    v_shift_4 = Table_search_2D(T2D_V_SFT_4_Y, T2D_V_SFT_4_X, accel_position, 10);
    v_shift_3 = Table_search_2D(T2D_V_SFT_3_Y, T2D_V_SFT_3_X, accel_position, 10);
    v_shift_2 = Table_search_2D(T2D_V_SFT_2_Y, T2D_V_SFT_2_X, accel_position, 10);
    v_shift_1 = Table_search_2D(T2D_V_SFT_1_Y, T2D_V_SFT_1_X, accel_position, 10);
    //=============================================
    if     ( v_vehicle >= v_shift_A ){ v_shift_lo = v_shift_A ; v_shift_hi = v_shift_A ;  tmp_gear_cvt_map = 10 ;}
    else if( v_vehicle >= v_shift_9 ){ v_shift_lo = v_shift_9 ; v_shift_hi = v_shift_A ;  tmp_gear_cvt_map =  9 ;}
    else if( v_vehicle >= v_shift_8 ){ v_shift_lo = v_shift_8 ; v_shift_hi = v_shift_9 ;  tmp_gear_cvt_map =  8 ;}
    else if( v_vehicle >= v_shift_7 ){ v_shift_lo = v_shift_7 ; v_shift_hi = v_shift_8 ;  tmp_gear_cvt_map =  7 ;}
    else if( v_vehicle >= v_shift_6 ){ v_shift_lo = v_shift_6 ; v_shift_hi = v_shift_7 ;  tmp_gear_cvt_map =  6 ;}
    else if( v_vehicle >= v_shift_5 ){ v_shift_lo = v_shift_5 ; v_shift_hi = v_shift_6 ;  tmp_gear_cvt_map =  5 ;}
    else if( v_vehicle >= v_shift_4 ){ v_shift_lo = v_shift_4 ; v_shift_hi = v_shift_5 ;  tmp_gear_cvt_map =  4 ;}
    else if( v_vehicle >= v_shift_3 ){ v_shift_lo = v_shift_3 ; v_shift_hi = v_shift_4 ;  tmp_gear_cvt_map =  3 ;}
    else if( v_vehicle >= v_shift_2 ){ v_shift_lo = v_shift_2 ; v_shift_hi = v_shift_3 ;  tmp_gear_cvt_map =  2 ;}
    else if( v_vehicle >= v_shift_1 ){ v_shift_lo = v_shift_1 ; v_shift_hi = v_shift_2 ;  tmp_gear_cvt_map =  1 ;}
    else                             { v_shift_lo = v_shift_1 ; v_shift_hi = v_shift_1 ;  tmp_gear_cvt_map =  1 ;}
    //=============================================
    if      ( shifter_position == -1 ){
        *virtual_gear_cvt_map = _GrRev;
    }
    else {  //N-Rangeもギヤを算出し、伝達トルクを０に制御する
        if( v_shift_hi == v_shift_lo ){
            *virtual_gear_cvt_map = (float)tmp_gear_cvt_map;
        }
        else {
            *virtual_gear_cvt_map = (float)tmp_gear_cvt_map + ( v_vehicle - v_shift_lo ) / (v_shift_hi - v_shift_lo ); 
        }
    }
}

// =============================================================================
void     TCU_Shift_Schedule(
        //===OUTPUT===
        sshort  *gear_shift_map,    //シフトマップから算出されるギヤ段
        //===INPUT====
        sshort  gear_shift_map_old,//シフトマップから算出されるギヤ段の前回値
        sshort  shifter_position,
        float   accel_position,
        float   v_vehicle,
        schar   flag_cvt_step_shift,
        schar   flag_k0cl_open_req
){
    //-------------------------------------------------------------
    //マップで定められたギヤ段の算出
    //-------------------------------------------------------------
    float v_shift_A9;
    float v_shift_98;
    float v_shift_87;
    float v_shift_76;
    float v_shift_65;
    float v_shift_54;
    float v_shift_43;
    float v_shift_32;
    float v_shift_21;
    float v_shift_9A;
    float v_shift_89;
    float v_shift_78;
    float v_shift_67;
    float v_shift_56;
    float v_shift_45;
    float v_shift_34;
    float v_shift_23;
    float v_shift_12;

    //=============================================
    if( flag_k0cl_open_req ){ // EV走行時
        v_shift_A9 = Table_search_2D(T2D_V_SFT_EV_A9_Y, T2D_V_SFT_EV_A9_X, accel_position, 10);
        v_shift_98 = Table_search_2D(T2D_V_SFT_EV_98_Y, T2D_V_SFT_EV_98_X, accel_position, 10);
        v_shift_87 = Table_search_2D(T2D_V_SFT_EV_87_Y, T2D_V_SFT_EV_87_X, accel_position, 10);
        v_shift_76 = Table_search_2D(T2D_V_SFT_EV_76_Y, T2D_V_SFT_EV_76_X, accel_position, 10);
        v_shift_65 = Table_search_2D(T2D_V_SFT_EV_65_Y, T2D_V_SFT_EV_65_X, accel_position, 10);
        v_shift_54 = Table_search_2D(T2D_V_SFT_EV_54_Y, T2D_V_SFT_EV_54_X, accel_position, 10);
        v_shift_43 = Table_search_2D(T2D_V_SFT_EV_43_Y, T2D_V_SFT_EV_43_X, accel_position, 10);
        v_shift_32 = Table_search_2D(T2D_V_SFT_EV_32_Y, T2D_V_SFT_EV_32_X, accel_position, 10);
        v_shift_21 = Table_search_2D(T2D_V_SFT_EV_21_Y, T2D_V_SFT_EV_21_X, accel_position, 10);
        //=============================================
        v_shift_9A = Table_search_2D(T2D_V_SFT_EV_9A_Y, T2D_V_SFT_EV_9A_X, accel_position, 10);
        v_shift_89 = Table_search_2D(T2D_V_SFT_EV_89_Y, T2D_V_SFT_EV_89_X, accel_position, 10);
        v_shift_78 = Table_search_2D(T2D_V_SFT_EV_78_Y, T2D_V_SFT_EV_78_X, accel_position, 10);
        v_shift_67 = Table_search_2D(T2D_V_SFT_EV_67_Y, T2D_V_SFT_EV_67_X, accel_position, 10);
        v_shift_56 = Table_search_2D(T2D_V_SFT_EV_56_Y, T2D_V_SFT_EV_56_X, accel_position, 10);
        v_shift_45 = Table_search_2D(T2D_V_SFT_EV_45_Y, T2D_V_SFT_EV_45_X, accel_position, 10);
        v_shift_34 = Table_search_2D(T2D_V_SFT_EV_34_Y, T2D_V_SFT_EV_34_X, accel_position, 10);
        v_shift_23 = Table_search_2D(T2D_V_SFT_EV_23_Y, T2D_V_SFT_EV_23_X, accel_position, 10);
        v_shift_12 = Table_search_2D(T2D_V_SFT_EV_12_Y, T2D_V_SFT_EV_12_X, accel_position, 10);
    }
    else {  // ENG走行時
        v_shift_A9 = Table_search_2D(T2D_V_SFT_A9_Y, T2D_V_SFT_A9_X, accel_position, 10);
        v_shift_98 = Table_search_2D(T2D_V_SFT_98_Y, T2D_V_SFT_98_X, accel_position, 10);
        v_shift_87 = Table_search_2D(T2D_V_SFT_87_Y, T2D_V_SFT_87_X, accel_position, 10);
        v_shift_76 = Table_search_2D(T2D_V_SFT_76_Y, T2D_V_SFT_76_X, accel_position, 10);
        v_shift_65 = Table_search_2D(T2D_V_SFT_65_Y, T2D_V_SFT_65_X, accel_position, 10);
        v_shift_54 = Table_search_2D(T2D_V_SFT_54_Y, T2D_V_SFT_54_X, accel_position, 10);
        v_shift_43 = Table_search_2D(T2D_V_SFT_43_Y, T2D_V_SFT_43_X, accel_position, 10);
        v_shift_32 = Table_search_2D(T2D_V_SFT_32_Y, T2D_V_SFT_32_X, accel_position, 10);
        v_shift_21 = Table_search_2D(T2D_V_SFT_21_Y, T2D_V_SFT_21_X, accel_position, 10);
        //=============================================
        v_shift_9A = Table_search_2D(T2D_V_SFT_9A_Y, T2D_V_SFT_9A_X, accel_position, 10);
        v_shift_89 = Table_search_2D(T2D_V_SFT_89_Y, T2D_V_SFT_89_X, accel_position, 10);
        v_shift_78 = Table_search_2D(T2D_V_SFT_78_Y, T2D_V_SFT_78_X, accel_position, 10);
        v_shift_67 = Table_search_2D(T2D_V_SFT_67_Y, T2D_V_SFT_67_X, accel_position, 10);
        v_shift_56 = Table_search_2D(T2D_V_SFT_56_Y, T2D_V_SFT_56_X, accel_position, 10);
        v_shift_45 = Table_search_2D(T2D_V_SFT_45_Y, T2D_V_SFT_45_X, accel_position, 10);
        v_shift_34 = Table_search_2D(T2D_V_SFT_34_Y, T2D_V_SFT_34_X, accel_position, 10);
        v_shift_23 = Table_search_2D(T2D_V_SFT_23_Y, T2D_V_SFT_23_X, accel_position, 10);
        v_shift_12 = Table_search_2D(T2D_V_SFT_12_Y, T2D_V_SFT_12_X, accel_position, 10);
    }
    //=============================================
    if      ( shifter_position == -1 ){
        *gear_shift_map = _GrRev;
    }
    else if ( CONST_CVT ==1 && flag_cvt_step_shift==FALSE ){ //CVTで無段変速させる場合は、gear_shift_mapは1に固定する。
        *gear_shift_map = 1;
    }
    else {  //N-Rangeもギヤを算出し、伝達トルクを０に制御する
        if     ( (gear_shift_map_old<=10 && v_vehicle>=v_shift_9A) || (gear_shift_map_old==10 && v_vehicle>=v_shift_A9) ){ *gear_shift_map = 10; }
        else if( (gear_shift_map_old<=9  && v_vehicle>=v_shift_89) || (gear_shift_map_old>=9  && v_vehicle>=v_shift_98) ){ *gear_shift_map =  9; }
        else if( (gear_shift_map_old<=8  && v_vehicle>=v_shift_78) || (gear_shift_map_old>=8  && v_vehicle>=v_shift_87) ){ *gear_shift_map =  8; }
        else if( (gear_shift_map_old<=7  && v_vehicle>=v_shift_67) || (gear_shift_map_old>=7  && v_vehicle>=v_shift_76) ){ *gear_shift_map =  7; }
        else if( (gear_shift_map_old<=6  && v_vehicle>=v_shift_56) || (gear_shift_map_old>=6  && v_vehicle>=v_shift_65) ){ *gear_shift_map =  6; }
        else if( (gear_shift_map_old<=5  && v_vehicle>=v_shift_45) || (gear_shift_map_old>=5  && v_vehicle>=v_shift_54) ){ *gear_shift_map =  5; }
        else if( (gear_shift_map_old<=4  && v_vehicle>=v_shift_34) || (gear_shift_map_old>=4  && v_vehicle>=v_shift_43) ){ *gear_shift_map =  4; }
        else if( (gear_shift_map_old<=3  && v_vehicle>=v_shift_23) || (gear_shift_map_old>=3  && v_vehicle>=v_shift_32) ){ *gear_shift_map =  3; }
        else if( (gear_shift_map_old<=2  && v_vehicle>=v_shift_12) || (gear_shift_map_old>=2  && v_vehicle>=v_shift_21) ){ *gear_shift_map =  2; }
        else                                                                                                             { *gear_shift_map =  1; }
    }
}

// =============================================================================
void     TCU_Shift_End_Jugdement (
        //===OUTPUT===
        schar   *flag_shift_end_judge,  //変速終了フラグ
        schar   *flag_shift_end_speed,  //回転による変速終了判定フラグ
        float   *t_shift_end,           //変速終了判定タイマー
        //===INPUT====
        schar   flag_shift_end_speed_old,   //回転による変速終了判定フラグ
        float   t_shift_end_old,            //変速終了判定タイマー
        float   r_gearbox_input,
        float   r_gb_input_tg_gear,
        float   rate_torque_phase,
        sshort  gear_shift_kind,
        float   t_shift_period
){
    //-------------------------------------------------------------
    //変速終了判定
    //-------------------------------------------------------------

    sshort i;

    //----------------------------------------------------------
    //回転による変速終了判定
    if( t_shift_period <= CONST_T_SFT_END_EN ){
        *flag_shift_end_speed = FALSE;
    }
    else {
        if      ( gear_shift_kind == _Shift_Up ){
            if ( r_gearbox_input < r_gb_input_tg_gear +  CONST_R_SHIFT_END_UP ){
                *flag_shift_end_speed = TRUE;
            }
            else {
                *flag_shift_end_speed = flag_shift_end_speed_old;
            }
        }
        else if ( gear_shift_kind == _Shift_ND ||  gear_shift_kind == _Shift_NR ){
            if ( r_gearbox_input < r_gb_input_tg_gear +  CONST_R_SHIFT_END_EG ){
                *flag_shift_end_speed = TRUE;
            }
            else {
                *flag_shift_end_speed = flag_shift_end_speed_old;
            }
        }
        else if ( gear_shift_kind==_Shift_TD  ){
            if ( r_gearbox_input > r_gb_input_tg_gear -  CONST_R_SHIFT_END_TD ){
                *flag_shift_end_speed = TRUE;
            }
            else {
                *flag_shift_end_speed = flag_shift_end_speed_old;
            }
        }
        else { /* gear_shift_kind==_Shift_CD   */
            if ( r_gearbox_input > r_gb_input_tg_gear -  CONST_R_SHIFT_END_CD ){
                *flag_shift_end_speed = TRUE;
            }
            else {
                *flag_shift_end_speed = flag_shift_end_speed_old;
            }
        }
    }

    //----------------------------------------------------------
    //変速終了判定タイマー
    if( (*flag_shift_end_speed)==FALSE || rate_torque_phase <1.0f ){
        *t_shift_end = CONST_T_SFT_END_JUDGE;
    }
    else {
        *t_shift_end = F_max( 0.0f, t_shift_end_old-_LoopTime );
    }
    //----------------------------------------------------------
    //変速終了判定
    if( *t_shift_end > 0.0f ){
        *flag_shift_end_judge = FALSE;
    }
    else{
        *flag_shift_end_judge = TRUE ;
    }
}

// =============================================================================
void     TCU_Gear_Target(
        //===OUTPUT===
        sshort  *gear_target,               //目標ギヤ段
        sshort  *gear_before_shift,         //変速前ギヤ段
        float   *virtual_gear_target,       //目標仮想ギヤ段
        float   *virtual_gear_before_shift, //目標仮想ギヤ段
        float   *t_shift_wait,              //変速判定待機時間
        float   *t_shift_period,            //変速制御時間
        float   *t_shift_interval,          //変速間隔
        schar   *flag_shift,                //シフトフラグ
        //===INPUT====
        schar    flag_initialize,
        sshort  gear_before_shift_old,      //変速前ギヤ段
        float   t_shift_wait_old,           //変速判定待機時間
        float   t_shift_period_old,         //変速制御時間
        float   t_shift_interval_old,       //変速間隔
        schar   flag_shift_old,             //シフトフラグ
        sshort  gear_shift_map,
        sshort  gear_shift_map_old,
        schar   flag_load_shift,
        sshort  shifter_position,
        schar   flag_shift_end_judge,
        schar   flag_cvt_step_shift,
        schar   flag_cvt_step_shift_old,
        float   virtual_gear_cvt_map
){
    //-------------------------------------------------------------
    // 目標ギヤ段の決定
    //-------------------------------------------------------------
    sshort i,j;
    sshort  engage_clutch_num;
    sshort  release_clutch_num;
    //-------------------------------------------------------------
    // トルクディマンドシフト時の変速段を確定するタイマ－
    //  最初の変速点を横切ってから所定時間待って、変速段を決定する。
    //-------------------------------------------------------------
    if( gear_shift_map != gear_shift_map_old && flag_shift_old == FALSE && t_shift_wait_old<=0.0f ){
        *t_shift_wait = CONST_T_SHIFT_WAIT;
    }
    else {
        *t_shift_wait = F_max( t_shift_wait_old - _LoopTime, 0.0f );
    }

    //-------------------------------------------------------------
    // ギヤ段の決定
    //-------------------------------------------------------------
    //---------------
    if( flag_initialize ){
        *gear_target = 0;
    }
    else if ( shifter_position == -1 ){ //Reverse
        *gear_target = _GrRev;
    }
    else if ( shifter_position == 0 ){  //Neutral
        *gear_target = 0;
    }
    else if( gear_before_shift_old == _GrRev || gear_before_shift_old == _GrNP){
        // N、RからDシフト時は、シフトマップで定められたギヤ段とする
        *gear_target = gear_shift_map;
    }
    else if ( flag_shift_old == FALSE ){
        //---------------------
        // Up shift
        //---------------------
        if( (gear_shift_map > gear_before_shift_old) && (*t_shift_interval > CONST_T_SHIFT_INTERVAL) ){
            *gear_target =gear_before_shift_old + 1; //アップシフトは1段づつに制限する
        }
        //---------------------
        // Down shift
        //---------------------
        else if( gear_shift_map < gear_before_shift_old ){
            // Torque demand
            if(  flag_load_shift  ){
                if ( *t_shift_wait <= 0.0f ){ //変速段を確定するタイマーが0になったとき
                    // 一度に飛び越せる段数を CONST_SKIP_SHIFT_MAX に制限する
                    if( gear_shift_map < (gear_before_shift_old) - CONST_SKIP_SHIFT_MAX ){
                        j = (gear_before_shift_old) - CONST_SKIP_SHIFT_MAX;
                    }
                    else {
                        j = gear_shift_map;
                    }
                    // 開放クラッチ＝１、締結クラッチ＝１でない段位にはシフトしない
                    if( CONST_CVT>0 ){
                        *gear_target = j; //CVTは除外
                    }
                    else {
                        for( ; j < (gear_before_shift_old) ; j++ ){
                            engage_clutch_num  = 0 ;
                            release_clutch_num = 0 ;
                            for( i = 0 ; i <_MaxCL ; i++ ){
                                if     ( MAT_CL_ENGAGE [i][gear_before_shift_old]==0 && MAT_CL_ENGAGE [i][j] > 0 ){
                                    engage_clutch_num ++ ; //締結クラッチ
                                }
                                if     ( MAT_CL_ENGAGE [i][gear_before_shift_old] >0 && MAT_CL_ENGAGE [i][j] ==0 ){
                                    release_clutch_num ++ ; //解放クラッチ
                                }
                            }
                            if( engage_clutch_num == 1 && release_clutch_num == 1 ){
                                break;
                            }
                        }
                        *gear_target = j;
                    }
                }
                else {;}
            }
            // Coasting down
            else {
                *gear_target =gear_before_shift_old - 1; //コーストダウンは1段づつに制限する
            }
        }
        else {;}
    }

    //-----------------------------------------------
    // シフトフラグ
    //-----------------------------------------------
    if(    ( CONST_CVT == 0 && ( *gear_target != gear_target_old ) )
        || ( CONST_CVT == 1 && flag_cvt_step_shift == TRUE && ( flag_cvt_step_shift_old == FALSE || *gear_target != gear_target_old ) )
    ){
        *flag_shift = TRUE;
    }
    else if( gear_before_shift_old == *gear_target
        ||  t_shift_period_old >= CONST_T_SFT_END_MAX
        || (t_shift_period_old >= CONST_T_SFT_END_MIN && flag_shift_end_judge) ){
        *flag_shift = FALSE;
    }
    else {
        ;
    }
    //-----------------------------------------------
    // 変速タイマー
    //-----------------------------------------------
    if( gear_before_shift_old == *gear_target || *flag_shift == FALSE ){
        *t_shift_period = 0.0f;
    }
    else {
        *t_shift_period = t_shift_period_old + _LoopTime ;
    }

    //-----------------------------------------------
    // 変速間隔タイマー
    //-----------------------------------------------
    if( *flag_shift == TRUE ){
        *t_shift_interval = 0.0f;
    }
    else {
        *t_shift_interval = t_shift_interval_old + _LoopTime ;
    }
    //-----------------------------------------------
    // 変速前ギヤ段
    //-----------------------------------------------
    if( flag_initialize ){
        *gear_before_shift = 0;
    }
    else if( CONST_CVT>0 && flag_cvt_step_shift==TRUE &&  flag_cvt_step_shift_old==FALSE ){
        if( virtual_gear_cvt_map > (float)(*gear_target) ){
            *gear_before_shift  = (sshort) virtual_gear_cvt_map + 1 ;
        }
        else {
            *gear_before_shift  = (sshort) virtual_gear_cvt_map ;
        }
    }
    else if( *flag_shift == FALSE ){
        *gear_before_shift = *gear_target;
    }
    else {;}

    //-----------------------------------------------
    // 仮想ギヤ段（無断変速時は、小数点で表現）
    //-----------------------------------------------
    if( CONST_CVT>0 && flag_cvt_step_shift==FALSE ){
        *virtual_gear_target = virtual_gear_cvt_map;
    }
    else {
        *virtual_gear_target = (float)(*gear_target);
    }
    //-----------------------------------------------
    // 変速前仮想ギヤ段
    //-----------------------------------------------
    if( flag_initialize ){
        *virtual_gear_before_shift = 0.0 ;
    }
    else if( *flag_shift == FALSE ){
        *virtual_gear_before_shift = *virtual_gear_target;
    }
    else {;}
}

// =============================================================================
void    TCU_Gear_Shift_Type (
        //===OUTPUT===
        sshort  *gear_shift_kind,       // 変速種別
        //===INPUT====
        schar   flag_load_shift,
        schar   flag_shift,
        sshort  gear_target,
        sshort  gear_before_shift
){
    //========================================================
    // 変速種別判定
    //  5 : N->R
    //  4 : N->D
    //  3 : Torque demand shift
    //  2 : Coast down shift
    //  1 : Schedule up shift
    //========================================================
    if( flag_shift ){
        if( gear_target == _GrRev ){
            * gear_shift_kind = _Shift_NR ; //N->R
        }
        else if( gear_target>0 && gear_before_shift <=0   ){
            * gear_shift_kind = _Shift_ND ; //N->D
        }
        else if( gear_target > gear_before_shift ){ //upshift
            *gear_shift_kind = _Shift_Up;
        }
        else if( gear_target < gear_before_shift ){ //down shift
            if( flag_load_shift ){
                *gear_shift_kind = _Shift_TD;   //Torq demand
            }
            else {
                *gear_shift_kind = _Shift_CD;   //Coast down
            }
        }
    }
    else {
        *gear_shift_kind = 0;
    }
}

// =============================================================================
void     TCU_Target_Gear_Ratio (
        //===OUTPUT===
        float   *gear_ratio         ,       //目標ギヤレシオ
        float   *gear_ratio_before_shift,   //変速前のギヤレシオ
        float   *gear_ratio_after_shift,    //変速後のギヤレシオ
        float   *r_gb_input_tg_gear,        //目標ギヤ段でのGearBox入力回転（GearBox出力回転から演算)
        //===INPUT====
        float   gear_ratio_old,
        sshort  gear_target,
        sshort  gear_before_shift,
        float   virtual_gear_cvt_map
){
    //-----------------------------------------------
    // 目標ギヤ比の算出
    //-----------------------------------------------
    sshort  tmp_gr_lo_tg;
    sshort  tmp_gr_hi_tg;
    sshort  tmp_gr_lo_bs;
    sshort  tmp_gr_hi_bs;

    tmp_gr_lo_tg = (sshort) virtual_gear_target ;
    tmp_gr_hi_tg = (sshort) virtual_gear_target + 1 ;
    *gear_ratio_after_shift = MAT_TRANS_MGR [ tmp_gr_lo_tg ] - 
            ( MAT_TRANS_MGR [ tmp_gr_lo_tg ] - MAT_TRANS_MGR [ tmp_gr_hi_tg ] ) * ( virtual_gear_target - tmp_gr_lo_tg ) ;

    tmp_gr_lo_bs = (sshort) virtual_gear_before_shift ;
    tmp_gr_hi_bs = (sshort) virtual_gear_before_shift + 1 ;
    *gear_ratio_before_shift = MAT_TRANS_MGR [ tmp_gr_lo_bs ] - 
            ( MAT_TRANS_MGR [ tmp_gr_lo_bs ] - MAT_TRANS_MGR [ tmp_gr_hi_bs ] ) * ( virtual_gear_before_shift - tmp_gr_lo_bs ) ;

    //-------------------------------------
    // Step変速時は目標変速時間で変速させる
    if ( CONST_CVT>0 ){
        if ( flag_cvt_step_shift==TRUE && ( flag_shift==TRUE || flag_cvt_step_shift_old==FALSE ) ){
            *gear_ratio = F_min( F_max( *gear_ratio_before_shift, *gear_ratio_after_shift ),
                              F_max( F_min( *gear_ratio_before_shift, *gear_ratio_after_shift ),
                                 ( (*gear_ratio_after_shift) - (*gear_ratio_before_shift) ) 
                                   * t_shift_period / F_max( t_shift_time_tg, 100.0 ) + (*gear_ratio_before_shift)
                              )
                          );
        }
        else {
            if( gear_ratio_old > *gear_ratio_after_shift){
                *gear_ratio = F_max ( *gear_ratio_after_shift, gear_ratio_old - CONST_CVT_RATIO_CHANGE );
            }
            else {
                *gear_ratio = F_min ( *gear_ratio_after_shift, gear_ratio_old + CONST_CVT_RATIO_CHANGE );
            }
        }
    }
    else {
        *gear_ratio = (*gear_ratio_after_shift);
    }
    //-----------------------------------------------
    // 目標ギヤ段でのGearBox入力回転（GearBox出力回転から演算)
    //-----------------------------------------------
    *r_gb_input_tg_gear = (*gear_ratio_after_shift) * r_gearbox_output ;
}

// =============================================================================
void     TCU_Sub_Gear(
        //===OUTPUT===
        sshort  *gear_sub,          //待機ギヤ段
        sshort  *gear_sub1,         //待機ギヤ段（奇数軸）
        sshort  *gear_sub2,         //待機ギヤ段（偶数軸）
        float   *t_neutral,         //ニュートラル移行タイマ
        sshort  *gear_sub1_tmp,
        sshort  *gear_sub2_tmp,
        //===INPUT====
        sshort  gear_sub1_tmp_old,
        sshort  gear_sub2_tmp_old,
        float   t_neutral_old,
        float   accel_position,
        float   v_vehicle,
        sshort  gear_target,
        sshort  gear_target_old,
        sshort  gear_before_shift,
        sshort  shifter_position,
        schar   flag_shift
){
    //====================================================
    //デュアルクラッチ式トランスミッションの待機ギヤ段の決定
    //====================================================
    float   v_shift_sub_10u;
    float   v_shift_sub_10d;
    float   v_shift_sub_9u ;
    float   v_shift_sub_9d ;
    float   v_shift_sub_8u ;
    float   v_shift_sub_8d ;
    float   v_shift_sub_7u ;
    float   v_shift_sub_7d ;
    float   v_shift_sub_6u ;
    float   v_shift_sub_6d ;
    float   v_shift_sub_5u ;
    float   v_shift_sub_5d ;
    float   v_shift_sub_4u ;
    float   v_shift_sub_4d ;
    float   v_shift_sub_3u ;
    float   v_shift_sub_3d ;
    float   v_shift_sub_2u ;
    float   v_shift_sub_2d ;
    float   v_shift_sub_1u ;
    float   v_shift_sub_1d ;

    //-----------------------------------------
    // 待機ギヤ段の決定
    //-----------------------------------------
    v_shift_sub_10u = Table_search_2D(T2D_V_SGR_10U_Y, T2D_V_SGR_10U_X, accel_position, 10)  ;
    v_shift_sub_10d = Table_search_2D(T2D_V_SGR_10D_Y, T2D_V_SGR_10D_X, accel_position, 10)  ;
    v_shift_sub_9u  = Table_search_2D(T2D_V_SGR_9U_Y , T2D_V_SGR_9U_X , accel_position, 10)  ;
    v_shift_sub_9d  = Table_search_2D(T2D_V_SGR_9D_Y , T2D_V_SGR_9D_X , accel_position, 10)  ;
    v_shift_sub_8u  = Table_search_2D(T2D_V_SGR_8U_Y , T2D_V_SGR_8U_X , accel_position, 10)  ;
    v_shift_sub_8d  = Table_search_2D(T2D_V_SGR_8D_Y , T2D_V_SGR_8D_X , accel_position, 10)  ;
    v_shift_sub_7u  = Table_search_2D(T2D_V_SGR_7U_Y , T2D_V_SGR_7U_X , accel_position, 10)  ;
    v_shift_sub_7d  = Table_search_2D(T2D_V_SGR_7D_Y , T2D_V_SGR_7D_X , accel_position, 10)  ;
    v_shift_sub_6u  = Table_search_2D(T2D_V_SGR_6U_Y , T2D_V_SGR_6U_X , accel_position, 10)  ;
    v_shift_sub_6d  = Table_search_2D(T2D_V_SGR_6D_Y , T2D_V_SGR_6D_X , accel_position, 10)  ;
    v_shift_sub_5u  = Table_search_2D(T2D_V_SGR_5U_Y , T2D_V_SGR_5U_X , accel_position, 10)  ;
    v_shift_sub_5d  = Table_search_2D(T2D_V_SGR_5D_Y , T2D_V_SGR_5D_X , accel_position, 10)  ;
    v_shift_sub_4u  = Table_search_2D(T2D_V_SGR_4U_Y , T2D_V_SGR_4U_X , accel_position, 10)  ;
    v_shift_sub_4d  = Table_search_2D(T2D_V_SGR_4D_Y , T2D_V_SGR_4D_X , accel_position, 10)  ;
    v_shift_sub_3u  = Table_search_2D(T2D_V_SGR_3U_Y , T2D_V_SGR_3U_X , accel_position, 10)  ;
    v_shift_sub_3d  = Table_search_2D(T2D_V_SGR_3D_Y , T2D_V_SGR_3D_X , accel_position, 10)  ;
    v_shift_sub_2u  = Table_search_2D(T2D_V_SGR_2U_Y , T2D_V_SGR_2U_X , accel_position, 10)  ;
    v_shift_sub_2d  = Table_search_2D(T2D_V_SGR_2D_Y , T2D_V_SGR_2D_X , accel_position, 10)  ;
    v_shift_sub_1u  = Table_search_2D(T2D_V_SGR_1U_Y , T2D_V_SGR_1U_X , accel_position, 10)  ;
    v_shift_sub_1d  = Table_search_2D(T2D_V_SGR_1D_Y , T2D_V_SGR_1D_X , accel_position, 10)  ;

    // 待機ギヤ段のニュートラルにするタイマー
    // アクセル開度が所定値以上の時は所定時間経つとニュートラルにする
    if ( gear_target == _GrRev ){
        *t_neutral = 0.0f;      //dummy
    }
    else if  ( gear_target_old    != gear_target
         ||  flag_shift == TRUE
         ||  accel_position < CONST_AP_GEAR_SUB_NEWTRAL  ){
        *t_neutral = MAT_T_GEAR_SUB_NEWTRAL[gear_target];
    }
    else {
        *t_neutral = F_max( t_neutral_old - _LoopTime , 0.0f);
    }

    //偶数段軸のギヤ段（ギヤ段数より大きい場合はNeutral）
    if      ( shifter_position == -1 ){
        (*gear_sub2_tmp) = 0;
    }
    else if ( shifter_position ==  0 ){
        (*gear_sub2_tmp) = 0;
    }
    else {
        if     ( gear_target == 10 || gear_before_shift == 10)              { (*gear_sub2_tmp) = 10; }
        else if( gear_target == 8  || gear_before_shift == 8 )              { (*gear_sub2_tmp) =  8; }
        else if( gear_target == 6  || gear_before_shift == 6 )              { (*gear_sub2_tmp) =  6; }
        else if( gear_target == 4  || gear_before_shift == 4 )              { (*gear_sub2_tmp) =  4; }
        else if( gear_target == 2  || gear_before_shift == 2 )              { (*gear_sub2_tmp) =  2; }
        else if( gear_target == 9  ){
            if     ( gear_sub2_tmp_old >10 || v_vehicle >= v_shift_sub_9u ) { (*gear_sub2_tmp) = 10; }
            else if( gear_sub2_tmp_old < 8 || v_vehicle <  v_shift_sub_9d ) { (*gear_sub2_tmp) =  8; }
        }
        else if( gear_target == 7 ){
            if     ( gear_sub2_tmp_old > 8 || v_vehicle >= v_shift_sub_7u ) { (*gear_sub2_tmp) =  8; }
            else if( gear_sub2_tmp_old < 6 || v_vehicle <  v_shift_sub_7d ) { (*gear_sub2_tmp) =  6; }
        }
        else if( gear_target == 5 ){
            if     ( gear_sub2_tmp_old > 6 || v_vehicle >= v_shift_sub_5u ) { (*gear_sub2_tmp) =  6; }
            else if( gear_sub2_tmp_old < 4 || v_vehicle <  v_shift_sub_5d ) { (*gear_sub2_tmp) =  4; }
        }
        else if( gear_target == 3 ){
            if     ( gear_sub2_tmp_old > 4 || v_vehicle >= v_shift_sub_3u ) { (*gear_sub2_tmp) =  4; }
            else if( gear_sub2_tmp_old < 2 || v_vehicle <  v_shift_sub_3d ) { (*gear_sub2_tmp) =  2; }
        }
        else if( gear_target == 1 ){
            if     ( gear_sub2_tmp_old > 2 || v_vehicle >= v_shift_sub_1u ) { (*gear_sub2_tmp) =  2; }
            else if( gear_sub2_tmp_old < 1 || v_vehicle <  v_shift_sub_1d ) { (*gear_sub2_tmp) =  0; }
        }
        else                                                                { (*gear_sub2_tmp) =  0; }
    }
    if     ( (gear_target & 0x01) == 0) { *gear_sub2 = (*gear_sub2_tmp); } //偶数段はニュートラルにしない
    else if( *t_neutral > 0.0f    )     { *gear_sub2 = (*gear_sub2_tmp); }
    else                                { *gear_sub2 = 0               ; }

    //奇数段軸のギヤ段（ギヤ段数より大きい場合はNeutral）
    if      ( shifter_position == -1 ){
        (*gear_sub1_tmp) = 0;
    }
    else if ( shifter_position ==  0 ){
        (*gear_sub1_tmp) = 0;
    }
    else {
        if     ( gear_target == 9 || gear_before_shift == 9 )               { (*gear_sub1_tmp) =  9; }
        else if( gear_target == 7 || gear_before_shift == 7 )               { (*gear_sub1_tmp) =  7; }
        else if( gear_target == 5 || gear_before_shift == 5 )               { (*gear_sub1_tmp) =  5; }
        else if( gear_target == 3 || gear_before_shift == 3 )               { (*gear_sub1_tmp) =  3; }
        else if( gear_target == 1 || gear_before_shift == 1 )               { (*gear_sub1_tmp) =  1; }
        else if( gear_target == 10 ){
            if     ( gear_sub1_tmp_old >10 || v_vehicle >= v_shift_sub_10u) { (*gear_sub1_tmp) = 11; } //Neutral
            else if( gear_sub1_tmp_old < 8 || v_vehicle <  v_shift_sub_10d) { (*gear_sub1_tmp) =  9; }
        }
        else if( gear_target == 8  ){
            if     ( gear_sub1_tmp_old > 9 || v_vehicle >= v_shift_sub_8u ) { (*gear_sub1_tmp) =  9; }
            else if( gear_sub1_tmp_old < 7 || v_vehicle <  v_shift_sub_8d ) { (*gear_sub1_tmp) =  7; }
        }
        else if( gear_target == 6 ){
            if     ( gear_sub1_tmp_old > 7 || v_vehicle >= v_shift_sub_6u ) { (*gear_sub1_tmp) =  7; }
            else if( gear_sub1_tmp_old < 5 || v_vehicle <  v_shift_sub_6d ) { (*gear_sub1_tmp) =  5; }
        }
        else if( gear_target == 4 ){
            if     ( gear_sub1_tmp_old > 5 || v_vehicle >= v_shift_sub_4u ) { (*gear_sub1_tmp) =  5; }
            else if( gear_sub1_tmp_old < 3 || v_vehicle <  v_shift_sub_4d ) { (*gear_sub1_tmp) =  3; }
        }
        else if( gear_target == 2 ){
            if     ( gear_sub1_tmp_old > 3 || v_vehicle >= v_shift_sub_2u ) { (*gear_sub1_tmp) =  3; }
            else if( gear_sub1_tmp_old < 1 || v_vehicle <  v_shift_sub_2d ) { (*gear_sub1_tmp) =  1; }
        }
        else                                                                { (*gear_sub1_tmp) =  0; }
    }
    if     ( (gear_target & 0x01) >  0 )                        { *gear_sub1 = (*gear_sub1_tmp); } //奇数段はニュートラルにしない
    else if( (*t_neutral > 0.0f) && ((*gear_sub1_tmp) <= 10) )  { *gear_sub1 = (*gear_sub1_tmp); }
    else                                                        { *gear_sub1 = 0               ; }

    // 待機ギヤ段の決定
    if      ( shifter_position == -1 ){
        *gear_sub = 0;
    }
    else if ( shifter_position ==  0 ){
        *gear_sub = 0;
    }
    else {
        if( gear_target & 0x01 ){ *gear_sub = *gear_sub2; }
        else                    { *gear_sub = *gear_sub1; }
    }
}

// =============================================================================
void     TCU_SYNCHORO_STATUS (
        //---OUTPUT---
        schar   *flag_synchro_ready,        // 全シンクロの同期判定
        //---INPUT---
        sshort  gear_target,
        float   f_synchro      [_MaxSyn],
        float   r_synchoro_dif [_MaxSyn]
){
    //-------------------------------------------------------------
    // シンクロ同期判定
    // シンクロが入っていることを確認してからトルクフェイズに移行させるため
    //-------------------------------------------------------------
    sshort i;

    //シンクロ締結指示
//Ver230
//    for( i = 0 ; i <CONST_SYN_NUM ; i++ ){
    for( i = 0 ; i <_MaxSyn ; i++ ){
        if( MAT_SYNCHRO_COM [i][ gear_target ]  >  0
            && (     f_synchro[i] < CONST_F_SYNCHRO
                 ||  F_abs(r_synchoro_dif[i])> CONST_R_SYNCHRO_ENGAGE
                )
        ){
            break;
        }
    }
//    if( i==CONST_SYN_NUM )  { *flag_synchro_ready = TRUE ;}
    if( i==_MaxSyn )  { *flag_synchro_ready = TRUE ;}
    else                    { *flag_synchro_ready = FALSE;}
}

// =============================================================================
void     TCU_Gear_Clutch_Control(
        //===OUTPUT===
        sshort  *gear_cl_com,           //Clutch制御用ギヤ段
        //===INPUT====
        schar    flag_initialize,
        schar   flag_synchro_ready,
        sshort  gear_target,
        sshort  gear_before_shift,
        sshort  gear_shift_kind,
        float   r_gearbox_input,
        float   r_gb_input_tg_gear
){
    //----------------------------------------------------------------------------
    // Clutch制御用ギヤ段 (TorqPhase前で切り替わる)の算出
    //----------------------------------------------------------------------------
    if( flag_initialize ){
        *gear_cl_com = 0;
    }
    else if(  flag_synchro_ready == FALSE ){
        ;       // シンクロが同期するまでは、トルクフェイズに移れない
    }
    else if( gear_target == _GrRev || gear_before_shift==_GrRev ) {
        *gear_cl_com = gear_target;
    }
    else if( gear_shift_kind == _Shift_TD ){
        if( r_gearbox_input >= r_gb_input_tg_gear ){
            *gear_cl_com = gear_target;
        }
        else {;}
    }
    else {
        *gear_cl_com = gear_target;
    }
}

// =============================================================================
void     TCU_Shift_Clutch (
    //-----OUTPUT------
        sshort  *n_engage_clutch,       //締結クラッチ
        sshort  *n_release_clutch,  //解放クラッチ
        //----INPUT-------
        sshort  gear_target,
        sshort  gear_before_shift
){
    //=======================================
    // 締結・解放クラッチの算出
    //=======================================
    sshort i;

    *n_release_clutch = -1;
    for( i = 0 ; i <_MaxCL ; i++ ){
        if     ( MAT_CL_ENGAGE [i][gear_before_shift] >0 && MAT_CL_ENGAGE [i][gear_target]==0 ){
            *n_release_clutch = i; //開放クラッチ
        }
    }

    *n_engage_clutch = -1;
    for( i = 0 ; i <_MaxCL ; i++ ){
        if     ( MAT_CL_ENGAGE [i][gear_before_shift]==0 && MAT_CL_ENGAGE [i][gear_target] >0 ){
            *n_engage_clutch = i; //締結クラッチ
        }
    }
}

// =============================================================================
void    TCU_Shift_Inertia_Torq (
        //-----OUTPUT------
        float *tq_inertia_engage_cl,        // 締結クラッチのイナーシャトルク
        float *tq_inertia_release_cl,       // 解放クラッチのイナーシャトルク
        float *tq_shift_up_reduction_req,   // アップシフト時のトルクリダクション量要求値
        float *tq_shift_up_reduction,       // アップシフト時のトルクリダクション量実行値
        float *tq_eng_shift_up_reduction,   // アップシフト時のエンジントルクリダクション量
        float *tq_p2m_shift_up_reduction,   // アップシフト時のモータトルクリダクション量
        float *t_shift_time_tg,             // 目標変速時間
        float *r_delta_speed,               // 変速前後差回転
        float *tq_inertia,                  // イナーシャトルク
        //----INPUT-------
        schar    flag_initialize,
        sshort  gear_shift_kind,
        sshort  gear_target,
        sshort  gear_target_old,
        sshort  gear_before_shift,
        float   r_p2m,
        float   r_gearbox_input,
        float   r_gb_input_tg_gear,
        float   tq_engine_target,
        float   tq_engine_min_pos,
        schar   flag_k0cl_open_req,
        float   tq_p2m_req
){
    float   inertia_shift;
    float   tq_p2m_min_pos;
    //=================================================
    //変速時のイナーシャトルクの算出
    //=================================================
    if( flag_k0cl_open_req ){
        inertia_shift = CONST_INERTIA_P2M;
    }
    else {
        inertia_shift = CONST_INERTIA_P2M 
        + Table_search_2D(T2D_I_SHIFT_INERTIA_Y, T2D_I_SHIFT_INERTIA_X, (float)gear_before_shift, 12);
    }
    //----------------------------------------------------------
    if( flag_initialize ){
        *r_delta_speed   = 0.0 ;
        *t_shift_time_tg = 0.0 ;
        *tq_inertia      = 0.0 ;
    }
    else if ( gear_target != gear_target_old ){
        // 変速前後の回転数差
        *r_delta_speed = r_gearbox_input - r_gb_input_tg_gear ;
        // 目標変速時間
        if     ( gear_shift_kind ==_Shift_Up ){ //up shift
            *t_shift_time_tg = Table_search_2D(T2D_T_SHIFT_TIME_TG_UP_Y, T2D_T_SHIFT_TIME_TG_UP_X, *r_delta_speed, 5);
        }
        else if( gear_shift_kind ==_Shift_CD ){ //coast down
            *t_shift_time_tg = Table_search_2D(T2D_T_SHIFT_TIME_TG_CD_Y, T2D_T_SHIFT_TIME_TG_CD_X, *r_delta_speed, 5);
        }
        else if( gear_shift_kind ==_Shift_TD ){ //torq demand
            *t_shift_time_tg = Table_search_2D(T2D_T_SHIFT_TIME_TG_TD_Y, T2D_T_SHIFT_TIME_TG_TD_X, *r_delta_speed, 5);
        }
        else {
            *t_shift_time_tg = 0.0f;
        }

        //--------------------------------------------------------
        // イナーシャトルク算出
        //--------------------------------------------------------
        if( (*t_shift_time_tg) == 0.0f ){
            *tq_inertia = 0.0f;
        }
        else {
            *tq_inertia = ( *r_delta_speed / 60.0f * 2.0f * _PI )   //rad
                         / ( (*t_shift_time_tg) /1000.0f )      //sec
                         * inertia_shift;                   //kgm2
        }
    }
    else {;}

    //--------------------------------------------------------
    // アップシフト時、入力トルクを下げて、イナーシャ分を相殺させる
    //--------------------------------------------------------
    // 要求トルクリダクション量
    if     ( gear_shift_kind ==_Shift_Up ){ //up shift
        *tq_shift_up_reduction_req  = *tq_inertia * CONST_RATIO_TQ_REDUCTION;
    }
    else {
        *tq_shift_up_reduction_req  = 0.0;
    }
    //------------------------
    // ENGのトルクリダクション量
    if ( flag_k0cl_open_req ){
            *tq_eng_shift_up_reduction = 0.0;
    }
    else {
        *tq_eng_shift_up_reduction
            = F_min ( *tq_shift_up_reduction_req, (tq_engine_target - tq_engine_min_pos) );
    }
    //------------------------
    // MOTORのトルクリダクション量
    tq_p2m_min_pos = Table_search_2D( T2D_P2M_TQ_SFT_MIN_Y, T2D_P2M_TQ_SFT_MIN_X, r_p2m, 8 );
    *tq_p2m_shift_up_reduction = F_min( (*tq_shift_up_reduction_req) - (*tq_eng_shift_up_reduction), tq_p2m_req - tq_p2m_min_pos );

    //------------------------
    // 実現できるトルクリダクション量
    *tq_shift_up_reduction = (*tq_eng_shift_up_reduction) + (*tq_p2m_shift_up_reduction) ;

    //--------------------------------------------------------
    if     ( gear_shift_kind ==_Shift_Up ){ //up shift
        *tq_inertia_engage_cl  = *tq_inertia - *tq_shift_up_reduction;
        *tq_inertia_release_cl = 0.0f;
    }
    else if( gear_shift_kind ==_Shift_CD ){ //coast down
        *tq_inertia_engage_cl  = -(*tq_inertia);
        *tq_inertia_release_cl = 0.0f;
    }
    else if( gear_shift_kind ==_Shift_TD ){ //torq demand
        *tq_inertia_engage_cl  = CONST_TQ_INERTIA_TD_SHIFT;
        *tq_inertia_release_cl = *tq_inertia;
    }
    else if( gear_shift_kind ==_Shift_ND ){ //ND
        *tq_inertia_engage_cl  = CONST_TQ_ND_ENGAGE;
        *tq_inertia_release_cl = 0.0f;
    }
    else if( gear_shift_kind ==_Shift_NR ){ //NR
        *tq_inertia_engage_cl  = CONST_TQ_NR_ENGAGE;
        *tq_inertia_release_cl = 0.0f;
    }
    else {
        *tq_inertia_engage_cl  = 0.0 ;
        *tq_inertia_release_cl = 0.0 ;
    }
}

// =============================================================================
void     TCU_Torque_Phase (
        //----- output ---------
        float   *rate_torque_phase, //トルクフェイズ進行率
        float   *t_tq_phase,        //トルクフェイズ経過時間
        //----- input ---------
        float   t_tq_phase_old,
        schar   flag_shift,
        sshort  gear_shift_kind,
        sshort  gear_cl_com,
        sshort  gear_target
){
    //========================================
    // トルクレイズの移行レシオの算出
    //========================================
    float    t_target_tq_phase;

    if ( gear_shift_kind == _Shift_ND ){
        t_target_tq_phase = CONST_T_TQ_PHASE_ND;
    }
    else if ( gear_shift_kind == _Shift_NR ){
        t_target_tq_phase = CONST_T_TQ_PHASE_NR;
    }
    else if ( gear_shift_kind == _Shift_Up ){
        t_target_tq_phase = CONST_T_TQ_PHASE_UP;
    }
    else if ( gear_shift_kind==_Shift_TD  ){
        t_target_tq_phase = CONST_T_TQ_PHASE_TD;
    }
    else { /* gear_shift_kind==_Shift_CD   */
        t_target_tq_phase = CONST_T_TQ_PHASE_CD;
    }

    //----------------------------------------
    if( flag_shift && gear_cl_com == gear_target ){
        *t_tq_phase = t_tq_phase_old + _LoopTime;
    }
    else{
        *t_tq_phase = 0.0f;
    }
    *rate_torque_phase = (*t_tq_phase) / t_target_tq_phase;
};

// =============================================================================
void     TCU_Clutch_Control (
        //----- output ---------
        float   tq_clutch_cap_inp[_MaxCL],
        float   *tq_engage_cl_cap,
        float   *tq_release_cl_cap,
        //----- input ---------
        float   tq_gearbox_input,
        float   tq_cl_slip_control,
        float   tq_inertia_engage_cl,
        float   tq_inertia_release_cl,
        float   rate_torque_phase,
        schar   flag_shift,
        sshort  n_engage_clutch,
        sshort  n_release_clutch,
        sshort  gear_cl_com,
        sshort  gear_target,
        schar   flag_engine_idle_control,
        float   tq_cl_creep_cont
){
    sshort i;
    float   tq_engage_cl_cap_tg ;

    //-----------------------------------------------
    // 各クラッチ容量の計算（分担トルク未考慮）
    //-----------------------------------------------
    //締結クラッチ容量
    if( n_engage_clutch < 0 ){
        tq_engage_cl_cap_tg = 0.0f;
    }
    else if( MAT_CL_ENGAGE [n_engage_clutch][gear_target] == 2 && flag_engine_idle_control== TRUE ){
        tq_engage_cl_cap_tg = tq_cl_creep_cont;
    }
    else {
        tq_engage_cl_cap_tg =
                F_max( F_abs( tq_gearbox_input ) + tq_inertia_engage_cl, CONST_TQ_ENGAGE_CL_MIN  );//
    }
    *tq_engage_cl_cap =  F_min(
                            tq_engage_cl_cap_tg,
                            F_max(  F_abs( tq_gearbox_input), CONST_TQ_TQPHASE_MIN ) * rate_torque_phase
                        );

    //解放クラッチ容量
    if( gear_target == gear_cl_com ){ // トルクフェイズ後
        *tq_release_cl_cap = F_max( F_abs( tq_gearbox_input ) - (*tq_engage_cl_cap) , 0.0f );
    }
    else { // トルクフェイズ前
        *tq_release_cl_cap = F_max( F_abs( tq_gearbox_input ) + tq_inertia_release_cl , 0.0f );
    }

    //各クラッチ容量の演算
//Ver230
//    for( i = 0 ; i <CONST_CL_NUM ; i++ ){
    for( i = 0 ; i <_MaxCL ; i++ ){
        if( flag_shift && ( CONST_CVT==0 || (gear_shift_kind == _Shift_ND) || (gear_shift_kind ==_Shift_NR) ) ){
            if( i == n_engage_clutch ){ //
                tq_clutch_cap_inp[i] = (*tq_engage_cl_cap);
            }
            else if( i == n_release_clutch ){ //
                tq_clutch_cap_inp[i] = (*tq_release_cl_cap);
            }
            else if( MAT_CL_ENGAGE [i][gear_target] == 2 ){ // Slip control clutch
                if( flag_engine_idle_control ){
                    tq_clutch_cap_inp[i] = tq_cl_creep_cont;
                }
                else{
                    tq_clutch_cap_inp[i] = F_max( *tq_engage_cl_cap, tq_cl_slip_control );
                }
            }
            else if( MAT_CL_ENGAGE [i][gear_target] == 1 ){ //Engage clutch
                tq_clutch_cap_inp[i] = F_max( (*tq_engage_cl_cap), F_abs(tq_gearbox_input));
            }
            else {
                tq_clutch_cap_inp[i] = 0.0f ;
            }
        }
        else {
            if( MAT_CL_ENGAGE [i][gear_target] == 2 ){ // Slip control clutch
                if( flag_engine_idle_control ){
                    tq_clutch_cap_inp[i] = tq_cl_creep_cont;
                }
                else {
                    tq_clutch_cap_inp[i] = F_max( tq_cl_creep_cont, tq_cl_slip_control );
                }
            }
            else if( MAT_CL_ENGAGE [i][gear_target] == 1 ){ //Engage clutch
                tq_clutch_cap_inp[i] = F_abs(tq_gearbox_input) + CONST_TQ_ENGAGE_CL_MARGIN;
            }
            else {
                tq_clutch_cap_inp[i] = 0.0f;
            }
        }
    }
}

// =============================================================================
void     TCU_Clutch_Torque_Capacity (
        //----- output ---------
        float   *tq_clutch_cap,         //クラッチのトルク容量
        float   *rate_clutch_share,     //分担トルク
        //-------------------------------
        sshort  gear_target,
        sshort  gear_before_shift,
        float   tq_clutch_cap_inp[]
){
    //-------------------------------------------------------------
    // 各クラッチの分担トルクを掛ける
    //-------------------------------------------------------------
    sshort i;

//Ver230
//    for( i=0; i<CONST_CL_NUM; i++){
    for( i=0; i<_MaxCL; i++){
        rate_clutch_share[i] = F_max( MAT_CL_SHARE_RATE[i][gear_target] , MAT_CL_SHARE_RATE[i][gear_before_shift] );
        tq_clutch_cap[i] = rate_clutch_share[i]  * tq_clutch_cap_inp[i] ;
    }
}

// =============================================================================
void     TCU_SYNCHORO_CONTROL (
        //---OUTPUT---
        float   f_synchro     [_MaxSyn],    // シンクロの押し力
        schar   flag_synchro_com [_MaxSyn], // シンクロ締結指示
        //---INPUT---
        float   f_synchro_old [_MaxSyn],
        sshort  gear_target,
        sshort  gear_before_shift,
        sshort  gear_sub1,
        sshort  gear_sub2
){
    //-------------------------------------------------------------
    // シンクロ制御
    //-------------------------------------------------------------
    sshort i;
    schar  flag_synchoro_off;

    //シンクロを操作する前に、他のシンクロが抜けていることを確認する
//Ver230
//    for( i = 0 ; i <CONST_SYN_NUM ; i++ ){
    for( i = 0 ; i <_MaxSyn ; i++ ){
        if (     MAT_SYNCHRO_COM [i][ gear_sub1 ] == 0
             &&  MAT_SYNCHRO_COM [i][ gear_sub2 ] == 0
             && f_synchro[i] > 0.0f
        ){
            break;
        }
    }
//    if( i == CONST_SYN_NUM ){
    if( i == _MaxSyn ){
        flag_synchoro_off = TRUE;
    }
    else{
        flag_synchoro_off = FALSE;
    }

    //シンクロ締結指示
//    for( i = 0 ; i <CONST_SYN_NUM ; i++ ){
    for( i = 0 ; i <_MaxSyn ; i++ ){
        if( (flag_synchoro_off  == TRUE  || f_synchro[i] >0.0f )
             && (MAT_SYNCHRO_COM [i][ gear_sub1 ]  >  0 ||  MAT_SYNCHRO_COM [i][ gear_sub2 ]  >  0 )
        ){
            flag_synchro_com [i] = TRUE;
        }
        else {
            flag_synchro_com [i] = FALSE;
        }
    }

    //シンクロ押し力
//    for( i = 0 ; i <CONST_SYN_NUM ; i++ ){
    for( i = 0 ; i <_MaxSyn ; i++ ){
        if( flag_synchro_com[i] ){
            f_synchro[i] = F_min( CONST_F_SYNCHRO, f_synchro_old[i] + CONST_F_UP_SYNCHRO * _LoopTime / 1000.0f );
        }
        else {
            f_synchro[i] = F_max( 0.0f, f_synchro_old[i] - CONST_F_DOWN_SYNCHRO * _LoopTime / 1000.0f );
        }
    }

}

// =============================================================================
void     TCU_Trans_Fluid_Characteristic (
        //---OUTPUT---
        float   *viscosity_trans_fluid,             // 動粘度 [m2/s]
        float   *density_trans_fluid,               // 密度   [kg/m3]
        //---INPUT---
        float   temp_trans_fluid
){
    //-------------------------------------------------------------
    // Transmission Fluid 特性
    //-------------------------------------------------------------
    //動粘度 m2/s
    *viscosity_trans_fluid  = Table_search_2D( T2D_VISCOSITY_TRANS_FLUED_Y, T2D_VISCOSITY_TRANS_FLUED_X, temp_trans_fluid, 9 );
    //密度 kg/m3
    *density_trans_fluid    = Table_search_2D( T2D_DENSITY_TRANS_FLUED_Y  , T2D_DENSITY_TRANS_FLUED_X  , temp_trans_fluid, 9 );
}

// =============================================================================
void     TCU_Pressure_Line_Control (
        //---OUTPUT---
        float   *p_line,                // ライン圧 [kPa]
        //---INPUT---
        float   tq_gearbox_input,
        sshort  gear_target,
        float   p_pulley_primary,
        float   p_pulley_secoundary
){
    //-------------------------------------------------------------
    // ライン圧制御
    //-------------------------------------------------------------
    *p_line  = F_max ( Table_search_2D( T2D_P_LINE_Y[gear_target], T2D_P_LINE_X[gear_target], tq_gearbox_input, 8 ),
                       F_max( p_pulley_primary , p_pulley_secoundary ) + CONST_P_LINE_MARGIN );
}

// =============================================================================
void     TCU_Pressure_CVT_Pulley (
        //---OUTPUT---
        float   *p_pulley_primary,
        float   *p_pulley_secoundary,
        //---INPUT---
        float   tq_gearbox_input,
        float   r_gearbox_input,
        float   r_gearbox_output,
        float   gear_ratio,
        float   gear_ratio_after_shift,
        float   viscosity_trans_fluid,
        float   density_trans_fluid
){
    //-------------------------------------------------------------
    // CVT 挟圧制御
    //-------------------------------------------------------------
    float x;
    float y;
    float z;

    //--------------------------------
    //セカンダリ油圧
    //      セカンダリ圧Base [kPa]
    x = Table_search_2D( T2DX_PR_PULLEY_SEC_Y, T2DX_PR_PULLEY_SEC_X, tq_gearbox_input, 6 );
    y = Table_search_2D( T2DY_PR_PULLEY_SEC_Y, T2DY_PR_PULLEY_SEC_X, r_gearbox_input , 8 );
    z = Table_search_2D( T2DZ_PR_PULLEY_SEC_Y, T2DZ_PR_PULLEY_SEC_X, gear_ratio, 3 );
    p_pulley_sec_base = Table_search_4D ( T4D_PR_PULLEY_SEC, x, 6, y, 8, z, 3 );
    //      セカンダリ油圧安全率
    x = Table_search_2D( T2DX_FACTOR_SAFETY_SEC_Y, T2DX_FACTOR_SAFETY_SEC_X, gear_ratio, 5 );
    y = Table_search_2D( T2DY_FACTOR_SAFETY_SEC_Y, T2DY_FACTOR_SAFETY_SEC_X, r_gearbox_input , 6 );
    z = Table_search_2D( T2DZ_FACTOR_SAFETY_SEC_Y, T2DZ_FACTOR_SAFETY_SEC_X, viscosity_trans_fluid, 4 );
    factor_safety_pulley_sec = Table_search_4D ( T4D_FACTOR_SAFETY_SEC, x, 5, y, 6, z, 4 );
    //      セカンダリ最低圧[kPa]
    x = Table_search_2D( T2DX_PR_PULLEY_SEC_MIN_Y, T2DX_PR_PULLEY_SEC_MIN_X, gear_ratio, 6 );
    y = Table_search_2D( T2DY_PR_PULLEY_SEC_MIN_Y, T2DX_PR_PULLEY_SEC_MIN_X, r_gearbox_input , 6 );
    z = Table_search_2D( T2DZ_PR_PULLEY_SEC_MIN_Y, T2DX_PR_PULLEY_SEC_MIN_X, viscosity_trans_fluid, 4 );
    p_pulley_sec_min = Table_search_4D ( T4D_PR_PULLEY_SEC_MIN, x, 6, y, 6, z, 4 );
    //      セカンダリ油圧[kPa]
    *p_pulley_secoundary = F_max( p_pulley_sec_base * factor_safety_pulley_sec, p_pulley_sec_min );

    //--------------------------------
    //巻きかけ半径[m]
    radius_pulley_pri = Table_search_2D( T2D_RADIUS_PULLEY_PRI_Y, T2D_RADIUS_PULLEY_PRI_X, gear_ratio_after_shift, 9 );
    radius_pulley_sec = radius_pulley_pri * gear_ratio_after_shift;
    
    //--------------------------------
    //セカンダリクランプ力
    //      OD時の巻きかけ半径 [m]
    radius_pullye_sec_od
        = Table_search_2D( T2D_RADIUS_PULLEY_PRI_Y, T2D_RADIUS_PULLEY_PRI_X, CONST_RATIO_OD, 9 ) * CONST_RATIO_OD;
    //      プーリーストローク（OD基準） [m]
    stroke_pulley_sec = ( radius_pulley_sec - radius_pullye_sec_od ) * CONST_TAN_ANGLE_PULLEY;
    //      SPG力 [N]
    f_spg_pulley_sec = CONST_F_SPG_PULLEY - stroke_pulley_sec * CONST_K_SPG_PULLEY ;
    //      遠心油圧による推力
    f_centrifugal_pr_sec = _PI * density_trans_fluid * F_Pow ( (r_gearbox_output /60.0 * 2 * _PI), 2 )
                                * F_Pow( ( F_Pow(CONST_D1_SYLINDER_SEC/2.0, 2) - F_Pow(CONST_D0_SYLINDER_SEC/2.0, 2) ) , 2) / 4.0;
    //      セカンダリクランプ力[N]
    f_clamp_pully_sec = (*p_pulley_secoundary) * 1000.0 * _PI / 4.0 * ( F_Pow(CONST_D1_SYLINDER_SEC,2) - F_Pow(CONST_D0_SYLINDER_SEC, 2) ) 
                         + f_spg_pulley_sec + f_centrifugal_pr_sec;

    //--------------------------------
    //プライマリクランプ力
    //      トルク比（実トルク／最大伝達可能トルク）
    ratio_variator_cap = tq_gearbox_input * CONST_FACTOR_SAFETY_CLAMP * CONST_COS_ANGLE_PULLEY 
                                                    / ( 2.0 * CONST_MYU_VARIATOR * radius_pulley_pri * f_clamp_pully_sec );
    //      クランプ力比
    x = Table_search_2D( T2DX_RATIO_CLAMP_Y, T2DX_RATIO_CLAMP_X, ratio_variator_cap, 21 );
    y = Table_search_2D( T2DY_RATIO_CLAMP_Y, T2DY_RATIO_CLAMP_X, gear_ratio_after_shift , 5 );
    ratio_pulley_clamp = Table_search_3D( T3D_RATIO_CLAMP, x, 21, y, 5 );
    //      プライマリクランプ力[N]
    f_clamp_pully_pri = f_clamp_pully_sec * ratio_pulley_clamp ;

    //--------------------------------
    //プライマリ油圧
    //      遠心油圧による推力[N]
    f_centrifugal_pr_pri = _PI * density_trans_fluid * F_Pow ( (r_gearbox_input / 60.0 * 2 * _PI), 2 )
                                  * F_Pow( ( F_Pow(CONST_D1_SYLINDER_PRI/2.0, 2) - F_Pow(CONST_D0_SYLINDER_PRI/2.0, 2) ) , 2) / 4.0; //遠心油圧による推力
    //      プライマリ油圧 [kPa]
    *p_pulley_primary = ( f_clamp_pully_pri - f_centrifugal_pr_pri ) 
                          / ( _PI / 4.0 * ( F_Pow(CONST_D1_SYLINDER_PRI,2) - F_Pow(CONST_D0_SYLINDER_PRI, 2) ) ) / 1000.0;

}
// =============================================================================
void     TCU_Acutuator_Control (
        //---OUTPUT---
        float   *i_actuator,            // アクチュエータ消費電流[A]
        //---INPUT---
        sshort  gear_target
){
    //-------------------------------------------------------------
    // トランスミッションアクチュエータ電流制御
    //-------------------------------------------------------------
    *i_actuator = MAT_I_ACTUATOR [gear_target];
}

// =============================================================================
void     TCU_EOP_Control (
        //---OUTPUT---
        float   *i_eop,                 //EOP電流[A}
        //---INPUT---
        float   r_engine,
        float   temp_trans_fluid
){
    //-------------------------------------------------------------
    // 電動オイルポンプ制御
    //-------------------------------------------------------------
    *i_eop  = Table_search_3D(T3D_I_EOP,
                    Table_search_2D(T2DX_I_EOP_Y, T2DX_I_EOP_X, r_engine, 6), 6,
                    Table_search_2D(T2DY_I_EOP_Y, T2DY_I_EOP_X, temp_trans_fluid, 5), 5 );
}

// =============================================================================
void     TCU_Cooler_Flow_Rate_Control (
        //---OUTPUT---
        float   *q_cooler_trans_fluid   ,   // トランスミッションオイル流量
        float   *q_cooler_engine_water  ,   // 冷却水量
        //---INPUT---
        float   temp_trans_fluid
){
    //-------------------------------------------------------------
    // クーラー流量制御
    //-------------------------------------------------------------
    *q_cooler_trans_fluid = Table_search_2D(T2D_Q_TRANS_FLUID_Y, T2D_Q_TRANS_FLUID_X, temp_trans_fluid, 8);
    *q_cooler_engine_water = Table_search_2D(T2D_Q_ENGINE_WATER_Y, T2D_Q_ENGINE_WATER_X, temp_trans_fluid, 8);
}

// =============================================================================
void     TCU_Up_Shift_Torque_Reduction (
        //---OUTPUT---
        schar   *flag_shift_up_tq_request,  //アップシフト時のトルクリダクション実行フラグ
        //---INPUT---
        float    tq_eng_shift_up_reduction,
        sshort  gear_shift_kind,
        sshort  gear_target,
        sshort  gear_before_shift,
        schar   flag_shift,
        float   rate_torque_phase,
        float   r_gb_input_tg_gear,
        float   r_gearbox_input,
        float   tq_engine_min_pos,
        float   tq_inertia_engage_cl
){
    float   r_tq_reduction_off;
    //-------------------------------------------------------------
    // Up Shift時のトルクリダクション
    //-------------------------------------------------------------
    // トルクリダクション復帰回転数
    if      ( gear_before_shift == 1 && gear_target == 2 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_12_Y, T2D_TQ_RED_OFF_12_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 2 && gear_target == 3 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_23_Y, T2D_TQ_RED_OFF_23_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 3 && gear_target == 4 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_34_Y, T2D_TQ_RED_OFF_34_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 4 && gear_target == 5 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_45_Y, T2D_TQ_RED_OFF_45_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 5 && gear_target == 6 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_56_Y, T2D_TQ_RED_OFF_56_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 6 && gear_target == 7 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_67_Y, T2D_TQ_RED_OFF_67_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 7 && gear_target == 8 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_78_Y, T2D_TQ_RED_OFF_78_X, r_gb_input_tg_gear, 5);
    }
    else if ( gear_before_shift == 8 && gear_target == 9 ){
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_89_Y, T2D_TQ_RED_OFF_89_X, r_gb_input_tg_gear, 5);
    }
    else  {/* gear_before_shift == 9 && gear_target == 10 */
        r_tq_reduction_off =  Table_search_2D(T2D_TQ_RED_OFF_9A_Y, T2D_TQ_RED_OFF_9A_X, r_gb_input_tg_gear, 5);
    }
    //--------------------------------------------------------
    // トルクリダクション実行フラグ
    if ( flag_shift == FALSE || r_gearbox_input < r_gb_input_tg_gear + r_tq_reduction_off ){
        *flag_shift_up_tq_request = FALSE;
    }
    else if( rate_torque_phase >=1.0f && gear_shift_kind == _Shift_Up ){
        *flag_shift_up_tq_request = TRUE;
    }
}

// =============================================================================
void     TCU_Engine_Torque_Request (
        //---OUTPUT---
        float   *tq_engine_max_req,         //エンジントルク最大値要求
        float   *tq_engine_min_req,         //エンジントルク最小値要求
        float   *r_engine_target,           //エンジン回転要求
        //---INPUT---
        float   tq_engine_target,
        float   tq_eng_shift_up_reduction,
        schar   flag_shift_up_tq_request,
        schar   flag_k0cl_open_req
){
    //-------------------------------------------------
    // エンジントルク制御要求 (各制御のトルク要求を調停する)
    //-------------------------------------------------
    // エンジントルク制限（トルクリダクション)
    if( (flag_shift_up_tq_request == TRUE) && (flag_k0cl_open_req == FALSE) ){
        *tq_engine_max_req = tq_engine_target - tq_eng_shift_up_reduction;
    }
    else {
        *tq_engine_max_req = 1000.0f ;
    }
    // エンジントルクディマンド要求
    // 制御追加時のために用意しておく
    *tq_engine_min_req = -1000.0f;

    // エンジン回転要求
    // 制御追加時のために用意しておく
    *r_engine_target = -1000.0f;
}

// =============================================================================
void     TCU_Information_For_ECU (
        //---OUTPUT---
        float   *tq_trans_input             ,   // トランスミッション入力軸トルク   [Nm]
        float   *tq_gain_drivetrain         ,   // トランスミッショントルク増幅率
        schar   *flag_lockup                ,   // ロックアップ判定フラグ
        //---INPUT---
        sshort  gear_target,
        schar   flag_engine_idle_control,
        float   tq_torq_converter_input,
        float   tq_cl_creep_cont,
        float   tq_cl_slip_base,
        float   gear_ratio,
        float   torq_ratio_torq_converter
){
    //-------------------------------------------------------------
    // ECUのための情報
    //-------------------------------------------------------------
    //トランスミッション入力軸トルク （Eng負荷補正用）
    if( flag_engine_idle_control ){
        *tq_trans_input = tq_torq_converter_input + tq_cl_creep_cont;
    }
    else {
        *tq_trans_input = tq_torq_converter_input + tq_cl_slip_base;
    }
    //トランスミッショントルク増幅率（ MTR × FGR × トルコントルク比）
    *tq_gain_drivetrain = gear_ratio * CONST_FGR * torq_ratio_torq_converter;

    // ロックアップ判定（Transmissionが、Eng回転を制御する）
    *flag_lockup = (!flag_engine_idle_control);
}
// =============================================================================
void     TCU_Disconnect_Clutch_Control(
        //---OUTPUT---
        float   *tq_k0_clutch_cap,      // Disconnect clutch(K0) トルク容量
        sshort  *status_k0_clutch,      // Disconnect clutch(K0) 締結状態 0=開放 1=Slip 2=CLose
        //---INPUT---
        schar   flag_k0cl_open_req, // Disconnect clutch(K0) 開放要求
        float   r_engine,               // エンジン回転
        float   r_starting_device_input,// Starting Device 入力回転
        float   tq_engine_target,       // 目標エンジントルク
        schar    flag_initialize
){
    if ( flag_initialize ){
        *tq_k0_clutch_cap = 0.0 ;
    }
    
    if( flag_k0cl_open_req == TRUE ){
        *status_k0_clutch = 0;
    }
    else if ( ( r_engine < F_max( r_gb_input_tg_gear, r_engine_idle ) + CONST_R_K0_CLOSE  ) && ( *status_k0_clutch < 2 ) ){
        *status_k0_clutch = 1;
    }
    else {
        *status_k0_clutch = 2;
    }
    //---------------------------------------
    if( *status_k0_clutch == 0 ){
        *tq_k0_clutch_cap = 0.0 ;
    }
    else if( *status_k0_clutch == 1 ){
        *tq_k0_clutch_cap = CONST_TQ_K0_ENG_START;
    }
    else {
        *tq_k0_clutch_cap = F_max( F_min( (*tq_k0_clutch_cap) + CONST_TQ_K0_CLOSE , 1000.0), CONST_TQ_K0_ENG_START);
    }
}

// =============================================================================
void     TCU_P2_Motor_Control(
        //---OUTPUT---
        float   *tq_p2m_target,         // P2 Motor目標トルク
        //---INPUT---
        sshort  status_k0_clutch,
        schar   flag_shift_up_tq_request,
        float   tq_starting_device_input,
        float   tq_p2m_req,
        float   r_engine,
        float   tq_p2m_shift_up_reduction
){
    if( status_k0_clutch == 1 ){
        *tq_p2m_target = tq_starting_device_input + CONST_TQ_K0_ENG_START;
    }
    else {
        if ( flag_shift_up_tq_request == TRUE ){
            *tq_p2m_target = tq_p2m_req - tq_p2m_shift_up_reduction;
        }
        else { 
            *tq_p2m_target = tq_p2m_req ;
        }
    }
}

// =============================================================================
void    TCU_Torque_Input_Starting_Device(
        //-----OUTPUT------
        float   *tq_starting_device_input,      // 発進デバイス入力トルク
        //----INPUT-------
        float   tq_engine_target,
        float   tq_p2m_target
){
    //========================================
    // GearBox入力トルクの算出
    //========================================
    *tq_starting_device_input = tq_engine_target + tq_p2m_req;
}
// =============================================================================
