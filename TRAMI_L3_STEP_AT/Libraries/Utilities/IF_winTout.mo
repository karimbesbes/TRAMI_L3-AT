within TRAMI_L3_STEP_AT.Libraries.Utilities;
model IF_winTout
  parameter Real d;
  Modelica.Blocks.Interfaces.RealOutput Tout annotation (
    Placement(visible = true, transformation(origin = {-110, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput win annotation (
    Placement(visible = true, transformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(exact = true, phi(start = 0), w(start = 0)) annotation (
    Placement(visible = true, transformation(origin = {-42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor1 annotation (
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = d) annotation (
    Placement(visible = true, transformation(origin = {-72, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(torqueSensor1.flange_b, flange_a) annotation (
    Line(points = {{20, 0}, {100, 0}}));
  connect(speed1.flange, torqueSensor1.flange_a) annotation (
    Line(points = {{-32, 0}, {0, 0}}));
  connect(gain1.u, torqueSensor1.tau) annotation (
    Line(points = {{-60, -20}, {2, -20}, {2, -11}}, color = {0, 0, 127}));
  connect(gain1.y, Tout) annotation (
    Line(points = {{-84, -20}, {-102, -20}, {-102, -20}, {-110, -20}}, color = {0, 0, 127}));
  connect(win, speed1.w_ref) annotation (
    Line(points = {{-110, 20}, {-80, 20}, {-80, 0}, {-54, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {-2.66, 9.19}, points = {{-95.3431, 10.8085}, {-71.3431, 10.8085}, {-71.3431, -9.1916}}), Line(origin = {11, -1}, points = {{-85, 1}, {83, 1}}), Polygon(origin = {-2, 0}, fillColor = {154, 154, 154}, fillPattern = FillPattern.Solid, points = {{-20, 20}, {-20, -20}, {20, 0}, {-20, 20}})}),
    uses(Modelica(version = "3.2.3")));
end IF_winTout;
