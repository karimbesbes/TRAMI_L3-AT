within TRAMI_L3_STEP_AT.TransMission.Thermal.Adaptors;
model ThTout "Thermal Temperature Out"
  Modelica.Blocks.Interfaces.RealOutput T(unit = "K") "Temperature" annotation (
    Placement(transformation(extent = {{-110, 75}, {-90, 95}}), iconTransformation(extent = {{-40, 40}, {-60, 60}})));
  Modelica.Blocks.Interfaces.RealInput Q_flow(unit = "W") "Heat Flow" annotation (
    Placement(transformation(extent = {{-120, 25}, {-80, 65}}), iconTransformation(extent = {{-70, -70}, {-30, -30}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a "Thermal port for 1-dim. heat transfer (filled rectangular icon)" annotation (
    Placement(transformation(extent = {{-50, 55}, {-30, 75}}), iconTransformation(extent = {{36.7, -10}, {56.7, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor2 annotation (
    Placement(transformation(extent = {{-80, 65}, {-60, 85}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow2 annotation (
    Placement(transformation(extent = {{-60, 40}, {-80, 60}})));
  Modelica.SIunits.Temperature Tout = T;
  Modelica.SIunits.HeatFlowRate Qflow = Q_flow;
equation
  connect(temperatureSensor2.port, prescribedHeatFlow2.port) annotation (
    Line(points = {{-80, 75}, {-85, 75}, {-85, 50}, {-80, 50}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(temperatureSensor2.T, T) annotation (
    Line(points = {{-60, 75}, {-55, 75}, {-55, 85}, {-95, 85}, {-100, 85}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(prescribedHeatFlow2.Q_flow, Q_flow) annotation (
    Line(points = {{-60, 50}, {-55, 50}, {-55, 40}, {-95, 40}, {-95, 45}, {-100, 45}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(temperatureSensor2.port, port_a) annotation (
    Line(points = {{-80, 75}, {-85, 75}, {-85, 65}, {-45, 65}, {-40, 65}}, color = {191, 0, 0}, thickness = 0.0625));
  annotation (
    Icon(coordinateSystem(extent = {{-50, -100}, {50, 100}}), graphics = {Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-166.7, 136.7}, {153.3, 100}}), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-50, 96.7}, {53.3, -96.7}})}),
    experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
end ThTout;
