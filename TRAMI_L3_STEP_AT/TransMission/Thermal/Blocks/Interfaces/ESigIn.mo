within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks.Interfaces;
connector ESigIn = input Real "External Signal Input" annotation (
  defaultComponentName = "ESigIn",
  Icon(coordinateSystem(initialScale = 0.20000000000000001), graphics={  Polygon(points = {{-100, 100}, {100, 0}, {-100, -100}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0},
          fillPattern =                                                                                                                                                                          FillPattern.Solid)}),
  Diagram(coordinateSystem(initialScale = 0.20000000000000001), graphics={  Polygon(points = {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0},
          fillPattern =                                                                                                                                                                              FillPattern.Solid), Text(textString = "%name", lineColor = {0, 0, 127},
          fillPattern =                                                                                                                                                                                                        FillPattern.None, extent = {{-10, 60}, {-10, 85}})}),
  Documentation(info = "<html>
  			<p>
  			Connector with one input signal of type Real.
  			</p>
  			</html>"));
