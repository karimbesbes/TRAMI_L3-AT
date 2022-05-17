within TRAMI_L3_STEP_AT.TransMission.Thermal.PhysicalElements;
connector HeatPort "Thermal port for 1-dim. heat transfer"
  ThermodynamicTemperature T "Port temperature";
  flow Modelica.SIunits.HeatFlowRate Q_flow "Heat flow rate (positive if flowing from outside into the component)";
  annotation (
    Icon(graphics = {Rectangle(lineColor = {165, 42, 42}, fillColor = {165, 42, 42}, fillPattern = FillPattern.Solid, extent = {{-30, 20}, {23.3, -30}})}),
    Documentation(info = "<html>

</html>"));
end HeatPort;
