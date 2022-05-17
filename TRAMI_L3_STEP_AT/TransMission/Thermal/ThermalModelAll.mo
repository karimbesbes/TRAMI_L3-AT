within TRAMI_L3_STEP_AT.TransMission.Thermal;
model ThermalModelAll "ThermalModelAll"
  constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  // CP: 65001
  // SimulationX Version: 3.9.3.54687 x64
  Blocks.Interfaces.TIn TinENtoCH "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{-20, 0}, {20, 40}}), iconTransformation(extent = {{-145, -170}, {-105, -130}})));
  Blocks.Interfaces.TIn TinENtoSD "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{-55, -145}, {-15, -105}}), iconTransformation(extent = {{-145, -120}, {-105, -80}})));
  Blocks.Interfaces.TIn TinTStoOC "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{-130, -280}, {-90, -240}}), iconTransformation(extent = {{-145, -420}, {-105, -380}})));
  Blocks.Interfaces.TIn TinAirtoCH "Temperatue Signal Input" annotation (
    Placement(transformation(origin = {175, 20}, extent = {{20, -20}, {-20, 20}}), iconTransformation(origin = {-125, -50}, extent = {{20, -20}, {-20, 20}}, rotation = 180)));
  Blocks.Interfaces.CSigIn VIdot1OilCooler "Control Signal Input" annotation (
    Placement(transformation(extent = {{-150, -305}, {-110, -265}}), iconTransformation(extent = {{-145, -370}, {-105, -330}})));
  Blocks.Interfaces.CSigIn VIdot2OilCooler "Control Signal Input" annotation (
    Placement(transformation(extent = {{-150, -335}, {-110, -295}}), iconTransformation(extent = {{-145, -320}, {-105, -280}})));
  Blocks.Interfaces.ESigIn QfGear "External Signal Input" annotation (
    Placement(transformation(origin = {285, -130}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{-145, 130}, {-105, 170}})));
  Blocks.Interfaces.ESigIn QfOil "External Signal Input" annotation (
    Placement(transformation(origin = {180, -295}, extent = {{20, -20}, {-20, 20}}), iconTransformation(origin = {-125, 100}, extent = {{20, -20}, {-20, 20}}, rotation = -180)));
  Blocks.Interfaces.ESigIn QfStartDevice "External Signal Input" annotation (
    Placement(transformation(origin = {102, -125}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{-145, 180}, {-105, 220}})));
  Blocks.Interfaces.CSigIn vCaseHousing "Control Signal Input" annotation (
    Placement(transformation(origin = {165, 70}, extent = {{20, -20}, {-20, 20}}), iconTransformation(origin = {-125, 0}, extent = {{20, -20}, {-20, 20}}, rotation = -180)));
  Blocks.Interfaces.QfOut QfOutCHtoEN "Heat Flow Rate Signal Output" annotation (
    Placement(transformation(origin = {20, 50}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{-105, -220}, {-145, -180}})));
  Blocks.Interfaces.QfOut QfOutSDtoEN "Heat Flow Rate Signal Output" annotation (
    Placement(transformation(origin = {-15, -145}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{101.7, 380}, {141.7, 420}})));
  Blocks.Interfaces.QfOut QfOutOCtoTS "Heat Flow Rate Signal Output" annotation (
    Placement(transformation(extent = {{-5, -280}, {35, -240}}), iconTransformation(origin = {121.7, 350}, extent = {{20, -20}, {-20, 20}}, rotation = 180)));
  Blocks.Interfaces.ESigOut nuOil "External Signal Output" annotation (
    Placement(transformation(extent = {{170, -355}, {210, -315}}), iconTransformation(origin = {-125, 300}, extent = {{-20, -20}, {20, 20}}, rotation = -180)));
  Blocks.Interfaces.ESigOut rhoOil "External Signal Output" annotation (
    Placement(transformation(extent = {{190, -290}, {230, -250}}), iconTransformation(origin = {-125, 350}, extent = {{-20, -20}, {20, 20}}, rotation = -180)));
  Blocks.Interfaces.ESigOut ToutOil "External Signal Output" annotation (
    Placement(transformation(extent = {{190, -260}, {230, -220}}), iconTransformation(origin = {121.7, 250}, extent = {{-20, -20}, {20, 20}})));
  Blocks.Interfaces.QfOut QfOutCHtoAir "Heat Flow Rate Signal Output" annotation (
    Placement(transformation(extent = {{230, 25}, {270, 65}}), iconTransformation(origin = {121.7, -150}, extent = {{20, -20}, {-20, 20}}, rotation = 180)));
  Blocks.Interfaces.TOut ToutOiltoOC "Temperature Signal Output" annotation (
    Placement(transformation(extent = {{50, -340}, {90, -300}}), iconTransformation(origin = {121.7, 200}, extent = {{-20, -20}, {20, 20}})));
  Blocks.Interfaces.QfOut QfOutOCtoOil "Heat Flow Rate Signal Output" annotation (
    Placement(transformation(extent = {{30, -370}, {70, -330}}), iconTransformation(origin = {121.7, -200}, extent = {{-20, -20}, {20, 20}})));
  Blocks.Interfaces.TOut ToutSDtoOil "Temperature Signal Output" annotation (
    Placement(transformation(origin = {-45, -185}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{101.7, 130}, {141.7, 170}})));
  Blocks.Interfaces.QfOut QfOutOiltoSD "Heat Flow Rate Signal Output" annotation (
    Placement(transformation(origin = {-25, -215}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{101.7, -270}, {141.7, -230}})));
  Blocks.Interfaces.TOut ToutSDtoCH "Temperature Signal Output" annotation (
    Placement(transformation(origin = {-45, -40}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{101.7, 80}, {141.7, 120}})));
  Blocks.Interfaces.QfOut QfOutCHtoSD "Heat Flow Rate Signal Output" annotation (
    Placement(transformation(origin = {-25, -70}, extent = {{20, -20}, {-20, 20}}), iconTransformation(extent = {{101.7, -320}, {141.7, -280}})));
  Blocks.Interfaces.TOut ToutOiltoCH "Temperature Signal Output" annotation (
    Placement(transformation(extent = {{145, -90}, {185, -50}}), iconTransformation(extent = {{101.7, 30}, {141.7, 70}})));
  Blocks.Interfaces.QfOut QfoutCHtoOil "Heat Flow Rate Signal Output" annotation (
    Placement(transformation(extent = {{165, -60}, {205, -20}}), iconTransformation(extent = {{101.7, -370}, {141.7, -330}})));
  Blocks.Interfaces.QfOut QfOiltoGear "Heat Flow Rate Signal Output" annotation (
    Placement(transformation(extent = {{295, -190}, {335, -150}}), iconTransformation(extent = {{101.7, -420}, {141.7, -380}})));
  Blocks.Interfaces.TOut ToutGeartoOil "Temperature Signal Output" annotation (
    Placement(transformation(extent = {{275, -215}, {315, -175}}), iconTransformation(extent = {{101.7, -20}, {141.7, 20}})));
  Blocks.Interfaces.TOut ToutGeartoCH "Temperature Signal Output" annotation (
    Placement(transformation(extent = {{275, -100}, {315, -60}}), iconTransformation(extent = {{101.7, -70}, {141.7, -30}})));
  Blocks.Interfaces.QfOut QfOutCHtoGear "Heat Flow Rate Signal Output" annotation (
    Placement(transformation(extent = {{295, -70}, {335, -30}}), iconTransformation(extent = {{101.7, -470}, {141.7, -430}})));
  ThermalComponents.StartDevice startDevice(C = c1, T0 = T0, R = R1) annotation (
    Placement(transformation(extent = {{40, -140}, {60, -120}})));
  ThermalComponents.CaseHousing caseHousing(C = c2, T0 = T1, R1 = R2, R2 = R3, R3 = R4, R4 = R5, table = table1) annotation (
    Placement(transformation(extent = {{75, 15}, {135, 35}})));
  ThermalComponents.Gear gear(C = c3, T0 = T2) annotation (
    Placement(transformation(extent = {{220, -140}, {240, -120}})));
  ThermalComponents.OilCooler oilCooler annotation (
    Placement(transformation(extent = {{-60, -300}, {-40, -280}})));
  /*(fileName = fileName1, tableName = tableName1)*/
  ThermalComponents.Oil oil(T0 = T3, C = c4, R1 = R6, R2 = R7, Nutable = Nutable1, RhoTable = RhoTable1) annotation (
    Placement(transformation(extent = {{75, -300}, {135, -280}})));
  Modelica.Blocks.Math.Gain gain1(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{50, 40}, {30, 60}})));
  Modelica.Blocks.Math.Gain gain2(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{20, -155}, {0, -135}})));
  Modelica.Blocks.Math.Gain gain3(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{-30, -270}, {-10, -250}})));
  Modelica.Blocks.Math.Gain gain4(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{150, -345}, {170, -325}})));
  Modelica.Blocks.Math.Gain gain5(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{170, -250}, {190, -230}})));
  Modelica.Blocks.Math.Gain gain6(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{170, -280}, {190, -260}})));
  Modelica.Blocks.Math.Gain gain7(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{195, 35}, {215, 55}})));
  Modelica.Blocks.Math.Gain gain8(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{25, -330}, {45, -310}})));
  Modelica.Blocks.Math.Gain gain9(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{5, -360}, {25, -340}})));
  Modelica.Blocks.Math.Gain gain10(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{5, -195}, {-15, -175}})));
  Modelica.Blocks.Math.Gain gain11(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{25, -225}, {5, -205}})));
  Modelica.Blocks.Math.Gain gain12(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{5, -50}, {-15, -30}})));
  Modelica.Blocks.Math.Gain gain13(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{25, -80}, {5, -60}})));
  Modelica.Blocks.Math.Gain gain14(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{145, -50}, {165, -30}})));
  Modelica.Blocks.Math.Gain gain15(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{125, -80}, {145, -60}})));
  Modelica.Blocks.Math.Gain gain16(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{250, -205}, {270, -185}})));
  Modelica.Blocks.Math.Gain gain17(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{275, -180}, {295, -160}})));
  Modelica.Blocks.Math.Gain gain18(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{275, -60}, {295, -40}})));
  Modelica.Blocks.Math.Gain gain19(k(displayUnit = "1") = kDammy) annotation (
    Placement(transformation(extent = {{250, -90}, {270, -70}})));
  parameter Modelica.SIunits.HeatCapacity c1 = 5000 "Heat capacity(startDeviceHeatCapacity) (startDevice)";
  parameter PhysicalElements.ThermodynamicTemperature T0(displayUnit = "degC") = 298.14999999999998 "Initial Temperature(startDeviceHeatCapacity) (startDevice)";
  parameter Modelica.SIunits.ThermalResistance R1 = 100 "Thermal resistance to/from Engine(RtoEngine) (startDevice)";
  parameter PhysicalElements.ThermodynamicTemperature T1(displayUnit = "degC") = 298.14999999999998 "Initial Temperature(caseHousingHeatCapacity) (caseHousing)";
  parameter Modelica.SIunits.ThermalResistance R2 = 0.1 "Thermal resistance to/from Engine(RtoEngine) (caseHousing)";
  parameter Modelica.SIunits.ThermalResistance R3 = 100 "Thermal resistance to/from StartingDevice(RtoStartingDevice) (caseHousing)";
  parameter Modelica.SIunits.ThermalResistance R4 = 100 "Thermal resistance to/from Gear(RtoGear) (caseHousing)";
  parameter Modelica.SIunits.ThermalResistance R5 = 0.006 "Thermal resistance to/from Oil(RtoOil) (caseHousing)";
  parameter Real table1[:, :] = {{0, 0.022}, {10, 0.021}, {20, 0.021}, {30, 0.02}, {40, 0.019}, {50, 0.018}, {60, 0.017}, {70, 0.016}, {80, 0.015}, {90, 0.014}, {100, 0.013}, {110, 0.012}, {120, 0.012}, {130, 0.011}, {140, 0.011}, {150, 0.01}, {160, 0.01}} "Table(e.g., table={velocity,thermalResistance}) (thermalRVsVehicleVTable) (caseHousing)";
  parameter Modelica.SIunits.HeatCapacity c3 = 15000 "Heat capacity(gearHeatCapacity) (gear)";
  parameter PhysicalElements.ThermodynamicTemperature T2(displayUnit = "degC") = 298.14999999999998 "Initial Temperature(gearHeatCapacity) (gear)";
  parameter String fileName1 = currDir + "/Tables/thResistanceOilColler1.txt" "FileName(QfToWaterTable) (oilCooler)";
  parameter String tableName1 = "thResistanceOilColler1" "TableName(QfToWaterTable) (oilCooler)";
  parameter PhysicalElements.ThermodynamicTemperature T3(displayUnit = "degC") = 298.14999999999998 "Initial Temperature (oil)";
  parameter Modelica.SIunits.HeatCapacity c4 = 10000 "Heat capacity(oilHeatCapacity) (oil)";
  parameter Modelica.SIunits.ThermalResistance R6 = 0.0007 "Thermal resistance to/from StartingDevice(RtoStartingDevice) (oil)";
  parameter Modelica.SIunits.ThermalResistance R7 = 0.05 "Thermal resistance to/from Gear(RtoGear) (oil)";
  parameter Real Nutable1[:, :] = {{-30, 70}, {0, 70}, {20, 70}, {40, 40}, {60, 23}, {80, 13}, {100, 7.5}, {120, 7.5}} "Table(e.g., {Temperature,Kinematic Viscosity}) (nuTable) (oil)";
  parameter Real RhoTable1[:, :] = {{-30, 70}, {0, 70}, {20, 70}, {40, 40}, {60, 23}, {80, 13}, {100, 7.5}, {120, 7.5}} "Table (e.g., table=[0,2]) (rhoTable) (oil)";
  parameter Real kDammy = 1 "Parameter";
  parameter Modelica.SIunits.HeatCapacity c2 = 30000 "Heat capacity(caseHousingHeatCapacity) (caseHousing)";
