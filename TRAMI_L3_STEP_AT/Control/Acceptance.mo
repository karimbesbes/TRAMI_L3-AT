within TRAMI_L3_STEP_AT.Control;
block Acceptance
  Modelica.Blocks.Interfaces.RealInput Acceptance_data[33] annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation

  annotation (
    Icon(graphics={  Polygon(origin = {-2, 1}, fillColor = {0, 255, 0},
            fillPattern =                                                             FillPattern.Solid, points = {{-90, 67}, {-90, 87}, {90, 85}, {90, -87}, {-86, -83}, {-86, -55}, {58, -55}, {60, 61}, {-90, 67}, {-90, 67}, {-90, 67}}), Text(origin = {-19, 11}, extent = {{-53, 39}, {53, -39}}, textString = "A")}, coordinateSystem(initialScale = 0.1)));
end Acceptance;
