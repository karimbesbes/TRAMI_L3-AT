within TRAMI_L3_STEP_AT.Libraries.Utilities;
block Subtruct
  extends Modelica.Blocks.Interfaces.SI2SO;
equation
  y = u1 - u2;
  annotation (
    Icon(graphics = {Line(points = {{-100, 60}, {-74, 24}, {-44, 24}}, color = {0, 0, 127}), Line(points = {{50, 0}, {100, 0}}, color = {0, 0, 127}), Line(points = {{50, 0}, {100, 0}}, color = {0, 0, 255}), Ellipse(lineColor = {0, 0, 127}, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Text(extent = {{-36, 38}, {40, -30}}, textString = "-"), Line(points = {{-100, -60}, {-74, -28}, {-42, -28}}, color = {0, 0, 127})}));
end Subtruct;
