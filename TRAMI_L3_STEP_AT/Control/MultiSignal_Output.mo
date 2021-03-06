within TRAMI_L3_STEP_AT.Control;
model MultiSignal_Output
  constant Real FirstOrderTime=0.01;
  Modelica.Blocks.Interfaces.RealInput u[34] annotation (Placement(
      visible=true,
      transformation(
        origin={-120,0},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-120,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Routing.DeMultiplex5 deMultiplex51(
    n1=5,
    n2=5,
    n3=5,
    n4=5,
    n5=5) annotation (Placement(visible=true, transformation(
        origin={-44,86},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.DeMultiplex5 deMultiplex52 annotation (Placement(
        visible=true, transformation(
        origin={-10,138},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.DeMultiplex5 deMultiplex53 annotation (Placement(
        visible=true, transformation(
        origin={-10,112},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.DeMultiplex5 deMultiplex54 annotation (Placement(
        visible=true, transformation(
        origin={-10,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.DeMultiplex5 deMultiplex55 annotation (Placement(
        visible=true, transformation(
        origin={-10,86},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.DeMultiplex5 deMultiplex56 annotation (Placement(
        visible=true, transformation(
        origin={-10,34},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput tau_clutch_cap[6] annotation (Placement(
      visible=true,
      transformation(
        origin={110,126},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,180},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.Multiplex5 multiplex51 annotation (Placement(visible=true,
        transformation(
        origin={40,138},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex21(n1=5, n2=1) annotation (
      Placement(visible=true, transformation(
        origin={76,126},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.DeMultiplex2 deMultiplex21(n1=25, n2=9) annotation (
      Placement(visible=true, transformation(
        origin={-76,50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.DeMultiplex2 deMultiplex22(n1=5, n2=4) annotation (
      Placement(visible=true, transformation(
        origin={-44,-4},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.DeMultiplex5 deMultiplex57 annotation (Placement(
        visible=true, transformation(
        origin={-10,8},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput tau_engine_max_req annotation (
      Placement(
      visible=true,
      transformation(
        origin={110,-116},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,-100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder10(T=FirstOrderTime, y(fixed=true))
    annotation (Placement(visible=true, transformation(
        origin={14,4},
        extent={{-2,-2},{2,2}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput p_line_Pa annotation (Placement(
      visible=true,
      transformation(
        origin={110,60},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput qv_cooler_trans_fluid_m3ps annotation (
      Placement(
      visible=true,
      transformation(
        origin={110,-44},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,-20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput qv_cooler_eng_water_m3ps annotation (
      Placement(
      visible=true,
      transformation(
        origin={110,-80},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,-60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput i_actuator_ampere annotation (Placement(
      visible=true,
      transformation(
        origin={110,26},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput i_eop_ampere annotation (Placement(
      visible=true,
      transformation(
        origin={110,-6},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,34},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T=FirstOrderTime, y(fixed=true))
    annotation (Placement(visible=true, transformation(
        origin={20,8},
        extent={{-2,-2},{2,2}},
        rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(T=FirstOrderTime, y(fixed=true))
    annotation (Placement(visible=true, transformation(
        origin={26,12},
        extent={{-2,-2},{2,2}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput tau_lockup_cap annotation (Placement(
      visible=true,
      transformation(
        origin={110,90},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,140},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput ratio_AT annotation (Placement(
      visible=true,
      transformation(
        origin={110,-150},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,-140},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput flag_trans_lock_up annotation (
      Placement(
      visible=true,
      transformation(
        origin={110,-190},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,-180},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Routing.DeMultiplex4 deMultiplex41(
    n1=1,
    n2=1,
    n3=1,
    n4=1) annotation (Placement(visible=true, transformation(
        origin={-10,-18},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(multiplex21.y, tau_clutch_cap) annotation (Line(
      points={{87,126},{104,126},{104,126},{110,126}},
      color={0,0,127},
      thickness=0.5));
  connect(multiplex51.y, multiplex21.u1) annotation (Line(
      points={{51,138},{56,138},{56,132},{64,132},{64,132}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex52.y5, multiplex51.u5) annotation (Line(
      points={{1,130},{26,130},{26,128},{28,128}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex52.y4, multiplex51.u4) annotation (Line(
      points={{1,134},{14,134},{14,133},{28,133}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex52.y3, multiplex51.u3) annotation (Line(
      points={{1,138},{28,138}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex52.y2, multiplex51.u2) annotation (Line(
      points={{1,142},{26,142},{26,143},{28,143}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex52.y1, multiplex51.u1) annotation (Line(
      points={{1,146},{26,146},{26,148},{28,148}},
      color={0,0,127},
      thickness=0.5));
  connect(firstOrder10.y, tau_engine_max_req) annotation (Line(points={{16.2,4},
          {49.1,4},{49.1,-116},{110,-116}}, color={0,0,127}));
  connect(firstOrder1.y, qv_cooler_eng_water_m3ps) annotation (Line(points={{22.2,
          8},{56,8},{56,-80},{110,-80}}, color={0,0,127}));
  connect(firstOrder2.y, qv_cooler_trans_fluid_m3ps) annotation (Line(points={{28.2,
          12},{64,12},{64,-44},{110,-44}}, color={0,0,127}));
  connect(deMultiplex51.y1, deMultiplex52.u) annotation (Line(
      points={{-33,94},{-31,94},{-31,138},{-22,138}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex22.y1, deMultiplex57.u) annotation (Line(
      points={{-33,2},{-27,2},{-27,8},{-22,8}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex21.y2, deMultiplex22.u) annotation (Line(
      points={{-65,44},{-60,44},{-60,-4},{-56,-4}},
      color={0,0,127},
      thickness=0.5));
  connect(u, deMultiplex21.u) annotation (Line(
      points={{-120,0},{-94,0},{-94,50},{-88,50}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex21.y1, deMultiplex51.u) annotation (Line(
      points={{-65,56},{-59,56},{-59,86},{-57,86},{-57,87},{-56,87},{-56,86}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex51.y5, deMultiplex56.u) annotation (Line(
      points={{-33,78},{-31,78},{-31,34},{-22,34}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex51.y3, deMultiplex55.u) annotation (Line(
      points={{-33,86},{-22,86}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex51.y4, deMultiplex54.u) annotation (Line(
      points={{-33,82},{-27,82},{-27,60},{-21,60},{-21,62},{-23,62},{-23,61},{-22,
          61},{-22,60}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex51.y2, deMultiplex53.u) annotation (Line(
      points={{-33,90},{-29,90},{-29,112},{-22,112}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex53.y1[1], multiplex21.u2[1]) annotation (Line(
      points={{1,120},{64,120}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex55.y2[1], tau_lockup_cap)
    annotation (Line(points={{1,90},{110,90}}, color={0,0,127}));
  connect(deMultiplex22.y2, deMultiplex41.u) annotation (Line(
      points={{-33,-10},{-26,-10},{-26,-18},{-22,-18}},
      color={0,0,127},
      thickness=0.5));
  connect(deMultiplex41.y3[1], ratio_AT) annotation (Line(points={{1,-21},{40,-21},
          {40,-150},{110,-150}}, color={0,0,127}));
  connect(deMultiplex41.y4[1], flag_trans_lock_up) annotation (Line(points={{1,-27},
          {30,-27},{30,-190},{110,-190}}, color={0,0,127}));
  connect(deMultiplex57.y4[1], firstOrder10.u)
    annotation (Line(points={{1,4},{11.6,4}}, color={0,0,127}));
  connect(deMultiplex57.y3[1], firstOrder1.u)
    annotation (Line(points={{1,8},{17.6,8}}, color={0,0,127}));
  connect(deMultiplex57.y2[1], firstOrder2.u)
    annotation (Line(points={{1,12},{23.6,12}}, color={0,0,127}));
  connect(deMultiplex57.y1[1], i_eop_ampere) annotation (Line(points={{1,16},{72,
          16},{72,-6},{110,-6}}, color={0,0,127}));
  connect(deMultiplex56.y5[1], i_actuator_ampere)
    annotation (Line(points={{1,26},{110,26}}, color={0,0,127}));
  connect(deMultiplex56.y4[1], p_line_Pa) annotation (Line(points={{1,30},{80,30},
          {80,60},{110,60}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-200},{100,160}})),
    __OpenModelica_commandLineOptions="",
    Icon(graphics={
        Rectangle(
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,200},{100,-200}}),
        Text(
          origin={0,-230},
          lineColor={0,0,255},
          extent={{-150,20},{150,-20}},
          textString="%name"),
        Text(
          origin={0,40},
          extent={{-100,30},{100,-30}},
          textString="Mulitiple"),
        Text(
          origin={20,-30},
          extent={{-100,30},{60,-30}},
          textString="Output")}, coordinateSystem(extent={{-100,-200},{100,200}},
          initialScale=0.1)),
    version="",
    uses(Modelica(version="3.2.3")));
end MultiSignal_Output;
