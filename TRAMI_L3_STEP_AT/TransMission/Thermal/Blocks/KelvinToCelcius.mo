within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block KelvinToCelcius "Kelvin To Celsius"
  extends Modelica.Blocks.Interfaces.SISO;
equation
  // enter your equations here
  y = Modelica.SIunits.Conversions.to_degC(u);
end KelvinToCelcius;
