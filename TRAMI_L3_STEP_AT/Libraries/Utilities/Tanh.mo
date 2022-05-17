within TRAMI_L3_STEP_AT.Libraries.Utilities;
model Tanh
  Modelica.Blocks.Interfaces.RealInput u annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real Coeff = 1;
equation
  y = tanh(Coeff * u);
  annotation (
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(points = {{0, -80}, {0, 68}}, color = {192, 192, 192}), Text(origin = {4, -2}, lineColor = {192, 192, 192}, extent = {{-88, 72}, {-16, 24}}, textString = "tanh"), Line(points = {{-80, -80}, {-47.8, -78.7}, {-35.8, -75.7}, {-27.7, -70.6}, {-22.1, -64.2}, {-17.3, -55.9}, {-12.5, -44.3}, {-7.64, -29.2}, {-1.21, -4.82}, {6.83, 26.3}, {11.7, 42}, {16.5, 54.2}, {21.3, 63.1}, {26.9, 69.9}, {34.2, 75}, {45.4, 78.4}, {72, 79.9}, {80, 80}}), Line(points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}}), Polygon(origin = {0, 2}, rotation = 90, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}})}));
end Tanh;
