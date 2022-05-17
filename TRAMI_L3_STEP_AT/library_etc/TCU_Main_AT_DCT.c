#include "TRAMI_Standard_AT_Strategy_v230.c"

void TCU_Main_AT_DCT(
	//output
	double Out_tau_clutch_cap[12],			   // x1
	double Out_f_synchro_n[11],                // x2
	double *Out_p_line_pa,                     // x3
	double *Out_i_actuator_ampere,             // x4
	double *Out_i_eop_ampere,                  // x5
	double *Out_qv_cooler_trans_fluid_m3ps,    // x6
	double *Out_qv_cooler_eng_water_m3ps,      // x7
	double *Out_tau_engine_max_req,            // x8
	double *Out_tau_engine_min_req,            // x9
	double *Out_w_engine_target_radps,         // x10
	double *Out_tau_trans_input,               // x11
	double *Out_trans_gear_ratio,              // x12
	double *Out_flag_trans_lock_up,            // x13
	//Input
	double IN_flag_initialize,                 // z1
	double IN_w_gearbox_input_radps,           // z2
	double IN_w_gearbox_output_radps,          // z3
	const double IN_w_synchoro_dif_radps[11],  // z4
	double IN_t_trans_fluid_k,                 // z5
	double IN_t_engine_water_k,                // z6
	double IN_accel_position_per,              // z7
	double IN_trans_shifter_position,          // z8
	double IN_v_vehicle_mps,                   // z9
	double IN_tau_brake,                       // z10
	double IN_w_engine_radps,                  // z11
	double IN_w_engine_idle_radps,             // z12
	double IN_tau_engine_target,               // z13
	double IN_tau_engine,                      // z14
	double IN_tau_engine_min_pos,              // z15
	double IN_tau_engine_max_pos               // z16
){
	//----------------------------------------------------------
	// ���[�J���ϐ��錾
	//----------------------------------------------------------
	int  i ;//���[�v�Ɋ��p

	//out�p���[�J���ϐ�
	float Lo_trans_gear          				; // 1
	float Lo_trans_gear_ratio					; // 2. �M����
	float Lo_tau_clutch_cap		[12]			; // 3.  �e�N���b�`�̃g���N�e��[Nm]
	float Lo_f_synchro_n		[11]			; // 4.  �V���N���̑����[N]
	float Lo_tau_k0_clutch_cap   				; // 5
	float Lo_tau_p2m_target      				; // 6
	float Lo_p_line_pa							; // 7.  ���C����[Pa]
	float Lo_p_pulley_pri_pa     				; // 8
	float Lo_p_pulley_sec_pa     				; // 9
	float Lo_i_actuator_ampere					; // 10.  �A�N�`���G�[�^�d��[A]
	float Lo_i_eop_ampere						; // 11.  �d���I�C���|���v�d��[A]
	float Lo_qv_cooler_trans_fluid_m3ps			; // 12  �N�[���[��ATF����	[m3/s]
	float Lo_qv_cooler_eng_water_m3ps			; // 13  �N�[���[�̗�p������[m3/s]
	float Lo_trans_torq_gain 					; // 14
	signed char  Lo_flag_trans_shift    		; // 15
	float Lo_tau_engine_max_req					; // 16.  �G���W���g���N���_�N�V�����v��	[Nm]
	float Lo_tau_engine_min_req					; // 17.  �G���W���g���N�A�b�v�v��	[Nm]
	float Lo_w_engine_target_radps				; // 18. �G���W����]�v���l	[rad/s]
	float Lo_tau_trans_input					; // 19. �g�����X�~�b�V�������͎��g���N	[Nm]
	signed char  Lo_flag_trans_lock_up			; // 20.
	
	//Observation�p���[�J���ϐ�
	float Lo_obs_tcu[10]					; //

	//Input�p���[�J���ϐ�
	signed char  Lo_flag_initialize			; // 0
	float Lo_w_starting_device_input_radps	; // 1
	float Lo_w_gearbox_input_radps			; // 2
	float Lo_w_gearbox_output_radps			; // 3
	float Lo_w_synchoro_dif_radps[11]		; // 4
	float Lo_t_trans_fluid_k				; // 5
	float Lo_t_engine_water_k				; // 6
	float Lo_v_vehicle_mps					; // 7
	float Lo_tau_brake						; // 8
	float Lo_accel_position_per				; // 9
	signed short Lo_trans_shifter_position	; // 10
	float Lo_w_engine_radps					; // 11
	float Lo_w_engine_idle_radps			; // 12
	float Lo_tau_engine_target				; // 13
	float Lo_tau_engine						; // 14
	float Lo_tau_engine_min_pos				; // 15
	float Lo_tau_engine_max_pos				; // 16
	float Lo_tau_p2m_req                  	; // 17
	float Lo_flag_k0_clutch_open          	; // 18
	signed short Lo_drive_mode   			; // 19

	//----------------------------------------------------------
	// �v�����g -> ����󂯓n��
	//----------------------------------------------------------
	//�^�̃L���X�g
	Lo_flag_initialize 					= (char)IN_flag_initialize			; // 0
	Lo_w_starting_device_input_radps 	= (float)IN_w_engine_radps			; // 1 �ǉ����ꂽ����(ENG��]�����)
	Lo_w_gearbox_input_radps 			= (float)IN_w_gearbox_input_radps	; // 2
	Lo_w_gearbox_output_radps 			= (float)IN_w_gearbox_output_radps	; // 3

	for(i = 0;i < 11;i++ ){
		Lo_w_synchoro_dif_radps[i] 		= (float)IN_w_synchoro_dif_radps[i]	; // 4
	}

	Lo_t_trans_fluid_k 		= (float)IN_t_trans_fluid_k				; // 5
	Lo_t_engine_water_k 	= (float)IN_t_engine_water_k			; // 6
	Lo_v_vehicle_mps 		= (float)IN_v_vehicle_mps				; // 7
	Lo_tau_brake 			= (float)IN_tau_brake					; // 8
	Lo_accel_position_per 	= (float)IN_accel_position_per			; // 9
	Lo_trans_shifter_position = (short)IN_trans_shifter_position	; // 10
	Lo_w_engine_radps 		= (float)IN_w_engine_radps				; // 11
	Lo_w_engine_idle_radps 	= (float)IN_w_engine_idle_radps			; // 12
	Lo_tau_engine_target 	= (float)IN_tau_engine_target			; // 13
	Lo_tau_engine			= (float)IN_tau_engine					; // 14
	Lo_tau_engine_min_pos 	= (float)IN_tau_engine_min_pos			; // 15
	Lo_tau_engine_max_pos 	= (float)IN_tau_engine_max_pos			; // 16

	Lo_tau_p2m_req          = 0 									; // 17 HEV�p�ɒǉ����ꂽ�ϐ��̏��u
	Lo_flag_k0_clutch_open  = 0 									; // 18 HEV�p�ɒǉ����ꂽ�ϐ��̏��u
	Lo_drive_mode           = 0 									; // 19 HEV�p�ɒǉ����ꂽ�ϐ��̏��u

	//---------------------------------------------------------------------------------

	TCU_Main(
										//	//--------------  Output ------------------
										//	// Transmission plant
		&Lo_trans_gear					,	//	float	*trans_gear						,	// 1.  �ڕW�M���i
		&Lo_trans_gear_ratio			,	//	float	*trans_gear_ratio				,	// 2.  �M����
		Lo_tau_clutch_cap				,	//	float	tau_clutch_cap	[_MaxCL]		,	// 3.  �e�N���b�`�̃g���N�e��			[Nm]
		Lo_f_synchro_n					,	//	float	f_synchro_n		[_MaxSyn]		,	// 4.  �V���N���̑���� 				[N]
		&Lo_tau_k0_clutch_cap			,	//	float	*tau_k0_clutch_cap				,	// 5.  Disconnect clutch �g���N�e�� 	[Nm]
		&Lo_tau_p2m_target				,	//	float	*tau_p2m_target					,	// 6.  (P2)Motore�ڕW�g���N				[Nm]
		&Lo_p_line_pa					,	//	float	*p_line_pa						,	// 7.  ���C����							[Pa]
		&Lo_p_pulley_pri_pa				,	//	float	*p_pulley_pri_pa				,	// 8.  CVT�v���C�}����					[Pa]
		&Lo_p_pulley_sec_pa				,	//	float	*p_pulley_sec_pa				,	// 9.  CVT�Z�J���_����					[Pa]
		&Lo_i_actuator_ampere			,	//	float	*i_actuator_ampere				,	// 10. �A�N�`���G�[�^�d��				[A]
		&Lo_i_eop_ampere				,	//	float	*i_eop_ampere					,	// 11. �d���I�C���|���v�d��				[A]
		&Lo_qv_cooler_trans_fluid_m3ps	,	//	float	*qv_cooler_trans_fluid_m3ps		,	// 12. �N�[���[��ATF����				[m3/s]
		&Lo_qv_cooler_eng_water_m3ps	,	//	float	*qv_cooler_eng_water_m3ps		,	// 13. �N�[���[�̗�p������				[m3/s]
											//	//  Driver Model
		&Lo_trans_torq_gain				,	//	float	*trans_torq_gain				,	// 14. �g�����X�~�b�V�����g���N������
		&Lo_flag_trans_shift			,	//	schar	*flag_trans_shift				,	// 15. �V�t�g�t���O
										//	// ECU
		&Lo_tau_engine_max_req			,	//	float	*tau_engine_max_req				,	// 16. �G���W���g���N���_�N�V�����v��		[Nm]
		&Lo_tau_engine_min_req			,	//	float	*tau_engine_min_req				,	// 17. �G���W���g���N�A�b�v�v��			[Nm]
		&Lo_w_engine_target_radps		,	//	float	*w_engine_target_radps			,	// 18. �G���W����]�v���l				[rad/s]
		&Lo_tau_trans_input				,	//	float	*tau_trans_input				,	// 19. �g�����X�~�b�V�������̓g���N		[Nm]
		&Lo_flag_trans_lock_up			,	//	schar	*flag_trans_lock_up				,	// 20. ���b�N�A�b�v����
										//	//--------------  Input ------------------
		Lo_flag_initialize				,	//	schar	flag_initialize					,	// 0.  �C�j�V�����C�Y�v��
										//	// Transmission Plant
		Lo_w_starting_device_input_radps,	//	float	w_starting_device_input_radps	,	// 1.  Starting device input speed		[rad/s]
		Lo_w_gearbox_input_radps		,	//	float	w_gearbox_input_radps			,	// 2.  Gearbox input speed				[rad/s]
		Lo_w_gearbox_output_radps		,	//	float	w_gearbox_output_radps			,	// 3.  Gearbox output speed				[rad/s]
		Lo_w_synchoro_dif_radps			,	//	float	w_synchoro_dif_radps[_MaxSyn]	,	// 4.  �e�V���N������]					[rad/s]
		Lo_t_trans_fluid_k				,	//	float	t_trans_fluid_k					,	// 5.  �g�����X�~�b�V��������				[K]
		Lo_t_engine_water_k				,	//	float	t_engine_water_k				,	// 6.  Eng.��p����						[K]
										//	// Vehicle Plant
		Lo_v_vehicle_mps				,	//	float	v_vehicle_mps					,	// 7.  �ԑ�								[m/s]
		Lo_tau_brake					,	//	float	tau_brake						,	// 8.  �u���[�L�g���N					[Nm]
										//	// Driver Model
		Lo_accel_position_per			,	//	float	accel_position_per				,	// 9.  �A�N�Z���J�x						[%]
		Lo_trans_shifter_position		,	//	sshort	trans_shifter_position			,	// 10.  �V�t�^�[�ʒu (Rev=-1; N=0 ; D=1)
										//	// ECU
		Lo_w_engine_radps				,	//	float	w_engine_radps					,	// 11. Engine��]						[rad/s]
		Lo_w_engine_idle_radps			,	//	float	w_engine_idle_radps				,	// 12. Engine�ڕW�A�C�h����]			[rad/s]
		Lo_tau_engine_target			,	//	float	tau_engine_target				,	// 13. Engine�ڕW�g���N					[Nm]
		Lo_tau_engine					,	//	float	tau_engine 						,	// 14. Engine�g���N						[Nm]
		Lo_tau_engine_min_pos			,	//	float	tau_engine_min_pos				,	// 15. Eng.�o�͉\�ŏ��g���N			[Nm]
		Lo_tau_engine_max_pos			,	//	float	tau_engine_max_pos				,	// 16. Eng.�o�͉\�ŏ��g���N			[Nm]
										//	// VCU
		Lo_tau_p2m_req					,	//	float	tau_p2m_req						,	// 17. (P2)Motore�v���g���N				[Nm]
		Lo_flag_k0_clutch_open			,	//	schar	flag_k0_clutch_open				,	// 18. Disconnect clutch �J���v��(0=Open: 1=Close)
		Lo_drive_mode					,	//	sshort	drive_mode						,	// 19. �h���C�u���[�h(0=EV : 1= HEV : 2=Power mode)
										//	//--------------  observation-------------
		Lo_obs_tcu							//	float	obs_tcu[10]							// ������ԗʊϑ��p
	) ;


	//----------------------------------------------------------
	// ���� ---> �v�����g�󂯓n��
	//----------------------------------------------------------
	//double�^�֌^�ϊ����s���AOutput�����֓n��

	//*Out_trans_gear					= (double)Lo_trans_gear				; // 1. �ڕW�M���i
	*Out_trans_gear_ratio 			= (double)Lo_trans_gear_ratio			; // 2. �M����								(x12)
	for(i = 0;i < 12 ; i++){
      Out_tau_clutch_cap[i]			= (double)Lo_tau_clutch_cap[i]			; // 3. �e�N���b�`�̃g���N�e��[Nm]			(x1)
    }
	for(i = 0;i < 11 ; i++){
		Out_f_synchro_n[i] 			= (double)Lo_f_synchro_n[i]				; // 4. �V���N���̑���� [N]				(x2)
	}
	//*Out_tau_k0_clutch_cap			= (double)Lo_tau_k0_clutch_cap			; // 5. Disconnect clutch �g���N�e�� [Nm]
	//*Out_tau_p2m_target				= (double)Lo_tau_p2m_target				; // 6. (P2)Motore�ڕW�g���N [Nm]
	*Out_p_line_pa					= (double)Lo_p_line_pa					; // 7.  ���C���� [Pa]						(x3)
	//*Out_p_pulley_pri_pa			= (double)Lo_p_pulley_pri_pa			; // 8.  CVT�v���C�}���� [Pa]
	//*Out_p_pulley_sec_pa			= (double)Lo_p_pulley_sec_pa			; // 9.  CVT�Z�J���_����	[Pa]
	*Out_i_actuator_ampere			= (double)Lo_i_actuator_ampere			; // 10. �A�N�`���G�[�^�d�� [A]				(x4)
	*Out_i_eop_ampere				= (double)Lo_i_eop_ampere				; // 11. �d���I�C���|���v�d�� [A]			(x5)
	*Out_qv_cooler_trans_fluid_m3ps	= (double)Lo_qv_cooler_trans_fluid_m3ps	; // 12. �N�[���[��ATF���� [m3/s]			(x6)
	*Out_qv_cooler_eng_water_m3ps	= (double)Lo_qv_cooler_eng_water_m3ps	; // 13. �N�[���[�̗�p������ [m3/s]		(x7)
	//*Out_trans_torq_gain			= (double)Lo_trans_torq_gain			; // 14. �g�����X�~�b�V�����g���N������
	//*Out_flag_trans_shift			= (double)Lo_flag_trans_shift			; // 15. �V�t�g�t���O
	*Out_tau_engine_max_req			= (double)Lo_tau_engine_max_req			; // 16. �G���W���g���N���_�N�V�����v�� [Nm]	(x8)
	*Out_tau_engine_min_req			= (double)Lo_tau_engine_min_req			; // 17. �G���W���g���N�A�b�v�v�� [Nm]		(x9)
	*Out_w_engine_target_radps		= (double)Lo_w_engine_target_radps		; // 18. �G���W����]�v���l [rad/s]			(x10)
	*Out_tau_trans_input			= (double)Lo_tau_trans_input			; // 19. �g�����X�~�b�V�������̓g���N[Nm]		(x11)
	*Out_flag_trans_lock_up			= (double)Lo_flag_trans_lock_up			; // 20. ���b�N�A�b�v����						(x13)
}