equation
  connect(QfOil, oil.Qf5) annotation (
    Line(points = {{180, -295}, {175, -295}, {140, -295}, {135, -295}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(gain6.y, rhoOil) annotation (
    Line(points = {{191, -270}, {196, -270}, {205, -270}, {210, -270}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain11.y, QfOutOiltoSD) annotation (
    Line(points = {{4, -215}, {-1, -215}, {-20, -215}, {-25, -215}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain10.y, ToutSDtoOil) annotation (
    Line(points = {{-16, -185}, {-21, -185}, {-40, -185}, {-45, -185}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(QfOutSDtoEN, gain2.y) annotation (
    Line(points = {{-15, -145}, {-10, -145}, {-6, -145}, {-1, -145}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain13.y, QfOutCHtoSD) annotation (
    Line(points = {{4, -70}, {-1, -70}, {-20, -70}, {-25, -70}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain12.y, ToutSDtoCH) annotation (
    Line(points = {{-16, -40}, {-21, -40}, {-40, -40}, {-45, -40}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(QfGear, gear.Qf3) annotation (
    Line(points = {{285, -130}, {280, -130}, {245, -130}, {240, -130}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(vCaseHousing, caseHousing.v1) annotation (
    Line(points = {{165, 70}, {160, 70}, {125, 70}, {125, 40}, {125, 35}}, color = {0, 127, 0}, thickness = 0.0625));
  connect(caseHousing.T5, TinAirtoCH) annotation (
    Line(points = {{135, 20}, {140, 20}, {170, 20}, {175, 20}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(QfStartDevice, startDevice.Qf4) annotation (
    Line(points = {{102, -125}, {97, -125}, {65, -125}, {60, -125}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(gain1.y, QfOutCHtoEN) annotation (
    Line(points = {{29, 50}, {24, 50}, {25, 50}, {20, 50}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain19.y, ToutGeartoCH) annotation (
    Line(points = {{271, -80}, {276, -80}, {290, -80}, {295, -80}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain18.y, QfOutCHtoGear) annotation (
    Line(points = {{296, -50}, {301, -50}, {310, -50}, {315, -50}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain18.u, caseHousing.Qf3) annotation (
    Line(points = {{273, -50}, {235, -50}, {235, 5}, {130, 5}, {130, 15}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain19.u, gear.T1) annotation (
    Line(points = {{248, -80}, {225, -80}, {225, -120}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain16.y, ToutGeartoOil) annotation (
    Line(points = {{271, -195}, {276, -195}, {290, -195}, {295, -195}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain17.y, QfOiltoGear) annotation (
    Line(points = {{296, -170}, {301, -170}, {310, -170}, {315, -170}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain17.u, oil.Qf2) annotation (
    Line(points = {{273, -170}, {235, -170}, {235, -220}, {130, -220}, {130, -280}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain16.u, gear.T2) annotation (
    Line(points = {{248, -195}, {225, -195}, {225, -140}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(ToutOiltoCH, gain15.y) annotation (
    Line(points = {{165, -70}, {160, -70}, {151, -70}, {146, -70}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain14.y, QfoutCHtoOil) annotation (
    Line(points = {{166, -40}, {171, -40}, {180, -40}, {185, -40}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain14.u, caseHousing.Qf4) annotation (
    Line(points = {{143, -40}, {110, -40}, {110, 15}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain15.u, oil.T3) annotation (
    Line(points = {{123, -70}, {100, -70}, {100, -280}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain13.u, caseHousing.Qf2) annotation (
    Line(points = {{27, -70}, {55, -70}, {55, 0}, {90, 0}, {90, 15}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain12.u, startDevice.T2) annotation (
    Line(points = {{7, -40}, {45, -40}, {45, -120}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain11.u, oil.Qf1) annotation (
    Line(points = {{27, -215}, {27, -215}, {55, -215}, {55, -270}, {90, -270}, {90, -275}, {90, -280}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain10.u, startDevice.T3) annotation (
    Line(points = {{7, -185}, {12, -185}, {45, -185}, {45, -145}, {45, -140}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain9.y, QfOutOCtoOil) annotation (
    Line(points = {{26, -350}, {31, -350}, {45, -350}, {50, -350}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain8.y, ToutOiltoOC) annotation (
    Line(points = {{46, -320}, {51, -320}, {65, -320}, {70, -320}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain9.u, oilCooler.Qf1) annotation (
    Line(points = {{3, -350}, {-2, -350}, {-10, -350}, {-10, -295}, {-40, -295}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain8.u, oil.T4) annotation (
    Line(points = {{23, -320}, {5, -320}, {5, -285}, {70, -285}, {75, -285}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain7.y, QfOutCHtoAir) annotation (
    Line(points = {{216, 45}, {221, 45}, {245, 45}, {250, 45}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain7.u, caseHousing.Qf5) annotation (
    Line(points = {{193, 45}, {188, 45}, {140, 45}, {140, 30}, {135, 30}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(ToutOil, gain5.y) annotation (
    Line(points = {{210, -240}, {205, -240}, {196, -240}, {191, -240}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(gain6.u, oil.rho) annotation (
    Line(points = {{168, -270}, {163, -270}, {150, -270}, {150, -290}, {135, -290}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain5.u, oil.T5) annotation (
    Line(points = {{168, -240}, {163, -240}, {140, -240}, {140, -285}, {135, -285}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(caseHousing.T2, startDevice.T2) annotation (
    Line(points = {{80, 15}, {80, 10}, {80, 5}, {45, 5}, {45, -120}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(caseHousing.Qf2, startDevice.Qf2) annotation (
    Line(points = {{90, 15}, {90, 10}, {90, 0}, {55, 0}, {55, -120}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(caseHousing.T4, oil.T3) annotation (
    Line(points = {{100, 15}, {100, 10}, {100, -275}, {100, -280}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(caseHousing.Qf4, oil.Qf3) annotation (
    Line(points = {{110, 15}, {110, 10}, {110, -275}, {110, -280}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(caseHousing.T3, gear.T1) annotation (
    Line(points = {{120, 15}, {120, 10}, {120, 0}, {225, 0}, {225, -120}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(caseHousing.Qf3, gear.Qf1) annotation (
    Line(points = {{130, 15}, {130, 10}, {130, 5}, {235, 5}, {235, -120}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(caseHousing.T1, TinENtoCH) annotation (
    Line(points = {{75, 20}, {70, 20}, {5, 20}, {0, 20}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(caseHousing.Qf1, gain1.u) annotation (
    Line(points = {{75, 30}, {70, 30}, {65, 30}, {65, 50}, {52, 50}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gear.T2, oil.T2) annotation (
    Line(points = {{225, -140}, {225, -145}, {225, -215}, {120, -215}, {120, -280}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(gear.Qf2, oil.Qf2) annotation (
    Line(points = {{235, -140}, {235, -145}, {235, -220}, {130, -220}, {130, -280}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(startDevice.T3, oil.T1) annotation (
    Line(points = {{45, -140}, {45, -145}, {45, -275}, {80, -275}, {80, -280}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(startDevice.Qf3, oil.Qf1) annotation (
    Line(points = {{55, -140}, {55, -145}, {55, -270}, {90, -270}, {90, -280}}, color = {0, 0, 127}, thickness = 0.0625),
    AutoRoute = false);
  connect(startDevice.T1, TinENtoSD) annotation (
    Line(points = {{40, -125}, {35, -125}, {-30, -125}, {-35, -125}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain2.u, startDevice.Qf1) annotation (
    Line(points = {{22, -145}, {27, -145}, {35, -145}, {35, -135}, {40, -135}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(oil.T4, oilCooler.T1) annotation (
    Line(points = {{75, -285}, {70, -285}, {-35, -285}, {-40, -285}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(oil.Qf4, oilCooler.Qf1) annotation (
    Line(points = {{75, -295}, {70, -295}, {-35, -295}, {-40, -295}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(TinTStoOC, oilCooler.T2) annotation (
    Line(points = {{-110, -260}, {-105, -260}, {-55, -260}, {-55, -275}, {-55, -280}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(oilCooler.Vldot1, VIdot1OilCooler) annotation (
    Line(points = {{-60, -285}, {-65, -285}, {-125, -285}, {-130, -285}}, color = {0, 127, 0}, thickness = 0.0625));
  connect(oilCooler.Vldot2, VIdot2OilCooler) annotation (
    Line(points = {{-60, -295}, {-65, -295}, {-80, -295}, {-80, -315}, {-130, -315}}, color = {0, 127, 0}, thickness = 0.0625),
    AutoRoute = false);
  connect(gain3.u, oilCooler.Qf2) annotation (
    Line(points = {{-32, -260}, {-37, -260}, {-45, -260}, {-45, -275}, {-45, -280}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain4.u, oil.nu) annotation (
    Line(points = {{148, -335}, {143, -335}, {130, -335}, {130, -305}, {130, -300}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain4.y, nuOil) annotation (
    Line(points = {{171, -335}, {176, -335}, {185, -335}, {190, -335}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(gain3.y, QfOutOCtoTS) annotation (
    Line(points = {{-9, -260}, {-4, -260}, {10, -260}, {15, -260}}, color = {0, 0, 127}, thickness = 0.0625));
  annotation (
    Icon(coordinateSystem(extent = {{-125, -500}, {125, 500}}), graphics={  Rectangle(
            fillPattern =                                                                           FillPattern.None, extent = {{-125, 500}, {125, -500}}, origin = {3, -3}), Text(textString = "%name",
            fillPattern =                                                                                                                                                                                              FillPattern.None, extent = {{-447, 55}, {447, -55}}, origin = {-11, 13}, rotation = 90)}),
    experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"),
    Diagram(coordinateSystem(extent = {{-160, -400}, {360, 100}})),
    __OpenModelica_commandLineOptions = "");
end ThermalModelAll;
