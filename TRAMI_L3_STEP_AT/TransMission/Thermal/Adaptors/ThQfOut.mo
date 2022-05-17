within TRAMI_L3_STEP_AT.TransMission.Thermal.Adaptors;
model ThQfOut "Thermal Connector Q_flow Out"
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a "Thermal port for 1-dim. heat transfer (filled rectangular icon)" annotation (
    Placement(transformation(extent = {{30, 50}, {50, 70}}), iconTransformation(extent = {{36.7, -10}, {56.7, 10}})));
  Modelica.Blocks.Interfaces.RealInput T(unit = "K") "Temperature" annotation (
    Placement(transformation(extent = {{-55, 45}, {-15, 85}}), iconTransformation(extent = {{-70, 30}, {-30, 70}})));
  Modelica.Blocks.Interfaces.RealOutput Q_flow(unit = "W") "Heat_flow" annotation (
    Placement(transformation(extent = {{-35, 25}, {-15, 45}}), iconTransformation(extent = {{-40, -60}, {-60, -40}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor4 annotation (
    Placement(transformation(extent = {{15, 50}, {-5, 70}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature2 annotation (
    Placement(transformation(extent = {{-5, 75}, {15, 95}})));
  Modelica.SIunits.Temperature Tin = T;
  Modelica.SIunits.HeatFlowRate Qflow = Q_flow;
equation
  connect(prescribedTemperature2.port, heatFlowSensor4.port_b) annotation (
    Line(points = {{15, 85}, {20, 85}, {20, 72.7}, {-10, 72.7}, {-10, 60}, {-5, 60}}, color = {191, 0, 0}, thickness = 0.015625));
  connect(prescribedTemperature2.T, T) annotation (
    Line(points = {{-7, 85}, {-12, 85}, {-30, 85}, {-30, 65}, {-35, 65}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(heatFlowSensor4.port_a, port_a) annotation (
    Line(points = {{15, 60}, {20, 60}, {35, 60}, {40, 60}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(heatFlowSensor4.Q_flow, Q_flow) annotation (
    Line(points = {{5, 50}, {5, 45}, {5, 35}, {-20, 35}, {-25, 35}}, color = {0, 0, 127}, thickness = 0.0625));
  annotation (
    Icon(coordinateSystem(extent = {{-50, -100}, {50, 100}}), graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-45.3, 103.2}, {48, -96.8}}, origin = {2, -6.5}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-163.3, 133.3}, {146.7, 100}})}),
    experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
end ThQfOut;
