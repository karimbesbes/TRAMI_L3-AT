within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks.Interfaces;
type Smoothness = enumeration(
    Linear                           "linear interpolate",
    Spline                                                        "spline interpolate") "Smoothness of table interpolation" annotation (
  initValue = Spline);
