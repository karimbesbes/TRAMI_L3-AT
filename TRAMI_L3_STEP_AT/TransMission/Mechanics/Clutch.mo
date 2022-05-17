within TRAMI_L3_STEP_AT.TransMission.Mechanics;
model Clutch
  Modelica.Blocks.Interfaces.RealInput tau_clutch_cap annotation (
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
    Placement(visible = true, transformation(origin = {-66, 16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
    Placement(visible = true, transformation(origin = {72, 4.44089e-16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {-12, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.02, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-12, 90}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.Tanh tanh(Coeff = -10) annotation (
    Placement(visible = true, transformation(origin = {-42, -4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(firstOrder1.y, product1.u1) annotation (
    Line(points = {{-18, 90}, {-24, 90}, {-24, 4}, {-20, 4}, {-20, 4}}, color = {0, 0, 127}));
  connect(tau_clutch_cap, firstOrder1.u) annotation (
    Line(points = {{0, 120}, {0, 120}, {0, 90}, {-4, 90}, {-4, 90}}, color = {0, 0, 127}));
  connect(product1.y, torque1.tau) annotation (
    Line(points = {{-6, 0}, {64, 0}, {64, 0}, {64, 0}}, color = {0, 0, 127}));
  connect(flange_b, relSpeedSensor1.flange_b) annotation (
    Line(points = {{100, 0}, {90, 0}, {90, 16}, {-60, 16}}));
  connect(flange_a, relSpeedSensor1.flange_a) annotation (
    Line(points = {{-100, 0}, {-88, 0}, {-88, 16}, {-72, 16}}));
  connect(torque1.support, flange_a) annotation (
    Line(points = {{72, -6}, {72, -40}, {-88, -40}, {-88, 0}, {-100, 0}}));
  connect(torque1.flange, flange_b) annotation (
    Line(points = {{78, 0}, {100, 0}, {100, 0}, {100, 0}}));
  connect(tanh.y, product1.u2) annotation (
    Line(points = {{-35, -4}, {-20, -4}}, color = {0, 0, 127}));
  connect(tanh.u, relSpeedSensor1.w_rel) annotation (
    Line(points = {{-49, -4}, {-66, -4}, {-66, 10}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-100, 14}, {100, -26}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end Clutch;
