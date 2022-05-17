within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block PaTokPa "Pa to kPa"
  extends Modelica.Blocks.Interfaces.SISO;
equation
  // enter your equations here
  y = u / 1000;
end PaTokPa;
