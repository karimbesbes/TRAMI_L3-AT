within TRAMI_L3_STEP_AT.Vehicle;
model EngineController
  parameter Real Target_Idle_Speed = 650;
  Modelica.Blocks.Sources.Constant targetIdleSpeed(k = Target_Idle_Speed) annotation (
    Placement(visible = true, transformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation (
    Placement(visible = true, transformation(origin = {-52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput accel_position_per annotation (
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput accel_position_per1 annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Neng annotation (
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation (
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation (
    Placement(visible = true, transformation(origin = {-62, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain P_gain(k = 1) annotation (
    Placement(visible = true, transformation(origin = {14, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Max max annotation (
    Placement(visible = true, transformation(origin = {-20, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_engine_idle_radps annotation (
    Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation (
    Placement(visible = true, transformation(origin = {46, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput flag_trans_lock_up annotation (
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(product.y, add.u2) annotation (
    Line(points = {{58, -12}, {62, -12}, {62, -6}, {68, -6}, {68, -6}}, color = {0, 0, 127}));
  connect(P_gain.y, product.u1) annotation (
    Line(points = {{26, -6}, {34, -6}, {34, -6}, {34, -6}}, color = {0, 0, 127}));
  connect(flag_trans_lock_up, product.u2) annotation (
    Line(points = {{-120, -80}, {24, -80}, {24, -18}, {34, -18}, {34, -18}}, color = {0, 0, 127}));
  connect(max.y, P_gain.u) annotation (
    Line(points = {{-9, -6}, {1, -6}, {1, -6}, {1, -6}}, color = {0, 0, 127}));
  connect(feedback1.y, max.u1) annotation (
    Line(points = {{-42, 0}, {-32, 0}}, color = {0, 0, 127}));
  connect(const.y, max.u2) annotation (
    Line(points = {{-51, -60}, {-40, -60}, {-40, -12}, {-32, -12}}, color = {0, 0, 127}));
  connect(accel_position_per, add.u1) annotation (
    Line(points = {{-120, 80}, {56, 80}, {56, 6}, {68, 6}}, color = {0, 0, 127}));
  connect(Neng, feedback1.u2) annotation (
    Line(points = {{-120, -40}, {-52, -40}, {-52, -8}}, color = {0, 0, 127}));
  connect(targetIdleSpeed.y, w_engine_idle_radps) annotation (
    Line(points = {{-90, 0}, {-74, 0}, {-74, 70}, {110, 70}, {110, 70}}, color = {0, 0, 127}));
  connect(targetIdleSpeed.y, feedback1.u1) annotation (
    Line(points = {{-91, 0}, {-60, 0}}, color = {0, 0, 127}));
  connect(add.y, accel_position_per1) annotation (
    Line(points = {{91, 0}, {110, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Text(origin = {-33, 37}, extent = {{-47, 19}, {121, -93}}, textString = "Idle Speed Controller"), Rectangle(extent = {{-100, 100}, {100, -100}})}),
    Diagram,
    __OpenModelica_commandLineOptions = "",
    uses(Modelica(version = "3.2.3")));
end EngineController;
