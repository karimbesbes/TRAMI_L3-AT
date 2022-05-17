within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block Mm2sTom2s "mm2/s to m2/s"
  extends Modelica.Blocks.Interfaces.SISO;
equation
  // enter your equations here
  y = u / 1000000;
end Mm2sTom2s;
