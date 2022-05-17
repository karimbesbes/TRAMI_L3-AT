within TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc;
model BrgLoadDistribution_DF_A1A2
  //入力1:HYP歯面荷重(N)
  //     GearLoad[1] → Fxp
  //     GearLoad[2] → Fyp
  //     GearLoad[3] → Fzp
  Modelica.Blocks.Interfaces.RealInput GearLoad[3] annotation (
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  //入力2:油温(degC)
  Modelica.Blocks.Interfaces.RealInput Toil annotation (
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  //出力1:AGB1への荷重(N)
  //     F_AGB1[1] → ラジアル荷重
  //     F_AGB1[2] → スラスト荷重
  Modelica.Blocks.Interfaces.RealOutput F_AGB1[2] annotation (
    Placement(visible = true, transformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  //出力2:AGB2への荷重(N)
  //     F_AGB2[1] → ラジアル荷重
  //     F_AGB2[2] → スラスト荷重
  Modelica.Blocks.Interfaces.RealOutput F_AGB2[2] annotation (
    Placement(visible = true, transformation(origin = {-110, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  //入力パラメータ
  parameter Real a, b;
  parameter Real D;
  parameter Real alpha_AGB1, alpha_AGB2;
  parameter Real beta_AGB1, beta_AGB2;
  parameter Real Y1, Y2;
  //ローカル変数
  Real Fxp, Fyp, Fzp;
  Real Fr_AGB1, Fr_AGB2;
  Real Fth_AGB1, Fth_AGB2;
  Real Fth_out;
  Real Fpre_AGB1, Fpre_AGB2;
  Real Cond1, Cond2;
equation
  // 入力
  Fxp = GearLoad[1];
  Fyp = GearLoad[2];
  Fzp = GearLoad[3];
  // ギヤで発生するラジアル荷重計算
  Fr_AGB1 = sqrt((b / a * Fzp) ^ 2 + (b / a * Fyp - D / (2 * a) * Fxp) ^ 2);
  Fr_AGB2 = sqrt(((a + b) / a * Fzp) ^ 2 + ((a + b) / a * Fyp - D / (2 * a) * Fxp) ^ 2);
  // ギヤで発生するスラスト荷重計算（誘起スラストなし、ARG2 → ARG1 が正）
  Fth_out = Fxp;
  // BRGの受け持ちスラスト荷重計算（誘起スラスト考慮）
  Fpre_AGB1 = alpha_AGB1 * Toil + beta_AGB1;
  Fpre_AGB2 = alpha_AGB2 * Toil + beta_AGB2;
  Cond1 = (1 + tanh(0.5 * (Fr_AGB2 / Y2 - Fr_AGB1 / Y1) - Fth_out)) / 2;
  Cond2 = 1 - Cond1;
  Fth_AGB1 = Cond1 * (0.5 * Fr_AGB2 / Y2 - Fth_out + Fpre_AGB1) + Cond2 * (0.5 * Fr_AGB1 / Y1 + Fpre_AGB1);
  Fth_AGB2 = Cond1 * (0.5 * Fr_AGB2 / Y2 + Fpre_AGB2) + Cond2 * (0.5 * Fr_AGB1 / Y1 + Fth_out + Fpre_AGB2);
  // BRG1へ出力
  F_AGB1[1] = Fr_AGB1;
  F_AGB1[2] = Fth_AGB1;
  // BRG2へ出力
  F_AGB2[1] = Fr_AGB2;
  F_AGB2[2] = Fth_AGB2;
  annotation (
    Icon(graphics = {Rectangle(origin = {-88, 90}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 10}, {188, -190}}), Polygon(points = {{-10, 40}, {-10, -40}, {10, -20}, {10, 20}, {-10, 40}}), Polygon(origin = {40, -30}, points = {{-50, -10}, {50, -10}, {30, 10}, {-30, 10}, {-50, -10}}), Rectangle(origin = {-24, -2}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 22}, {-2, -18}}), Rectangle(origin = {-72, -2}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 22}, {-2, -18}}), Polygon(origin = {-32, -27}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, points = {{-2, 5}, {-2, -5}, {-6, -5}, {0, -15}, {6, -5}, {2, -5}, {2, 5}, {-2, 5}}), Polygon(origin = {-80, -27}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, points = {{-2, 5}, {-2, -5}, {-6, -5}, {0, -15}, {6, -5}, {2, -5}, {2, 5}, {-2, 5}}), Polygon(origin = {-54, -31}, rotation = 270, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, points = {{-2, 11}, {-2, -5}, {-6, -5}, {0, -15}, {6, -5}, {2, -5}, {2, 11}, {-2, 11}}), Text(origin = {-23, 9}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {-23, -17}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {-71, 9}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {-71, -17}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Line(origin = {38.01, 9.95}, points = {{-130, -10}, {-30, -10}}, pattern = LinePattern.DashDot), Rectangle(origin = {38, 26}, rotation = 270, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 22}, {0, -18}}), Text(origin = {35, 29}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Rectangle(origin = {38, -70}, rotation = 270, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-16, 22}, {-2, -18}}), Line(origin = {58.33, 29.95}, points = {{-18, 30}, {-18, -110}}, pattern = LinePattern.DashDot), Text(origin = {63, 29}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {35, -65}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Text(origin = {63, -65}, extent = {{-15, 11}, {-3, -3}}, textString = "+"), Polygon(origin = {4, -39}, lineColor = {255, 85, 0}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Solid, points = {{-2, 13}, {-2, -9}, {-6, -9}, {0, -15}, {6, -9}, {2, -9}, {2, 13}, {-2, 13}}), Polygon(origin = {0, -15}, rotation = 200, lineColor = {255, 85, 0}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Solid, points = {{-2, 13}, {-2, -9}, {-6, -9}, {0, -15}, {6, -9}, {2, -9}, {2, 13}, {-2, 13}}), Polygon(origin = {-8, -27}, rotation = 270, lineColor = {255, 85, 0}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Solid, points = {{-2, 13}, {-2, -9}, {-6, -9}, {0, -15}, {6, -9}, {2, -9}, {2, 13}, {-2, 13}}), Text(origin = {0, -124}, lineColor = {0, 0, 255}, extent = {{-180, 24}, {180, -16}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end BrgLoadDistribution_DF_A1A2;
