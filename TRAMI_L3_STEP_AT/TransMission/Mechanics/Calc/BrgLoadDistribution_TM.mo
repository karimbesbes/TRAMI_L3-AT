within TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc;
model BrgLoadDistribution_TM
  //入力:各ギアで発生するスラスト荷重(N)
  Modelica.Blocks.Interfaces.RealInput P1sKa annotation (
    Placement(visible = true, transformation(origin = {-480, 180}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, 310}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P1rKa annotation (
    Placement(visible = true, transformation(origin = {-480, 150}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, 230}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P2sKa annotation (
    Placement(visible = true, transformation(origin = {-480, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, 130}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P2rKa annotation (
    Placement(visible = true, transformation(origin = {-480, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P3sKa annotation (
    Placement(visible = true, transformation(origin = {-480, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, -52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P3rKa annotation (
    Placement(visible = true, transformation(origin = {-480, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, -132}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P4sKa annotation (
    Placement(visible = true, transformation(origin = {-480, -90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, -230}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P4rKa annotation (
    Placement(visible = true, transformation(origin = {-480, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-180, -310}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  //出力:各SNベアリングへの荷重(N)
  //    F_SN1[1] → ラジアル荷重
  //    F_SN1[2] → スラスト荷重
  Modelica.Blocks.Interfaces.RealOutput F_SN1[2] annotation (
    Placement(visible = true, transformation(origin = {470, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 270}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput F_SN2[2] annotation (
    Placement(visible = true, transformation(origin = {470, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput F_SN3[2] annotation (
    Placement(visible = true, transformation(origin = {470, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput F_SN5[2] annotation (
    Placement(visible = true, transformation(origin = {470, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput F_SN6[2] annotation (
    Placement(visible = true, transformation(origin = {470, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput F_SN7[2] annotation (
    Placement(visible = true, transformation(origin = {470, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput F_SN8[2] annotation (
    Placement(visible = true, transformation(origin = {470, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput F_SN9[2] annotation (
    Placement(visible = true, transformation(origin = {470, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput F_SN10[2] annotation (
    Placement(visible = true, transformation(origin = {470, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput F_SN11[2] annotation (
    Placement(visible = true, transformation(origin = {470, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {170, -270}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (
    Placement(visible = true, transformation(origin = {-376, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation (
    Placement(visible = true, transformation(origin = {306, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap1(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
    Placement(visible = true, transformation(origin = {-320, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap2_3(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
    Placement(visible = true, transformation(origin = {-220, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap5(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap6(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap7(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap8_9_10(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
    Placement(visible = true, transformation(origin = {180, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Mechanics.ElastoGap elastoGap11(Coeff = 1e6, c = 1e8, d = 1e5, n = 1, s_rel0 = 0) annotation (
    Placement(visible = true, transformation(origin = {280, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass P1Sun(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {-280, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass P2Ring_P3Sun_P4Sun(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {-180, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass P1Ring(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass P2Sun(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass P3Ring(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass P4Ring(m = 0.1, s(fixed = true, start = 0), v(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {220, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor SN1 annotation (
    Placement(visible = true, transformation(origin = {-350, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor SN2_3 annotation (
    Placement(visible = true, transformation(origin = {-250, -6.66134e-16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor SN5 annotation (
    Placement(visible = true, transformation(origin = {-150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor SN6 annotation (
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor SN7 annotation (
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor SN8_9_10 annotation (
    Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor SN11 annotation (
    Placement(visible = true, transformation(origin = {250, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force P1SunKa annotation (
    Placement(visible = true, transformation(origin = {-320, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force P2RingP3SunP4SunKa annotation (
    Placement(visible = true, transformation(origin = {-220, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force P1RingP2CarrierKa annotation (
    Placement(visible = true, transformation(origin = {-120, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force P2SunKa annotation (
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force P3RingKa annotation (
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force P4RingKa annotation (
    Placement(visible = true, transformation(origin = {170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.MultiSum multiSum(nu = 3) annotation (
    Placement(visible = true, transformation(origin = {-260, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex21 annotation (
    Placement(visible = true, transformation(origin = {410, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex22 annotation (
    Placement(visible = true, transformation(origin = {410, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex23 annotation (
    Placement(visible = true, transformation(origin = {410, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex24 annotation (
    Placement(visible = true, transformation(origin = {410, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex25 annotation (
    Placement(visible = true, transformation(origin = {410, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex26 annotation (
    Placement(visible = true, transformation(origin = {410, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex27 annotation (
    Placement(visible = true, transformation(origin = {410, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex28 annotation (
    Placement(visible = true, transformation(origin = {410, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex29 annotation (
    Placement(visible = true, transformation(origin = {410, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex210 annotation (
    Placement(visible = true, transformation(origin = {410, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = 0) annotation (
    Placement(visible = true, transformation(origin = {310, -206}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(SN6.flange_b, elastoGap6.flange_a) annotation (
    Line(points = {{-40, 0}, {-30, 0}}, color = {0, 127, 0}));
  connect(elastoGap6.flange_b, P2Sun.flange_a) annotation (
    Line(points = {{-10, 0}, {10, 0}}, color = {0, 127, 0}));
  connect(P2Sun.flange_b, SN7.flange_a) annotation (
    Line(points = {{30, 0}, {40, 0}}, color = {0, 127, 0}));
  connect(elastoGap7.flange_b, P3Ring.flange_a) annotation (
    Line(points = {{90, 0}, {110, 0}}, color = {0, 127, 0}));
  connect(SN8_9_10.flange_b, elastoGap8_9_10.flange_a) annotation (
    Line(points = {{160, 0}, {170, 0}}, color = {0, 127, 0}));
  connect(SN5.flange_b, elastoGap5.flange_a) annotation (
    Line(points = {{-140, 0}, {-130, 0}}, color = {0, 127, 0}));
  connect(elastoGap5.flange_b, P1Ring.flange_a) annotation (
    Line(points = {{-110, 0}, {-90, 0}}, color = {0, 127, 0}));
  connect(P1Ring.flange_b, SN6.flange_a) annotation (
    Line(points = {{-70, 0}, {-60, 0}}, color = {0, 127, 0}));
  connect(P2Ring_P3Sun_P4Sun.flange_b, SN5.flange_a) annotation (
    Line(points = {{-170, 0}, {-160, 0}}, color = {0, 127, 0}));
  connect(SN2_3.flange_b, elastoGap2_3.flange_a) annotation (
    Line(points = {{-240, 0}, {-230, 0}}, color = {0, 127, 0}));
  connect(P1Sun.flange_b, SN2_3.flange_a) annotation (
    Line(points = {{-270, 0}, {-260, 0}}, color = {0, 127, 0}));
  connect(elastoGap1.flange_b, P1Sun.flange_a) annotation (
    Line(points = {{-310, 0}, {-290, 0}}, color = {0, 127, 0}));
  connect(SN1.flange_b, elastoGap1.flange_a) annotation (
    Line(points = {{-340, 0}, {-330, 0}}, color = {0, 127, 0}));
  connect(fixed.flange, SN1.flange_a) annotation (
    Line(points = {{-376, 0}, {-360, 0}}, color = {0, 127, 0}));
  connect(P4Ring.flange_b, SN11.flange_a) annotation (
    Line(points = {{230, 0}, {240, 0}}, color = {0, 127, 0}));
  connect(SN11.flange_b, elastoGap11.flange_a) annotation (
    Line(points = {{260, 0}, {270, 0}}, color = {0, 127, 0}));
  connect(elastoGap11.flange_b, fixed1.flange) annotation (
    Line(points = {{290, 0}, {306, 0}}, color = {0, 127, 0}));
  connect(P4RingKa.flange, P4Ring.flange_a) annotation (
    Line(points = {{180, 50}, {200, 50}, {200, 0}, {210, 0}}, color = {0, 127, 0}));
  connect(P3RingKa.flange, P3Ring.flange_a) annotation (
    Line(points = {{80, 70}, {100, 70}, {100, 0}, {110, 0}}, color = {0, 127, 0}));
  connect(P2SunKa.flange, P2Sun.flange_a) annotation (
    Line(points = {{-20, 90}, {0, 90}, {0, 0}, {10, 0}}, color = {0, 127, 0}));
  connect(P1RingP2CarrierKa.flange, P1Ring.flange_a) annotation (
    Line(points = {{-110, 110}, {-100, 110}, {-100, 0}, {-90, 0}}, color = {0, 127, 0}));
  connect(P2RingP3SunP4SunKa.flange, P2Ring_P3Sun_P4Sun.flange_a) annotation (
    Line(points = {{-210, 130}, {-200, 130}, {-200, 0}, {-190, 0}}, color = {0, 127, 0}));
  connect(P1SunKa.flange, P1Sun.flange_a) annotation (
    Line(points = {{-310, 150}, {-300, 150}, {-300, 0}, {-290, 0}}, color = {0, 127, 0}));
  connect(P4rKa, P4RingKa.f) annotation (
    Line(points = {{-480, -120}, {-420, -120}, {-420, 50}, {158, 50}}, color = {0, 0, 127}));
  connect(P3rKa, P3RingKa.f) annotation (
    Line(points = {{-480, -30}, {-430, -30}, {-430, 70}, {58, 70}}, color = {0, 0, 127}));
  connect(P1sKa, P1SunKa.f) annotation (
    Line(points = {{-480, 180}, {-420, 180}, {-420, 150}, {-332, 150}}, color = {0, 0, 127}));
  connect(multiSum.y, P2RingP3SunP4SunKa.f) annotation (
    Line(points = {{-248, 130}, {-232, 130}}, color = {0, 0, 127}));
  connect(P1rKa, P1RingP2CarrierKa.f) annotation (
    Line(points = {{-480, 150}, {-430, 150}, {-430, 110}, {-132, 110}}, color = {0, 0, 127}));
  connect(P2sKa, P2SunKa.f) annotation (
    Line(points = {{-480, 90}, {-42, 90}}, color = {0, 0, 127}));
  connect(P2rKa, multiSum.u[1]) annotation (
    Line(points = {{-480, 60}, {-440, 60}, {-440, 130}, {-270, 130}}, color = {0, 0, 127}));
  connect(P3sKa, multiSum.u[2]) annotation (
    Line(points = {{-480, 0}, {-440, 0}, {-440, 130}, {-270, 130}}, color = {0, 0, 127}));
  connect(P4sKa, multiSum.u[3]) annotation (
    Line(points = {{-480, -90}, {-440, -90}, {-440, 130}, {-270, 130}}, color = {0, 0, 127}));
  connect(SN7.f, multiplex26.u1[1]) annotation (
    Line(points = {{42, -11}, {42, -74}, {398, -74}}, color = {0, 0, 127}));
  connect(SN6.f, multiplex25.u1[1]) annotation (
    Line(points = {{-58, -11}, {-58, -60}, {370, -60}, {370, -44}, {398, -44}}, color = {0, 0, 127}));
  connect(SN5.f, multiplex24.u1[1]) annotation (
    Line(points = {{-158, -11}, {-158, -48}, {360, -48}, {360, -14}, {398, -14}}, color = {0, 0, 127}));
  connect(SN1.f, multiplex21.u1[1]) annotation (
    Line(points = {{-358, -11}, {-358, -29.5}, {340, -29.5}, {340, 76}, {398, 76}}, color = {0, 0, 127}));
  connect(multiplex210.y, F_SN11) annotation (
    Line(points = {{421, -200}, {470, -200}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex29.y, F_SN10) annotation (
    Line(points = {{421, -170}, {470, -170}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex28.y, F_SN9) annotation (
    Line(points = {{421, -140}, {470, -140}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex27.y, F_SN8) annotation (
    Line(points = {{421, -110}, {470, -110}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex26.y, F_SN7) annotation (
    Line(points = {{421, -80}, {470, -80}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex25.y, F_SN6) annotation (
    Line(points = {{421, -50}, {470, -50}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex24.y, F_SN5) annotation (
    Line(points = {{421, -20}, {470, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex23.y, F_SN3) annotation (
    Line(points = {{421, 10}, {470, 10}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex22.y, F_SN2) annotation (
    Line(points = {{421, 40}, {470, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex21.y, F_SN1) annotation (
    Line(points = {{421, 70}, {470, 70}}, color = {0, 0, 127}, thickness = 0.5));
  connect(SN7.flange_b, elastoGap7.flange_a) annotation (
    Line(points = {{60, 0}, {70, 0}}, color = {0, 127, 0}));
  connect(P3Ring.flange_b, SN8_9_10.flange_a) annotation (
    Line(points = {{130, 0}, {140, 0}}, color = {0, 127, 0}));
  connect(elastoGap2_3.flange_b, P2Ring_P3Sun_P4Sun.flange_a) annotation (
    Line(points = {{-210, 0}, {-190, 0}}, color = {0, 127, 0}));
  connect(elastoGap8_9_10.flange_b, P4Ring.flange_a) annotation (
    Line(points = {{190, 0}, {210, 0}}, color = {0, 127, 0}));
  connect(SN2_3.f, multiplex23.u1[1]) annotation (
    Line(points = {{-258, -10}, {-258, -40}, {350, -40}, {350, 16}, {398, 16}}, color = {0, 0, 127}));
  connect(SN2_3.f, multiplex22.u1[1]) annotation (
    Line(points = {{-258, -10}, {-258, -40}, {350, -40}, {350, 46}, {398, 46}}, color = {0, 0, 127}));
  connect(SN8_9_10.f, multiplex29.u1[1]) annotation (
    Line(points = {{142, -10}, {142, -84}, {350, -84}, {350, -164}, {398, -164}}, color = {0, 0, 127}));
  connect(const3.y, multiplex210.u2[1]) annotation (
    Line(points = {{321, -206}, {398, -206}}, color = {0, 0, 127}));
  connect(const3.y, multiplex29.u2[1]) annotation (
    Line(points = {{321, -206}, {380, -206}, {380, -176}, {398, -176}}, color = {0, 0, 127}));
  connect(const3.y, multiplex28.u2[1]) annotation (
    Line(points = {{321, -206}, {380, -206}, {380, -146}, {398, -146}}, color = {0, 0, 127}));
  connect(const3.y, multiplex27.u2[1]) annotation (
    Line(points = {{321, -206}, {380, -206}, {380, -116}, {398, -116}}, color = {0, 0, 127}));
  connect(const3.y, multiplex25.u2[1]) annotation (
    Line(points = {{321, -206}, {380, -206}, {380, -56}, {398, -56}}, color = {0, 0, 127}));
  connect(const3.y, multiplex26.u2[1]) annotation (
    Line(points = {{321, -206}, {380, -206}, {380, -86}, {398, -86}}, color = {0, 0, 127}));
  connect(const3.y, multiplex24.u2[1]) annotation (
    Line(points = {{321, -206}, {380, -206}, {380, -26}, {398, -26}}, color = {0, 0, 127}));
  connect(const3.y, multiplex23.u2[1]) annotation (
    Line(points = {{321, -206}, {380, -206}, {380, 4}, {398, 4}}, color = {0, 0, 127}));
  connect(const3.y, multiplex22.u2[1]) annotation (
    Line(points = {{321, -206}, {380, -206}, {380, 34}, {398, 34}}, color = {0, 0, 127}));
  connect(const3.y, multiplex21.u2[1]) annotation (
    Line(points = {{321, -206}, {380, -206}, {380, 64}, {398, 64}}, color = {0, 0, 127}));
  connect(SN8_9_10.f, multiplex28.u1[1]) annotation (
    Line(points = {{142, -10}, {142, -84}, {350, -84}, {350, -134}, {398, -134}}, color = {0, 0, 127}));
  connect(SN8_9_10.f, multiplex27.u1[1]) annotation (
    Line(points = {{142, -10}, {142, -84}, {350, -84}, {350, -104}, {398, -104}}, color = {0, 0, 127}));
  connect(SN11.f, multiplex210.u1[1]) annotation (
    Line(points = {{242, -10}, {242, -94}, {340, -94}, {340, -194}, {398, -194}}, color = {0, 0, 127}));
  annotation (
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-460, -240}, {460, 240}})),
    Icon(coordinateSystem(extent = {{-160, -360}, {160, 360}}, initialScale = 0.1), graphics = {Rectangle(origin = {40, 0}, extent = {{-200, 360}, {120, -360}}), Text(origin = {-26, 5}, extent = {{28, 85}, {186, 5}}, textString = "SN1"), Text(origin = {24, 387}, extent = {{-164, -47}, {-44, -187}}, textString = "P1K"), Text(origin = {22, 203}, extent = {{-162, -43}, {-42, -183}}, textString = "P2K"), Text(origin = {24, 27}, extent = {{-164, -47}, {-44, -187}}, textString = "P3K"), Text(origin = {24, -153}, extent = {{-164, -47}, {-44, -187}}, textString = "P4K"), Text(origin = {-26, -95}, extent = {{28, 85}, {186, 5}}, textString = "SN11"), Text(origin = {-10, -57}, extent = {{12, 85}, {170, 25}}, textString = "～"), Text(origin = {2, -374}, lineColor = {0, 0, 255}, extent = {{-282, 14}, {278, -46}}, textString = "%name")}),
    version = "");
end BrgLoadDistribution_TM;
