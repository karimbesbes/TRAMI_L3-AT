within TRAMI_L3_STEP_AT.TransMission.Thermal.ThermalComponents;
model StartDevice "Thermal Model of Starting Device"
  // CP: 65001
  // SimulationX Version: 3.9.3.54687 x64
  Blocks.Interfaces.ESigIn Qf4 "External Signal Input" annotation (
    Placement(transformation(extent = {{110, 35}, {90, 55}}), iconTransformation(extent = {{110, 40}, {90, 60}})));
  Blocks.Interfaces.TIn T1 "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{-145, 5}, {-125, 25}}), iconTransformation(extent = {{-110, 40}, {-90, 60}})));
  Blocks.Interfaces.QfOut Qf1 "Heat Flow Rate Output" annotation (
    Placement(transformation(extent = {{-125, -10}, {-145, 10}}), iconTransformation(extent = {{-90, -60}, {-110, -40}})));
  Blocks.Interfaces.QfIn Qf2 "Heat Flow Rate Input" annotation (
    Placement(transformation(extent = {{105, -5.1}, {85, 14.9}}), iconTransformation(origin = {50, 100}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Blocks.Interfaces.QfIn Qf3 "Heat Flow Rate Input" annotation (
    Placement(transformation(extent = {{105, -50}, {85, -30}}), iconTransformation(origin = {50, -100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Blocks.Interfaces.TOut T3 "Temperature Output" annotation (
    Placement(transformation(extent = {{85, -35}, {105, -15}}), iconTransformation(origin = {-50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Blocks.Interfaces.TOut T2 "Temperature Output" annotation (
    Placement(transformation(extent = {{85, 10}, {105, 30}}), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoEngine(R = R) annotation (
    Placement(transformation(origin = {-25, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow QfFrStartingDevice annotation (
    Placement(transformation(extent = {{25, 35}, {5, 55}})));
  Adaptors.ThTout thTout1 annotation (
    Placement(transformation(extent = {{20, 0}, {10, 20}})));
  Adaptors.ThTout thTout2 annotation (
    Placement(transformation(extent = {{20, -45}, {10, -25}})));
  Adaptors.ThQfOut thQfOut2 annotation (
    Placement(transformation(extent = {{-55, 0}, {-45, 20}})));
  PhysicalElements.HeatCapacitorInitT startDeviceHeatCapacity(C = C, T(displayUnit = "K", fixed = true, start = T0)) annotation (
    Placement(transformation(extent = {{-15, 55}, {5, 75}})));
  Modelica.Blocks.Math.Gain gain2(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{45, 10}, {65, 30}})));
  Modelica.Blocks.Math.Gain gain3(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{45, -35}, {65, -15}})));
  Modelica.Blocks.Math.Gain gain4(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{-85, -10}, {-105, 10}})));
  parameter Modelica.SIunits.HeatCapacity C = 5000 "Heat capacity(startDeviceHeatCapacity)";
  parameter PhysicalElements.ThermodynamicTemperature T0 = 298.14999999999998 "Initial Temperature(startDeviceHeatCapacity)";
  parameter Modelica.SIunits.ThermalResistance R = 100 "Thermal resistance to/from Engine(RtoEngine)";
  parameter Real kDummy = 1 "Dummy(Do not change)";
equation
  connect(thTout1.T, gain2.u) annotation (
    Line(points = {{20, 15}, {25, 15}, {38, 15}, {38, 20}, {43, 20}}));
  connect(T2, gain2.y) annotation (
    Line(points = {{95, 20}, {90, 20}, {71, 20}, {66, 20}}));
  connect(thTout2.T, gain3.u) annotation (
    Line(points = {{20, -30}, {25, -30}, {38, -30}, {38, -25}, {43, -25}}));
  connect(T3, gain3.y) annotation (
    Line(points = {{95, -25}, {90, -25}, {71, -25}, {66, -25}}));
  connect(thQfOut2.Q_flow, gain4.u) annotation (
    Line(points = {{-55, 5}, {-60, 5}, {-78, 5}, {-78, 0}, {-83, 0}}));
  connect(Qf1, gain4.y) annotation (
    Line(points = {{-135, 0}, {-130, 0}, {-111, 0}, {-106, 0}}));
  connect(T1, thQfOut2.T) annotation (
    Line(points = {{-135, 15}, {-130, 15}, {-60, 15}, {-55, 15}}, thickness = 0));
  connect(Qf2, thTout1.Q_flow) annotation (
    Line(points = {{95, 5}, {90, 5}, {25, 5}, {20, 5}}, thickness = 0));
  connect(Qf3, thTout2.Q_flow) annotation (
    Line(points = {{95, -40}, {90, -40}, {25, -40}, {20, -40}}, thickness = 0));
  connect(startDeviceHeatCapacity.port, thTout2.port_a) annotation (
    Line(points = {{-5, 55.3}, {-5, 50.3}, {-5, -35}, {5.3, -35}, {10.3, -35}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(startDeviceHeatCapacity.port, thTout1.port_a) annotation (
    Line(points = {{-5, 55.3}, {-5, 50.3}, {-5, 10}, {5.3, 10}, {10.3, 10}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(thQfOut2.port_a, RtoEngine.port_b) annotation (
    Line(points = {{-45.3, 10}, {-40.3, 10}, {-40, 10}, {-35, 10}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(startDeviceHeatCapacity.port, RtoEngine.port_a) annotation (
    Line(points = {{-5, 55.3}, {-5, 50.3}, {-5, 10}, {-10, 10}, {-15, 10}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(Qf4, QfFrStartingDevice.Q_flow) annotation (
    Line(points = {{100, 45}, {95, 45}, {30, 45}, {25, 45}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(startDeviceHeatCapacity.port, QfFrStartingDevice.port) annotation (
    Line(points = {{-5, 55.3}, {-5, 50.3}, {-5, 45}, {0, 45}, {5, 45}}, color = {191, 0, 0}, thickness = 0.0625));
  annotation (
    Icon(graphics = {Rectangle(fillPattern = FillPattern.None, extent = {{-100, 100}, {100, -100}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-100, 19}, {100, -19}}, origin = {0, 1})}),
    Documentation(info = "<HTML><HEAD>
<META charset=\"utf-8\">
<STYLE type=\"text/css\">
a {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;}
body, blockquote, table, p, li, dl, ul, ol {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; color: black;}
h3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11pt; font-weight: bold;}
h4 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold;}
h5 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: bold;}
h6 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: bold; font-style:italic}
pre {font-family: Courier, monospace; font-size: 9pt;}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.9600.19180\"></HEAD> 
<BODY>
<P><BR></P>
<P><BR></P></BODY></HTML>
    "),
    experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
end StartDevice;
