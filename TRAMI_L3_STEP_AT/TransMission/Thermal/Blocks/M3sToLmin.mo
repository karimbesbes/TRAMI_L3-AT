within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block M3sToLmin "m3/s to l/min"
  extends Modelica.Blocks.Interfaces.SISO;
equation
  // enter your equations here
  y = 60000 * u;
end M3sToLmin;
