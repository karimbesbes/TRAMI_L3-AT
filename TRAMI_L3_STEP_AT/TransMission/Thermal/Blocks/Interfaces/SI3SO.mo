within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks.Interfaces;
partial block SI3SO "3 Single Input / 1 Single Output continuous control block"
  Modelica.Blocks.Interfaces.RealInput u1 "Connector of Real input signal 1" annotation (
    Placement(transformation(extent = {{-140, 40}, {-100, 80}}), iconTransformation(extent = {{-140, 40}, {-100, 80}})));
  Modelica.Blocks.Interfaces.RealInput u2 "Connector of Real input signal 1" annotation (
    Placement(transformation(extent = {{-140, -20}, {-100, 20}}), iconTransformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealInput u3 "Connector of Real input signal 2" annotation (
    Placement(transformation(extent = {{-140, -80}, {-100, -40}}), iconTransformation(extent = {{-140, -80}, {-100, -40}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal" annotation (
    Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
  extends Modelica.Blocks.Icons.Block;
  annotation (
    Documentation(info = "<html>
<p>
Block has two continuous Real input signals u1 and u2 and one
continuous Real output signal y.
</p>
</html>"));
end SI3SO;
