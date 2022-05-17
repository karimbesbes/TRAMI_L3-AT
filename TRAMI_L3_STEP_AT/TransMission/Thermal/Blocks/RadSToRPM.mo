within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block RadSToRPM "Rad/S to RPM"
  extends Modelica.Blocks.Interfaces.SISO;
equation
  // enter your equations here
  y = Modelica.SIunits.Conversions.to_rpm(u);
end RadSToRPM;
