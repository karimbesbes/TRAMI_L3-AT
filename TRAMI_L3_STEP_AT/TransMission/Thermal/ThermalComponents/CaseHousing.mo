within TRAMI_L3_STEP_AT.TransMission.Thermal.ThermalComponents;
model CaseHousing "Thermal model of Case Housing of TM"
  // CP: 65001
  // SimulationX Version: 3.9.3.54687 x64
  Blocks.Interfaces.TIn T1 "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{-125, 5}, {-105, 25}}), iconTransformation(extent = {{-310, -60}, {-290, -40}})));
  Blocks.Interfaces.TIn T2 "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{-125, -70}, {-105, -50}}), iconTransformation(origin = {-250, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Blocks.Interfaces.QfOut Qf1 "Heat Flow Rate Output" annotation (
    Placement(transformation(extent = {{-105, -15}, {-125, 5}}), iconTransformation(extent = {{-290, 40}, {-310, 60}})));
  Blocks.Interfaces.QfOut Qf2 "Heat Flow Rate Output" annotation (
    Placement(transformation(extent = {{-105, -90}, {-125, -70}}), iconTransformation(origin = {-150, -100}, extent = {{10, -10}, {-10, 10}}, rotation = -270)));
  Blocks.Interfaces.TIn T5 "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{135, 5}, {115, 25}}), iconTransformation(extent = {{310, -60}, {290, -40}})));
  Blocks.Interfaces.TIn T3 "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{135, -70}, {115, -50}}), iconTransformation(origin = {150, -100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Blocks.Interfaces.TIn T4 "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{135, -115}, {115, -95}}), iconTransformation(origin = {-50, -100}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Blocks.Interfaces.QfOut Qf5 "Heat Flow Rate Output" annotation (
    Placement(transformation(extent = {{115, -15}, {135, 5}}), iconTransformation(extent = {{290, 40}, {310, 60}})));
  Blocks.Interfaces.QfOut Qf3 "Heat Flow Rate Output" annotation (
    Placement(transformation(extent = {{115, -90}, {135, -70}}), iconTransformation(origin = {250, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Blocks.Interfaces.QfOut Qf4 "Heat Flow Rate Output" annotation (
    Placement(transformation(extent = {{115, -135}, {135, -115}}), iconTransformation(origin = {50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Blocks.Interfaces.CSigIn v1 "Control Signal Input" annotation (
    Placement(transformation(extent = {{130, 70}, {110, 90}}), iconTransformation(origin = {200, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoEngine(R = R1) "Lumped thermal element transporting heat without storing it" annotation (
    Placement(transformation(origin = {-25, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoStartingDevice(R = R2) annotation (
    Placement(transformation(origin = {-25, -65}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoOil(R = R4) annotation (
    Placement(transformation(origin = {30, -110}, extent = {{10, 10}, {-10, -10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoGear(R = R3) annotation (
    Placement(transformation(origin = {30, -65}, extent = {{10, 10}, {-10, -10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.ConvectiveResistor thermalRVsVehicleV annotation (
    Placement(transformation(extent = {{40, 0}, {20, 20}})));
  Modelica.Blocks.Tables.CombiTable1D thermalRVsVehicleVTable(table = table) annotation (
    Placement(transformation(origin = {30, 45}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Adaptors.ThQfOut thQfOut7 annotation (
    Placement(transformation(extent = {{-55, -75}, {-45, -55}})));
  Adaptors.ThQfOut thQfOut8 annotation (
    Placement(transformation(extent = {{-55, 0}, {-45, 20}})));
  Adaptors.ThQfOut thQfOut9 annotation (
    Placement(transformation(extent = {{65, 0}, {55, 20}})));
  Adaptors.ThQfOut thQfOut10 annotation (
    Placement(transformation(extent = {{65, -75}, {55, -55}})));
  Adaptors.ThQfOut thQfOut20 annotation (
    Placement(transformation(extent = {{65, -120}, {55, -100}})));
  PhysicalElements.HeatCapacitorInitT caseHousingHeatCapacity(C = C, T(displayUnit = "K", fixed = true, start = T0)) annotation (
    Placement(transformation(extent = {{-10, 30}, {10, 50}})));
  Modelica.Blocks.Math.Gain gain3(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{80, -15}, {100, 5}})));
  Modelica.Blocks.Math.Gain gain4(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{80, -90}, {100, -70}})));
  Modelica.Blocks.Math.Gain gain5(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{80, -135}, {100, -115}})));
  Modelica.Blocks.Math.Gain gain6(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{-75, -15}, {-95, 5}})));
  Modelica.Blocks.Math.Gain gain7(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{-75, -90}, {-95, -70}})));
  Blocks.MsToKms mstoKms1 annotation (
    Placement(transformation(extent = {{70, 70}, {50, 90}})));
  parameter Modelica.SIunits.HeatCapacity C = 30000 "Heat capacity(caseHousingHeatCapacity)";
  parameter PhysicalElements.ThermodynamicTemperature T0 = 298.14999999999998 "Initial Temperature(caseHousingHeatCapacity)";
  parameter Modelica.SIunits.ThermalResistance R1 = 0.1 "Thermal resistance to/from Engine(RtoEngine)";
  parameter Modelica.SIunits.ThermalResistance R2 = 100 "Thermal resistance to/from StartingDevice(RtoStartingDevice)";
  parameter Modelica.SIunits.ThermalResistance R3 = 100 "Thermal resistance to/from Gear(RtoGear)";
  parameter Modelica.SIunits.ThermalResistance R4 = 0.006 "Thermal resistance to/from Oil(RtoOil)";
  parameter Real table[:, :] = {{0, 0.022}, {10, 0.021}, {20, 0.021}, {30, 0.02}, {40, 0.019}, {50, 0.018}, {60, 0.017}, {70, 0.016}, {80, 0.015}, {90, 0.014}, {100, 0.013}, {110, 0.012}, {120, 0.012}, {130, 0.011}, {140, 0.011}, {150, 0.01}, {160, 0.01}} "Table(e.g., table={velocity,thermalResistance}) (thermalRVsVehicleVTable)";
  parameter Real kDummy = 1 "Dummy(Do not change)";
equation
  connect(thQfOut9.Q_flow, gain3.u) annotation (
    Line(points = {{65, 5}, {70, 5}, {73, 5}, {73, -5}, {78, -5}}));
  connect(Qf5, gain3.y) annotation (
    Line(points = {{125, -5}, {120, -5}, {106, -5}, {101, -5}}));
  connect(thQfOut10.Q_flow, gain4.u) annotation (
    Line(points = {{65, -70}, {70, -70}, {73, -70}, {73, -80}, {78, -80}}));
  connect(Qf3, gain4.y) annotation (
    Line(points = {{125, -80}, {120, -80}, {106, -80}, {101, -80}}));
  connect(thQfOut20.Q_flow, gain5.u) annotation (
    Line(points = {{65, -115}, {70, -115}, {73, -115}, {73, -125}, {78, -125}}));
  connect(Qf4, gain5.y) annotation (
    Line(points = {{125, -125}, {120, -125}, {106, -125}, {101, -125}}));
  connect(thQfOut8.Q_flow, gain6.u) annotation (
    Line(points = {{-55, 5}, {-60, 5}, {-68, 5}, {-68, -5}, {-73, -5}}));
  connect(Qf1, gain6.y) annotation (
    Line(points = {{-115, -5}, {-110, -5}, {-101, -5}, {-96, -5}}));
  connect(thQfOut7.Q_flow, gain7.u) annotation (
    Line(points = {{-55, -70}, {-60, -70}, {-68, -70}, {-68, -80}, {-73, -80}}));
  connect(Qf2, gain7.y) annotation (
    Line(points = {{-115, -80}, {-110, -80}, {-101, -80}, {-96, -80}}));
  connect(T4, thQfOut20.T) annotation (
    Line(points = {{125, -105}, {120, -105}, {70, -105}, {65, -105}}, thickness = 0));
  connect(T3, thQfOut10.T) annotation (
    Line(points = {{125, -60}, {120, -60}, {70, -60}, {65, -60}}, thickness = 0));
  connect(T5, thQfOut9.T) annotation (
    Line(points = {{125, 15}, {120, 15}, {70, 15}, {65, 15}}, thickness = 0));
  connect(v1, mstoKms1.u) annotation (
    Line(points = {{120, 80}, {115, 80}, {77, 80}, {72, 80}}, color = {0, 127, 0}, thickness = 0.0625));
  connect(T1, thQfOut8.T) annotation (
    Line(points = {{-115, 15}, {-110, 15}, {-60, 15}, {-55, 15}}, thickness = 0));
  connect(T2, thQfOut7.T) annotation (
    Line(points = {{-115, -60}, {-110, -60}, {-60, -60}, {-55, -60}}, thickness = 0));
  connect(mstoKms1.y, thermalRVsVehicleVTable.u[1]) annotation (
    Line(points = {{49, 80}, {44, 80}, {30, 80}, {30, 62}, {30, 57}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(thermalRVsVehicleV.fluid, caseHousingHeatCapacity.port) annotation (
    Line(points = {{20, 10}, {15, 10}, {0, 10}, {0, 25.3}, {0, 30.3}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(thermalRVsVehicleVTable.y[1], thermalRVsVehicleV.Rc) annotation (
    Line(points = {{30, 34}, {30, 29}, {30, 25}, {30, 20}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(thermalRVsVehicleV.solid, thQfOut9.port_a) annotation (
    Line(points = {{40, 10}, {45, 10}, {50.3, 10}, {55.3, 10}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(RtoEngine.port_a, caseHousingHeatCapacity.port) annotation (
    Line(points = {{-15, 10}, {-10, 10}, {0, 10}, {0, 25.3}, {0, 30.3}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(thQfOut8.port_a, RtoEngine.port_b) annotation (
    Line(points = {{-45.3, 10}, {-40.3, 10}, {-40, 10}, {-35, 10}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(RtoStartingDevice.port_a, caseHousingHeatCapacity.port) annotation (
    Line(points = {{-15, -65}, {-10, -65}, {0, -65}, {0, 25.3}, {0, 30.3}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(thQfOut7.port_a, RtoStartingDevice.port_b) annotation (
    Line(points = {{-45.3, -65}, {-40.3, -65}, {-40, -65}, {-35, -65}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(RtoOil.port_a, caseHousingHeatCapacity.port) annotation (
    Line(points = {{20, -110}, {15, -110}, {0, -110}, {0, 25.3}, {0, 30.3}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(thQfOut20.port_a, RtoOil.port_b) annotation (
    Line(points = {{55.3, -110}, {50.3, -110}, {45, -110}, {40, -110}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(RtoGear.port_a, caseHousingHeatCapacity.port) annotation (
    Line(points = {{20, -65}, {15, -65}, {0, -65}, {0, 25.3}, {0, 30.3}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(RtoGear.port_b, thQfOut10.port_a) annotation (
    Line(points = {{40, -65}, {45, -65}, {50.3, -65}, {55.3, -65}}, color = {191, 0, 0}, thickness = 0.0625));
  annotation (
    Icon(coordinateSystem(extent = {{-300, -100}, {300, 100}}), graphics = {Rectangle(fillPattern = FillPattern.None, extent = {{-300, 100}, {300, -100}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-190, 48}, {210, -30}}, origin = {-10, -10})}),
    experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
end CaseHousing;
