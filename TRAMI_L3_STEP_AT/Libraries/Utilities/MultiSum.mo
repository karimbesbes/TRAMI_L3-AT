within TRAMI_L3_STEP_AT.Libraries.Utilities;
block MultiSum
  extends Modelica.Blocks.Interfaces.PartialRealMISO;
equation
  y = sum(u);
  annotation (
    Icon(graphics = {Text(extent = {{-72, 68}, {92, -68}}, textString = "+")}, coordinateSystem(initialScale = 0.1)));
end MultiSum;
