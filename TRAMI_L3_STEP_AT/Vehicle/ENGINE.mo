within TRAMI_L3_STEP_AT.Vehicle;
model ENGINE
  constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter String Engile_Trq_Map = "ENGINE_TRQ_MAP.txt";
  parameter String Engine_Trq_Table = "ENGINE_TRQ_MAP";
  Modelica.Blocks.Tables.CombiTable2D ENGINE_TROQUE_MAP(fileName = currDir + "/Tables/" + Engile_Trq_Map, smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = Engine_Trq_Table, tableOnFile = true, verboseRead = true) annotation (
    Placement(visible = true, transformation(origin = {-56, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput accel_position_per1 annotation (
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-94, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Math.Gain rpm(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {64, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(limitsAtInit = true, uMax = 6300, uMin = 0) annotation (
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_ENG_PNT_radps annotation (
    Placement(visible = true, transformation(origin = {100, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {90, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput tau_engine_target annotation (
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(limitsAtInit = true, uMax = 1000, uMin = -1000) annotation (
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.001, initType = Modelica.Blocks.Types.Init.InitialState, k = 1, y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {66, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ENGINE_TROQUE_MAP.y, limiter2.u) annotation (
    Line(points={{-45,66},{-20,66},{-20,-20},{18,-20},{18,-20}},            color = {0, 0, 127}));
  connect(firstOrder1.y, tau_engine_target) annotation (
    Line(points={{77,-20},{92,-20},{92,-20},{100,-20}},          color = {0, 0, 127}));
  connect(limiter2.y, firstOrder1.u) annotation (
    Line(points={{41,-20},{54,-20},{54,-20},{54,-20}},          color = {0, 0, 127}));
  connect(w_ENG_PNT_radps, rpm.u) annotation (
    Line(points = {{100, 20}, {76, 20}}, color = {0, 0, 127}));
  connect(limiter1.y, ENGINE_TROQUE_MAP.u1) annotation (
    Line(points = {{19, 20}, {0, 20}, {0, 92}, {-80, 92}, {-80, 72}, {-68, 72}}, color = {0, 0, 127}));
  connect(rpm.y, limiter1.u) annotation (
    Line(points = {{53, 20}, {42, 20}}, color = {0, 0, 127}));
  connect(accel_position_per1, ENGINE_TROQUE_MAP.u2) annotation (
    Line(points = {{-100, 60}, {-68, 60}, {-68, 60}, {-68, 60}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Rectangle(origin = {9, 2}, fillColor = {255, 255, 255},
            fillPattern =                                                                  FillPattern.Solid, extent = {{-89, 98}, {71, -102}}), Rectangle(origin = {3, 48}, fillColor = {176, 176, 176},
            fillPattern =                                                                                                                                                                                               FillPattern.Solid, extent = {{-43, 38}, {37, -46}}), Rectangle(origin = {2, 39}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-26, 35}, {24, -37}}), Rectangle(origin = {0, 34}, fillColor = {0, 85, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-24, 14}, {26, -14}}), Ellipse(origin = {1, 21}, lineColor = {117, 117, 117}, fillColor = {117, 117, 117},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-5, 5}, {5, -5}}, endAngle = 360), Ellipse(origin = {-31, -37},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-21, 23}, {55, -55}}, endAngle = 360), Rectangle(origin = {6, -57}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-20, 45}, {18, -35}}), Ellipse(origin = {-19, -49}, lineColor = {117, 117, 117}, fillColor = {117, 117, 117},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-7, 7}, {15, -15}}, endAngle = 360), Polygon(origin = {17, -20}, lineColor = {117, 117, 117}, fillColor = {117, 117, 117},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-11, 42}, {23, -30}, {3, -42}, {-21, 40}, {-13, 42}, {-11, 42}}), Polygon(origin = {2, -53}, lineColor = {117, 117, 117}, fillColor = {117, 117, 117},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-16, 11}, {26, 11}, {24, -11}, {-16, -11}, {-16, 11}}), Ellipse(origin = {25, -49}, lineColor = {117, 117, 117}, fillColor = {117, 117, 117},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-7, 7}, {15, -15}}, endAngle = 360), Ellipse(origin = {-25, -43},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{5, -5}, {15, -15}}, endAngle = 360), Ellipse(origin = {19, -43},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{3, -3}, {15, -15}}, endAngle = 360), Ellipse(origin = {-7, 29},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{5, -5}, {11, -11}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)));
end ENGINE;
