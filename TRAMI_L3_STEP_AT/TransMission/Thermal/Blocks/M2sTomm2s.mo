within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block M2sTomm2s "m2/s to mm2/s"
  extends Modelica.Blocks.Interfaces.SISO;
equation
  // enter your equations here
  y = 1000000 * u;
end M2sTomm2s;
