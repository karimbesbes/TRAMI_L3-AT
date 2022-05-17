within TRAMI_L3_STEP_AT.Control;
model MultiSignal_Input
  Modelica.Blocks.Interfaces.RealInput flag_initialize annotation (
    Placement(visible = true, transformation(origin = {-120, 204}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex5 multiplex51(n1 = 5, n2 = 5, n3 = 5, n4 = 5, n5 = 5) annotation (
    Placement(visible = true, transformation(origin = {40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex5 multiplex52 annotation (
    Placement(visible = true, transformation(origin = {0, 162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex5 multiplex53 annotation (
    Placement(visible = true, transformation(origin = {0, 136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex5 multiplex54 annotation (
    Placement(visible = true, transformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex5 multiplex55 annotation (
    Placement(visible = true, transformation(origin = {0, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex5 multiplex56 annotation (
    Placement(visible = true, transformation(origin = {0, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y[26] annotation (
    Placement(visible = true, transformation(origin = {110, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v_vehicle_mps annotation (
    Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_engine_radps annotation (
    Placement(visible = true, transformation(origin = {-120, -84}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_engine annotation (
    Placement(visible = true, transformation(origin = {-120, -168}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -220}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_engine_target annotation (
    Placement(visible = true, transformation(origin = {-120, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput accel_position_per annotation (
    Placement(visible = true, transformation(origin = {-120, 24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_brake annotation (
    Placement(visible = true, transformation(origin = {-120, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_gearbox_input_radps annotation (
    Placement(visible = true, transformation(origin = {-120, 176}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 260}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_gearbox_output_radps annotation (
    Placement(visible = true, transformation(origin = {-120, 148}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 220}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput TinOil_K annotation (
    Placement(visible = true, transformation(origin = {-120, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_engine_idle_radps annotation (
    Placement(visible = true, transformation(origin = {-120, -112}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Gain rpm2radps(k = 2 * Modelica.Constants.pi / 60) annotation (
    Placement(visible = true, transformation(origin = {-70, -112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput t_engine_water_k annotation (
    Placement(visible = true, transformation(origin = {-120, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput trans_shifter_position annotation (
    Placement(visible = true, transformation(origin = {-120, -4}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_engine_min_pos annotation (
    Placement(visible = true, transformation(origin = {-120, -196}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -260}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_engine_max_pos annotation (
    Placement(visible = true, transformation(origin = {-120, -224}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 200) annotation (
    Placement(visible = true, transformation(origin = {-50, 136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex2(n1 = 25, n2 = 1) annotation (
    Placement(visible = true, transformation(origin = {80, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const.y, multiplex54.u3[1]) annotation (
    Line(points = {{-39, 136}, {-22, 136}, {-22, 110}, {-12, 110}}, color = {0, 0, 127}));
  connect(const.y, multiplex54.u2[1]) annotation (
    Line(points = {{-39, 136}, {-22, 136}, {-22, 116}, {-12, 116}, {-12, 115}}, color = {0, 0, 127}));
  connect(const.y, multiplex54.u1[1]) annotation (
    Line(points = {{-39, 136}, {-22, 136}, {-22, 120}, {-12, 120}}, color = {0, 0, 127}));
  connect(const.y, multiplex53.u5[1]) annotation (
    Line(points = {{-39, 136}, {-22, 136}, {-22, 126}, {-12, 126}}, color = {0, 0, 127}));
  connect(const.y, multiplex53.u4[1]) annotation (
    Line(points = {{-39, 136}, {-22, 136}, {-22, 130}, {-12, 130}, {-12, 131}}, color = {0, 0, 127}));
  connect(const.y, multiplex53.u3[1]) annotation (
    Line(points = {{-39, 136}, {-12, 136}}, color = {0, 0, 127}));
  connect(const.y, multiplex53.u2[1]) annotation (
    Line(points = {{-39, 136}, {-22, 136}, {-22, 142}, {-12, 142}, {-12, 141}}, color = {0, 0, 127}));
  connect(const.y, multiplex53.u1[1]) annotation (
    Line(points = {{-39, 136}, {-22, 136}, {-22, 146}, {-12, 146}}, color = {0, 0, 127}));
  connect(const.y, multiplex52.u5[1]) annotation (
    Line(points = {{-39, 136}, {-22, 136}, {-22, 152}, {-12, 152}}, color = {0, 0, 127}));
  connect(const.y, multiplex52.u4[1]) annotation (
    Line(points = {{-39, 136}, {-22, 136}, {-22, 158}, {-12, 158}, {-12, 157}}, color = {0, 0, 127}));
  connect(rpm2radps.u, w_engine_idle_radps) annotation (
    Line(points = {{-82, -112}, {-112, -112}, {-112, -112}, {-120, -112}}, color = {0, 0, 127}));
  connect(multiplex56.y, multiplex51.u5) annotation (
    Line(points = {{11, 58}, {16, 58}, {16, 100}, {28, 100}}, color = {0, 0, 127}));
  connect(multiplex55.y, multiplex51.u4) annotation (
    Line(points = {{11, 84}, {13.5, 84}, {13.5, 106}, {28, 106}, {28, 105}}, color = {0, 0, 127}));
  connect(multiplex54.y, multiplex51.u3) annotation (
    Line(points = {{11, 110}, {28, 110}}, color = {0, 0, 127}));
  connect(multiplex53.y, multiplex51.u2) annotation (
    Line(points = {{11, 136}, {14, 136}, {14, 114}, {28, 114}, {28, 115}}, color = {0, 0, 127}));
  connect(multiplex52.y, multiplex51.u1) annotation (
    Line(points = {{11, 162}, {16, 162}, {16, 120}, {28, 120}}, color = {0, 0, 127}));
  connect(multiplex54.u4[1], const.y) annotation (
    Line(points = {{-12, 105}, {-22, 105}, {-22, 136}, {-39, 136}}, color = {0, 0, 127}));
  connect(multiplex2.y, y) annotation (
    Line(points={{91,90},{104,90},{104,88},{110,88}},          color = {0, 0, 127}, thickness = 0.5));
  connect(tau_engine_max_pos, multiplex2.u2[1]) annotation (
    Line(points = {{-120, -224}, {60, -224}, {60, 84}, {68, 84}, {68, 84}}, color = {0, 0, 127}));
  connect(multiplex51.y, multiplex2.u1) annotation (
    Line(points={{51,110},{60,110},{60,96},{68,96},{68,96}},            color = {0, 0, 127}, thickness = 0.5));
  connect(w_gearbox_output_radps, multiplex52.u3[1]) annotation (
    Line(points = {{-120, 148}, {-70, 148}, {-70, 162}, {-12, 162}, {-12, 162}}, color = {0, 0, 127}));
  connect(w_gearbox_input_radps, multiplex52.u2[1]) annotation (
    Line(points={{-120,176},{-70,176},{-70,166},{-12,166},{-12,167}},            color = {0, 0, 127}));
  connect(flag_initialize, multiplex52.u1[1]) annotation (
    Line(points = {{-120, 204}, {-66, 204}, {-66, 172}, {-12, 172}, {-12, 172}}, color = {0, 0, 127}));
  connect(tau_engine_min_pos, multiplex56.u5[1]) annotation (
    Line(points = {{-120, -196}, {-18, -196}, {-18, 48}, {-12, 48}, {-12, 48}}, color = {0, 0, 127}));
  connect(tau_engine, multiplex56.u4[1]) annotation (
    Line(points={{-120,-168},{-22,-168},{-22,52},{-12,52},{-12,53}},            color = {0, 0, 127}));
  connect(tau_engine_target, multiplex56.u3[1]) annotation (
    Line(points = {{-120, -140}, {-26, -140}, {-26, 58}, {-12, 58}, {-12, 58}}, color = {0, 0, 127}));
  connect(rpm2radps.y, multiplex56.u2[1]) annotation (
    Line(points={{-59,-112},{-30,-112},{-30,62},{-12,62},{-12,63}},            color = {0, 0, 127}));
  connect(w_engine_radps, multiplex56.u1[1]) annotation (
    Line(points = {{-120, -84}, {-34, -84}, {-34, 66}, {-12, 66}, {-12, 68}}, color = {0, 0, 127}));
  connect(tau_brake, multiplex55.u5[1]) annotation (
    Line(points = {{-120, -56}, {-38, -56}, {-38, 74}, {-12, 74}, {-12, 74}}, color = {0, 0, 127}));
  connect(v_vehicle_mps, multiplex55.u4[1]) annotation (
    Line(points={{-120,-30},{-42,-30},{-42,78},{-12,78},{-12,79}},            color = {0, 0, 127}));
  connect(trans_shifter_position, multiplex55.u3[1]) annotation (
    Line(points = {{-120, -4}, {-46, -4}, {-46, 84}, {-12, 84}, {-12, 84}}, color = {0, 0, 127}));
  connect(accel_position_per, multiplex55.u2[1]) annotation (
    Line(points={{-120,24},{-50,24},{-50,88},{-12,88},{-12,89}},            color = {0, 0, 127}));
  connect(t_engine_water_k, multiplex55.u1[1]) annotation (
    Line(points = {{-120, 50}, {-54, 50}, {-54, 94}, {-12, 94}, {-12, 94}}, color = {0, 0, 127}));
  connect(TinOil_K, multiplex54.u5[1]) annotation (
    Line(points = {{-120, 84}, {-58, 84}, {-58, 100}, {-12, 100}, {-12, 100}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-100, -300}, {100, 300}})),
    __OpenModelica_commandLineOptions = "",
    Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 300}, {100, -300}}), Text(origin = {-10, -340}, lineColor = {0, 0, 255}, extent = {{-150, 20}, {150, -20}}, textString = "%name"), Text(origin = {0, 40}, extent = {{-100, 30}, {100, -30}}, textString = "Multiple"), Text(origin = {20, -30}, extent = {{-100, 30}, {60, -30}}, textString = "Input")}, coordinateSystem(extent = {{-100, -300}, {100, 300}}, initialScale = 0.1)));
end MultiSignal_Input;
