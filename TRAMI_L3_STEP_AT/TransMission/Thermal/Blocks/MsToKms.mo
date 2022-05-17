within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block MsToKms "m/s to km/s"
  extends Modelica.Blocks.Interfaces.SISO;
equation
  // enter your equations here
  y = Modelica.SIunits.Conversions.to_kmh(u);
end MsToKms;
