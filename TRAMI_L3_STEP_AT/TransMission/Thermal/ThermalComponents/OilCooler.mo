within TRAMI_L3_STEP_AT.TransMission.Thermal.ThermalComponents;
model OilCooler "Thermal model of Oil Cooler"
  // CP: 65001
  // SimulationX Version: 3.9.4.55045 x64
  constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  Blocks.Interfaces.TIn T2 "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{-45.1, 65}, {-25.1, 85}}), iconTransformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Blocks.Interfaces.TIn T1 "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{155.1, 65}, {135.1, 85}}), iconTransformation(extent = {{110, 40}, {90, 60}})));
  Blocks.Interfaces.QfOut Qf1 "Heat Flow Rate Output" annotation (
    Placement(transformation(extent = {{170, -20}, {190, 0}}), iconTransformation(extent = {{90, -60}, {110, -40}})));
  Blocks.Interfaces.QfOut Qf2 "Heat Flow Rate Output" annotation (
    Placement(transformation(extent = {{-30, -60}, {-50, -40}}), iconTransformation(origin = {50, 100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Blocks.Interfaces.CSigIn Vldot1 "Control Signal Input" annotation (
    Placement(transformation(extent = {{-125, 5}, {-105, 25}}), iconTransformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}})));
  Blocks.Interfaces.CSigIn Vldot2 "Control Signal Input" annotation (
    Placement(transformation(extent = {{-125, -30}, {-105, -10}}), iconTransformation(extent = {{-110, -60}, {-90, -40}})));
  Modelica.Blocks.Tables.CombiTable2D QfToWaterTable(tableOnFile = true, tableName = tableName, fileName = fileName) annotation (
    Placement(transformation(origin = {15, -15}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Math.Add TdiffWaterOil(k1 = -1, k2 = +1) annotation (
    Placement(transformation(origin = {40, 35}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Product QfToWater annotation (
    Placement(transformation(extent = {{55, -20}, {75, 0}})));
  Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
    Placement(transformation(extent = {{100, -20}, {120, 0}})));
  Modelica.Blocks.Math.Gain gain6(k(displayUnit = "1") = kDummy) "Output the product of a gain value with the input signal" annotation (
    Placement(transformation(extent = {{140, -20}, {160, 0}})));
  Modelica.Blocks.Math.Gain gain7(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{30, -60}, {10, -40}})));
  Blocks.M3sToLmin m3stoLmin1 annotation (
    Placement(transformation(extent = {{-55, 5}, {-35, 25}})));
  Blocks.M3sToLmin m3stoLmin2 "m3/s to l/min" annotation (
    Placement(transformation(extent = {{-55, -30}, {-35, -10}})));
  parameter String fileName = currDir + "/Tables/thResistanceOilColler1.txt" "FileName(QfToWaterTable)" annotation (
    specialFormat = 2);
  parameter String tableName = "thResistanceOilColler1" "TableName(QfToWaterTable)";
  parameter Real kDummy = 1 "Dummy(Do not change)";
equation
  connect(gain1.y, gain6.u) annotation (
    Line(points = {{121, -10}, {126, -10}, {133, -10}, {138, -10}}));
  connect(Qf1, gain6.y) annotation (
    Line(points = {{180, -10}, {175, -10}, {166, -10}, {161, -10}}));
  connect(Qf2, gain7.y) annotation (
    Line(points = {{-40, -50}, {-35, -50}, {4, -50}, {9, -50}}));
  connect(Vldot1, m3stoLmin1.u) annotation (
    Line(points = {{-115, 15}, {-110, 15}, {-62, 15}, {-57, 15}}, color = {0, 127, 0}, thickness = 0.0625));
  connect(Vldot2, m3stoLmin2.u) annotation (
    Line(points = {{-115, -20}, {-110, -20}, {-62, -20}, {-57, -20}}, color = {0, 127, 0}, thickness = 0.0625));
  connect(QfToWaterTable.u2, m3stoLmin2.y) annotation (
    Line(points = {{3, -21}, {-2, -21}, {-29, -21}, {-29, -20}, {-34, -20}}));
  connect(QfToWaterTable.u1, m3stoLmin1.y) annotation (
    Line(points = {{3, -9}, {-2, -9}, {-29, -9}, {-29, 15}, {-34, 15}}));
  connect(QfToWater.y, gain7.u) annotation (
    Line(points = {{76, -10}, {81, -10}, {81, -50}, {37, -50}, {32, -50}}));
  connect(gain1.u, QfToWater.y) annotation (
    Line(points = {{98, -10}, {93, -10}, {81, -10}, {76, -10}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(QfToWaterTable.y, QfToWater.u2) annotation (
    Line(points = {{26, -15}, {31, -15}, {48, -15}, {48, -16}, {53, -16}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(T1, TdiffWaterOil.u2) annotation (
    Line(points = {{145, 75}, {140, 75}, {46, 75}, {46, 52}, {46, 47}}, thickness = 0));
  connect(T2, TdiffWaterOil.u1) annotation (
    Line(points = {{-35, 75}, {-30, 75}, {34, 75}, {34, 52}, {34, 47}}, thickness = 0));
  connect(QfToWater.u1, TdiffWaterOil.y) annotation (
    Line(points = {{53, -4}, {48, -4}, {40, -4}, {40, 19}, {40, 24}}, color = {0, 0, 127}, thickness = 0.0625));
  annotation (
    experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-1, 0}, extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
end OilCooler;
