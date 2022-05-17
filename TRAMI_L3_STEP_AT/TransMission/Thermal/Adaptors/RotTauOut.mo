within TRAMI_L3_STEP_AT.TransMission.Thermal.Adaptors;
model RotTauOut "RotTauOut"
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "1-dim. rotational flange of a shaft (non-filled square icon)" annotation (
    Placement(transformation(extent = {{35, 50}, {55, 70}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
  Modelica.Blocks.Interfaces.RealInput w(unit = "rad/s") "Speed to drive the flange" annotation (
    Placement(transformation(extent = {{-100, 70}, {-60, 110}}), iconTransformation(extent = {{-60, 40}, {-40, 60}})));
  Modelica.Blocks.Interfaces.RealOutput tau(unit = "N.m") "Torque needed to drive the flange according to phi, w, a" annotation (
    Placement(transformation(extent = {{-60, 10}, {-80, 30}}), iconTransformation(extent = {{-40, -60}, {-60, -40}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (
    Placement(transformation(extent = {{35, 50}, {15, 70}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed2(exact = false, f_crit = 1000) annotation (
    Placement(transformation(extent = {{-25, 50}, {-5, 70}})));
equation
  connect(torqueSensor.tau, tau) annotation (
    Line(points = {{33, 49}, {33, 44}, {33, 20}, {-65, 20}, {-70, 20}}, color = {0, 0, 127}));
  connect(torqueSensor.flange_a, flange) annotation (
    Line(points = {{35, 60}, {40, 60}, {45, 60}}));
  connect(speed2.flange, torqueSensor.flange_b) annotation (
    Line(points = {{-5, 60}, {0, 60}, {10, 60}, {15, 60}}, thickness = 0.0625));
  connect(speed2.w_ref, w) annotation (
    Line(points = {{-27, 60}, {-32, 60}, {-75, 60}, {-75, 90}, {-80, 90}}, color = {0, 0, 127}, thickness = 0.0625));
  annotation (
    Icon(coordinateSystem(extent = {{-50, -100}, {50, 100}}, preserveAspectRatio = false), graphics = {Rectangle(pattern = LinePattern.None, fillColor = {170, 255, 85}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 100}, {20, -100}}), Text(textString = "om", fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 63}, {20, 41}}), Text(textString = "tau", textStyle = {TextStyle.Italic}, fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, -43}, {20, -65}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-76.7, 156.7}, {100, 113.3}}), Rectangle(pattern = LinePattern.None, fillColor = {170, 255, 85}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 100}, {20, -100}}), Text(textString = "om", fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 63}, {20, 41}}), Text(textString = "tau", textStyle = {TextStyle.Italic}, fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, -43}, {20, -65}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-76.7, 156.7}, {100, 113.3}})}),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>RotTauOut</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}
</STYLE>
   <LINK href=\"../format_help.css\" rel=\"stylesheet\"> 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.9600.19236\"></HEAD> 
<BODY>
<H1><FONT size=\"2\">20190123: default values&nbsp;are changed.</FONT></H1>
<UL>
  <LI>exact=false, f_crit=1000</LI></UL></BODY></HTML>
            "),
    experiment(StopTime = 1, StartTime = 0, Interval = 0.001));
end RotTauOut;
