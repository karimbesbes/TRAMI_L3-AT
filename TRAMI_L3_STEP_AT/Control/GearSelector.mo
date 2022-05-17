within TRAMI_L3_STEP_AT.Control;
model GearSelector
  parameter Real Gear_ratio_1st = 5.353, Gear_ratio_2nd = 3.243, Gear_ratio_3rd = 2.252, Gear_ratio_4th = 1.636, Gear_ratio_5th = 1.211, Gear_ratio_6th = 1.000, Gear_ratio_7th = 0.865, Gear_ratio_8th = 0.717, Gear_ratio_9th = 0.601, Gear_ratio_N = 0, Gear_ratio_rev = -4.798;
  Modelica.Blocks.Interfaces.RealInput GearRatio annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput GearSelectSignal[11] annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  GearSelectSignal = if GearRatio > Gear_ratio_1st - 0.05 then {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0} elseif GearRatio > Gear_ratio_2nd - 0.05 then {0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}
   elseif GearRatio > Gear_ratio_3rd - 0.05 then {0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0}
   elseif GearRatio > Gear_ratio_4th - 0.05 then {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0}
   elseif GearRatio > Gear_ratio_5th - 0.05 then {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
   elseif GearRatio > Gear_ratio_6th - 0.05 then {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0}
   elseif GearRatio > Gear_ratio_7th - 0.05 then {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0}
   elseif GearRatio > Gear_ratio_8th - 0.05 then {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0}
   elseif GearRatio > Gear_ratio_9th - 0.05 then {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0}
   elseif GearRatio > Gear_ratio_N - 0.05 then {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1} else {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  // 1速
  // 2速
  // 3速
  // 4速
  // 5速
  // 6速
  // 7速
  // 8速
  // 9速
  // 10速
  // ニュートラル
  // Reverse
end GearSelector;
