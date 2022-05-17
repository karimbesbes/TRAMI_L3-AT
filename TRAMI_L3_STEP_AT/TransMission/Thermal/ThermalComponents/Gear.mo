within TRAMI_L3_STEP_AT.TransMission.Thermal.ThermalComponents;
model Gear "Thermal Model of Gear"
  // CP: 65001
  // SimulationX Version: 3.9.3.54687 x64
  Blocks.Interfaces.QfIn Qf1 "Heat Flow Rate Input" annotation (
    Placement(transformation(extent = {{-130, 5}, {-110, 25}}), iconTransformation(origin = {50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Blocks.Interfaces.QfIn Qf2 "Heat Flow Rate Input" annotation (
    Placement(transformation(extent = {{-130, -40}, {-110, -20}}), iconTransformation(origin = {50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Blocks.Interfaces.ESigIn Qf3 "External Signal Input" annotation (
    Placement(transformation(extent = {{85.09999999999999, -35}, {65.09999999999999, -15}}), iconTransformation(extent = {{110, -10}, {90, 10}})));
  Blocks.Interfaces.TOut T1 "Temperature Output" annotation (
    Placement(transformation(extent = {{-109.9, 20.1}, {-129.9, 40.1}}), iconTransformation(origin = {-50, 100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Blocks.Interfaces.TOut T2 "Temperature Output" annotation (
    Placement(transformation(extent = {{-110, -25}, {-130, -5}}), iconTransformation(origin = {-50, -100}, extent = {{10, -10}, {-10, 10}}, rotation = -270)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow QfFrGearSets annotation (
    Placement(transformation(extent = {{0, -35}, {-20, -15}})));
  Adaptors.ThTout thTout4 "Thermal Temperature Out" annotation (
    Placement(transformation(origin = {-50, 20}, extent = {{-5, -10}, {5, 10}})));
  Adaptors.ThTout thTout5 "Thermal Temperature Out" annotation (
    Placement(transformation(origin = {-50, -25}, extent = {{-5, -10}, {5, 10}})));
  PhysicalElements.HeatCapacitorInitT gearHeatCapacity(C = C, T(start = T0, fixed = true)) "Lumped thermal element storing heat" annotation (
    Placement(transformation(extent = {{-40, 25}, {-20, 45}})));
  Modelica.Blocks.Math.Gain gain3(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{-80, 20}, {-100, 40}})));
  Modelica.Blocks.Math.Gain gain4(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{-75, -25}, {-95, -5}})));
  parameter Modelica.SIunits.HeatCapacity C = 15000 "Heat capacity(gearHeatCapacity)";
  parameter PhysicalElements.ThermodynamicTemperature T0 = 298.14999999999998 "Initial Temperature(gearHeatCapacity)";
  parameter Real kDummy = 1 "Dummy(Do not change)";
equation
  connect(thTout4.T, gain3.u) annotation (
    Line(points = {{-55, 25}, {-60, 25}, {-73, 25}, {-73, 30}, {-78, 30}}));
  connect(T1, gain3.y) annotation (
    Line(points = {{-120, 30}, {-115, 30}, {-106, 30}, {-101, 30}}));
  connect(thTout5.T, gain4.u) annotation (
    Line(points = {{-55, -20}, {-60, -20}, {-68, -20}, {-68, -15}, {-73, -15}}));
  connect(T2, gain4.y) annotation (
    Line(points = {{-120, -15}, {-115, -15}, {-101, -15}, {-96, -15}}));
  connect(Qf1, thTout4.Q_flow) annotation (
    Line(points = {{-120, 15}, {-115, 15}, {-60, 15}, {-55, 15}}, thickness = 0));
  connect(Qf2, thTout5.Q_flow) annotation (
    Line(points = {{-120, -30}, {-115, -30}, {-60, -30}, {-55, -30}}, thickness = 0));
  connect(gearHeatCapacity.port, thTout4.port_a) annotation (
    Line(points = {{-30, 25.3}, {-30, 20.3}, {-30, 20}, {-40.3, 20}, {-45.3, 20}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(gearHeatCapacity.port, thTout5.port_a) annotation (
    Line(points = {{-30, 25.3}, {-30, 20.3}, {-30, -25}, {-40.3, -25}, {-45.3, -25}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(Qf3, QfFrGearSets.Q_flow) annotation (
    Line(points = {{75, -25}, {70, -25}, {5, -25}, {0, -25}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(gearHeatCapacity.port, QfFrGearSets.port) annotation (
    Line(points = {{-30, 25.3}, {-30, 20.3}, {-30, -25}, {-25, -25}, {-20, -25}}, color = {191, 0, 0}, thickness = 0.0625));
  annotation (
    Icon(graphics = {Rectangle(fillPattern = FillPattern.None, extent = {{-100, 100}, {100, -100}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-102, 10}, {100, -30}}, origin = {0, 10})}),
    experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
end Gear;
