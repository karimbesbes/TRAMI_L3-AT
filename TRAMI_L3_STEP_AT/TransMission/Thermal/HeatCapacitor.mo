within TRAMI_L3_STEP_AT.TransMission.Thermal;
model HeatCapacitor
  Modelica.Blocks.Interfaces.RealOutput K annotation (
    Placement(visible = true, transformation(origin = {-20, 110}, extent = {{10, -10}, {-10, 10}}, rotation = -90), iconTransformation(origin = {-20, 110}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Q annotation (
    Placement(visible = true, transformation(origin = {20, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {20, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 100, T(fixed = true)) annotation (
    Placement(visible = true, transformation(origin = {0, -8}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation (
    Placement(visible = true, transformation(origin = {20, 52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor1 annotation (
    Placement(visible = true, transformation(origin = {-20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(temperatureSensor1.T, K) annotation (
    Line(points = {{-20, 60}, {-20, 60}, {-20, 110}, {-20, 110}}, color = {0, 0, 127}));
  connect(temperatureSensor1.port, heatCapacitor1.port) annotation (
    Line(points = {{-20, 40}, {-20, 40}, {-20, 20}, {0, 20}, {0, 2}, {0, 2}}, color = {191, 0, 0}));
  connect(prescribedHeatFlow1.port, heatCapacitor1.port) annotation (
    Line(points = {{20, 42}, {20, 42}, {20, 20}, {0, 20}, {0, 2}, {0, 2}}, color = {191, 0, 0}));
  connect(prescribedHeatFlow1.Q_flow, Q) annotation (
    Line(points = {{20, 62}, {20, 62}, {20, 110}, {20, 110}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(origin = {2, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-46, 46}, {46, -46}}, endAngle = 360), Line(origin = {0, 72}, points = {{0, 26}, {0, -26}})}),
    uses(Modelica(version = "3.2.3")));
end HeatCapacitor;
