within TRAMI_L3_STEP_AT.TransMission.Thermal.PhysicalElements;
type ThermodynamicTemperature = Real(final quantity = "ThermodynamicTemperature", final unit = "K", min = 0.0, displayUnit = "degC") "Absolute temperature (use type TemperatureDifference for relative temperatures)" annotation (
  absoluteValue = true);
