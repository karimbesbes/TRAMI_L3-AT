within TRAMI_L3_STEP_AT.TransMission.Thermal.PhysicalElements;
model VariableInertia "Inertia with Signal Driven Value "
  Modelica.Mechanics.Rotational.Interfaces.Flange_a ctr1 "1-dim. rotational flange of a shaft (filled square icon)" annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b ctr2 "1-dim. rotational flange of a shaft (non-filled square icon)" annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{86.7, -10}, {106.7, 10}})));
  Modelica.Blocks.Interfaces.RealInput J(quantity = "Mechanics.Rotation.MomentOfInertia", displayUnit = "kgm²") "Moment of inertia" annotation (
    Placement(transformation(extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Real phi(quantity = "Mechanics.Rotation.Angle") "Absolute rotation angle of component";
  Real w(quantity = "Mechanics.Rotation.RotVelocity") "Absolute angular velocity of component (= der(phi))";
  Real a(quantity = "Mechanics.Rotation.RotAccel") "Absolute angular acceleration of component (= der(w))";
  Real tau(quantity = "Mechanics.Rotation.Torque") "Torque at flange";
equation
  // enter your equations here
  ctr1.phi = phi;
  ctr2.phi = phi;
  ctr1.tau = tau;
  w = der(phi);
  a = der(w);
  J * a = ctr1.tau + ctr2.tau;
  annotation (
    Icon(graphics = {Rectangle(radius = 4, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-102.8, 9.5}, {100, -10}}), Rectangle(radius = 4, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, 50}, {50, -50}}), Line(points = {{-90.09999999999999, 23.4}, {-60.1, 23.4}}), Line(points = {{58.7, 23.2}, {88.7, 23.2}}), Line(points = {{-89.90000000000001, -23}, {-59.9, -23}}), Line(points = {{58.9, -23.2}, {88.90000000000001, -23.2}}), Line(points = {{-73.3, -76.7}, {73.3, -76.7}}), Line(points = {{72.3, -23.3}, {72.3, -76.7}}), Line(points = {{-73.09999999999999, -23.5}, {-73.09999999999999, -76.90000000000001}})}));
end VariableInertia;
