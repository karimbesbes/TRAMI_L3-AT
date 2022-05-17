within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks.Interfaces;
connector QfOut = output Real(unit = "W") "Heat Flow Rate Signal Output" annotation (
  defaultComponentName = "QfOut",
  Icon(graphics={  Polygon(lineColor = {0, 0, 127}, fillColor = {255, 255, 255},
          fillPattern =                                                                        FillPattern.Solid, points = {{-100.0, 100.0}, {100.0, 0.0}, {-100.0, -100.0}})}, coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.2)),
  Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics={  Polygon(lineColor = {0, 0, 127}, fillColor = {255, 255, 255},
          fillPattern =                                                                                                                                                                                          FillPattern.Solid, points = {{0.0, 50.0}, {100.0, 0.0}, {0.0, -50.0}, {0.0, 50.0}}), Text(lineColor = {0, 0, 127}, extent = {{-10.0, 60.0}, {-10.0, 85.0}}, textString = "%name")}),
  Documentation(info = "<html>
  			<p>
  			Connector with one output signal of type Real(W).
  			</p>
  			</html>"));
