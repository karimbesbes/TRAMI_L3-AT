within TRAMI_L3_STEP_AT.TransMission.Thermal.Adaptors;
model RotWOut "Adaptor for a Rotational flange with angle, speed, and acceleration as outputs"
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange "1-dim. rotational flange of a shaft (filled square icon)" annotation (
    Placement(transformation(extent = {{-30, 60}, {-10, 80}}), iconTransformation(extent = {{-60, -10}, {-40, 10}})));
  Modelica.Blocks.Interfaces.RealOutput w(unit = "rad/s") "Flange moves with speed w due to torque tau" annotation (
    Placement(transformation(extent = {{20, 90}, {40, 110}}), iconTransformation(extent = {{40, 40}, {60, 60}})));
  Modelica.Blocks.Interfaces.RealInput tau(unit = "N.m") "Torque to drive the flange" annotation (
    Placement(transformation(extent = {{20, -50}, {60, -10}}), iconTransformation(extent = {{60, -60}, {40, -40}})));
equation
  w = der(flange.phi);
  flange.tau = -tau;
  annotation (
    Icon(coordinateSystem(extent = {{-50, -100}, {50, 100}}, preserveAspectRatio = false), graphics = {Rectangle(pattern = LinePattern.None, fillColor = {170, 255, 85}, fillPattern = FillPattern.VerticalCylinder, extent = {{-20, 100}, {20, -100}}), Text(textString = "om", fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 59}, {20, 37}}), Text(textString = "tau", textStyle = {TextStyle.Italic}, fillColor = {235, 245, 255}, fillPattern = FillPattern.Solid, extent = {{-20, -44}, {20, -66}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-90, 156.7}, {126.7, 106.7}})}),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 1, StartTime = 0, Interval = 0.001));
end RotWOut;
