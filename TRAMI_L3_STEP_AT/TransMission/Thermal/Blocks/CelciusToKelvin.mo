within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block CelciusToKelvin "Celsius to Kelvin"
  extends Modelica.Blocks.Interfaces.SISO;
equation
  // enter your equations here
  y = Modelica.SIunits.Conversions.from_degC(u);
end CelciusToKelvin;
