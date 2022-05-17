within TRAMI_L3_STEP_AT.TransMission.Mechanics.Elements;
model Clutch
  parameter Real tanhCoeff = -350;
  Modelica.Blocks.Interfaces.RealInput tau_clutch_cap annotation (
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor1 annotation (
    Placement(visible = true, transformation(origin = {-66, 30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true) annotation (
    Placement(visible = true, transformation(origin = {72, 4.44089e-16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {-12, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {34, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs11 annotation (
    Placement(visible = true, transformation(origin = {-12, -24}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-12, 90}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PHI_W annotation (
    Placement(visible = true, transformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(visible = true, transformation(origin = {70, -100}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.Tanh tanh(Coeff = tanhCoeff) annotation (
    Placement(visible = true, transformation(origin = {-40, -4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(product1.y, product2.u1) annotation (
    Line(points = {{-6, 0}, {12, 0}, {12, -16}, {26, -16}, {26, -16}}, color = {0, 255, 0}));
  connect(product1.y, torque1.tau) annotation (
    Line(points = {{-6, 0}, {64, 0}, {64, 0}, {64, 0}}, color = {0, 255, 0}));
  connect(firstOrder2.y, product1.u1) annotation (
    Line(points = {{-18, 90}, {-24, 90}, {-24, 4}, {-20, 4}, {-20, 4}}, color = {0, 255, 0}));
  connect(tau_clutch_cap, firstOrder2.u) annotation (
    Line(points = {{0, 120}, {0, 120}, {0, 90}, {-4, 90}, {-4, 90}}, color = {0, 255, 0}));
  connect(abs11.u, relSpeedSensor1.w_rel) annotation (
    Line(points = {{-20, -24}, {-66, -24}, {-66, 24}, {-66, 24}}, color = {0, 255, 0}));
  connect(product2.u2, abs11.y) annotation (
    Line(points = {{26, -24}, {-6, -24}, {-6, -24}, {-6, -24}}, color = {0, 255, 0}));
  connect(flange_a, relSpeedSensor1.flange_a) annotation (
    Line(points = {{-100, 0}, {-88, 0}, {-88, 30}, {-72, 30}}));
  connect(flange_b, relSpeedSensor1.flange_b) annotation (
    Line(points = {{100, 0}, {90, 0}, {90, 30}, {-60, 30}}));
  connect(torque1.support, flange_a) annotation (
    Line(points = {{72, -6}, {72, -40}, {-88, -40}, {-88, 0}, {-100, 0}}));
  connect(torque1.flange, flange_b) annotation (
    Line(points = {{78, 0}, {100, 0}, {100, 0}, {100, 0}}));
  connect(product2.y, abs1.u) annotation (
    Line(points = {{41, -20}, {46, -20}, {46, -100}, {63, -100}}, color = {0, 255, 0}));
  connect(abs1.y, PHI_W) annotation (
    Line(points = {{76, -100}, {102, -100}, {102, -100}, {110, -100}}, color = {191, 0, 0}));
  connect(tanh.y, product1.u2) annotation (
    Line(points = {{-33, -4}, {-20, -4}}, color = {0, 255, 0}));
  connect(tanh.u, relSpeedSensor1.w_rel) annotation (
    Line(points = {{-47, -4}, {-66, -4}, {-66, 24}}, color = {0, 255, 0}));
  annotation (
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -134}, lineColor = {0, 0, 255}, extent = {{-120, 26}, {120, -26}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
    Diagram,
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 180, Tolerance = 1e-06, Interval = 0.1));
end Clutch;
