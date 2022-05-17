within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block RPMToRadS "RPM to rad/s"
  extends Modelica.Blocks.Interfaces.SISO;
equation
  // enter your equations here
  y = Modelica.SIunits.Conversions.from_rpm(u);
end RPMToRadS;
