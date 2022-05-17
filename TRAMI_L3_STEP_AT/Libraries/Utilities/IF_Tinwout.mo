within TRAMI_L3_STEP_AT.Libraries.Utilities;
model IF_Tinwout
  Modelica.Blocks.Interfaces.RealOutput wout annotation (
    Placement(visible = true, transformation(origin = {-110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Tin annotation (
    Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation (
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation (
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(torque1.flange, flange_a) annotation (
    Line(points = {{-30, 0}, {100, 0}}));
  connect(speedSensor1.w, wout) annotation (
    Line(points = {{-22, 40}, {-68, 40}, {-68, 20}, {-110, 20}, {-110, 20}}, color = {0, 0, 127}));
  connect(torque1.flange, speedSensor1.flange) annotation (
    Line(points = {{-30, 0}, {20, 0}, {20, 40}, {0, 40}, {0, 40}}));
  connect(Tin, torque1.tau) annotation (
    Line(points = {{-110, -20}, {-68, -20}, {-68, 0}, {-52, 0}, {-52, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {-2.66, 9.19}, points = {{-95.3431, -31.1915}, {-71.3431, -31.1915}, {-71.3431, -9.1916}}), Line(origin = {11, -1}, points = {{-85, 1}, {83, 1}}), Polygon(origin = {2, 0}, fillColor = {182, 182, 182}, fillPattern = FillPattern.HorizontalCylinder, points = {{-20, 20}, {-20, -20}, {20, 0}, {-20, 20}, {-20, 20}})}),
    uses(Modelica(version = "3.2.3")));
end IF_Tinwout;
