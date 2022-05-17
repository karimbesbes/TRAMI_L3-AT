within TRAMI_L3_STEP_AT.TransMission.Thermal.ThermalComponents;
model Oil "Thermal model of Oil"
  // CP: 65001
  // SimulationX Version: 3.9.3.54687 x64
  Blocks.Interfaces.ESigOut nu "Exernal Signal Output" annotation (
    Placement(transformation(extent = {{195, -55.1}, {215, -35.1}}), iconTransformation(origin = {250, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Blocks.Interfaces.ESigOut rho "Exernal Signal Output" annotation (
    Placement(transformation(extent = {{150, -80.09999999999999}, {170, -60.1}}), iconTransformation(origin = {300, 0}, extent = {{-10, -10}, {10, 10}})));
  Blocks.Interfaces.QfIn Qf3 "Heat Flow Rate Input" annotation (
    Placement(transformation(extent = {{-150, 60}, {-130, 80}}), iconTransformation(origin = {50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Blocks.Interfaces.QfIn Qf4 "Heat Flow Rate Input" annotation (
    Placement(transformation(extent = {{-150, -20}, {-130, 0}}), iconTransformation(extent = {{-310, -60}, {-290, -40}})));
  Blocks.Interfaces.TOut T3 "Temperature Output" annotation (
    Placement(transformation(extent = {{-130, 85}, {-150, 105}}), iconTransformation(origin = {-50, 100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Blocks.Interfaces.TOut T4 "Temperature Output" annotation (
    Placement(transformation(extent = {{-130.1, -5}, {-150.1, 15}}), iconTransformation(extent = {{-290, 40}, {-310, 60}})));
  Blocks.Interfaces.TIn T1 "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{-150, 35}, {-130, 55}}), iconTransformation(origin = {-250, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Blocks.Interfaces.QfOut Qf1 "Heat Flow Rate Output" annotation (
    Placement(transformation(extent = {{-130, 20}, {-150, 40}}), iconTransformation(origin = {-150, 100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Blocks.Interfaces.TIn T2 "Temperatue Signal Input" annotation (
    Placement(transformation(extent = {{120, 70}, {100, 90}}), iconTransformation(origin = {150, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Blocks.Interfaces.QfOut Qf2 "Heat Flow Rate Output" annotation (
    Placement(transformation(extent = {{100, 50}, {120, 70}}), iconTransformation(origin = {250, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -270)));
  Blocks.Interfaces.ESigOut T5 "Exernal Signal Output" annotation (
    Placement(transformation(extent = {{150, -15}, {170, 5}}), iconTransformation(extent = {{290, 40}, {310, 60}})));
  Blocks.Interfaces.ESigIn Qf5 "External Signal Input" annotation (
    Placement(transformation(extent = {{170, 30}, {150, 50}}), iconTransformation(extent = {{310, -60}, {290, -40}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoGear(R = R2) annotation (
    Placement(transformation(origin = {15, 75}, extent = {{10, 10}, {-10, -10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor RtoStartingDevice(R = R1) annotation (
    Placement(transformation(origin = {-35, 40}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Tables.CombiTable1D nuTable(table = Nutable) annotation (
    Placement(transformation(extent = {{65, -55}, {85, -35}})));
  Adaptors.ThTout thTout3 annotation (
    Placement(transformation(origin = {-65, 75}, extent = {{-5, -10}, {5, 10}})));
  Adaptors.ThTout thTout7 annotation (
    Placement(transformation(origin = {-65, -5}, extent = {{-5, -10}, {5, 10}})));
  Adaptors.ThQfOut thQfOut6 annotation (
    Placement(transformation(extent = {{-70, 30}, {-60, 50}})));
  Adaptors.ThQfOut thQfOut16 annotation (
    Placement(transformation(extent = {{45, 65}, {35, 85}})));
  PhysicalElements.HeatCapacitorInitT oilHeatCapacity(C = C, T(displayUnit = "K", fixed = true, start = T0)) annotation (
    Placement(transformation(extent = {{-20, 90}, {0, 110}})));
  Modelica.Blocks.Tables.CombiTable1D rhoTable(table = RhoTable) annotation (
    Placement(transformation(extent = {{65, -80}, {85, -60}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow QfFrMechControl annotation (
    Placement(transformation(extent = {{75, 30}, {55, 50}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor oilT annotation (
    Placement(transformation(extent = {{5, -15}, {25, 5}})));
  parameter PhysicalElements.ThermodynamicTemperature T0 = 298.14999999999998 "Initial Temperature";
  Modelica.Blocks.Math.Gain gain4(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{100, -15}, {120, 5}})));
  Modelica.Blocks.Math.Gain gain5(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{150, -55}, {170, -35}})));
  Modelica.Blocks.Math.Gain gain6(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{110, -80}, {130, -60}})));
  Modelica.Blocks.Math.Gain gain7(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{-100, 85}, {-120, 105}})));
  Modelica.Blocks.Math.Gain gain8(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{-100, 20}, {-120, 40}})));
  Modelica.Blocks.Math.Gain gain9(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{-95, -5}, {-115, 15}})));
  Modelica.Blocks.Math.Gain gain10(k(displayUnit = "1") = kDummy) annotation (
    Placement(transformation(extent = {{70, 50}, {90, 70}})));
  Blocks.Mm2sTom2s mm2stom2s1 annotation (
    Placement(transformation(extent = {{110, -55}, {130, -35}})));
  parameter Modelica.SIunits.HeatCapacity C = 10000 "Heat capacity(oilHeatCapacity)";
  parameter Modelica.SIunits.ThermalResistance R1 = 0.0007 "Thermal resistance to/from StartingDevice(RtoStartingDevice)";
  parameter Modelica.SIunits.ThermalResistance R2 = 0.05 "Thermal resistance to/from Gear(RtoGear)";
  parameter Real Nutable[:, :] = {{-30, 70}, {0, 70}, {20, 70}, {40, 40}, {60, 23}, {80, 13}, {100, 7.5}, {120, 7.5}} "Table(e.g., {Temperature,Kinematic Viscosity}) (nuTable)";
  parameter Real RhoTable[:, :] = {{-30, 70}, {0, 70}, {20, 70}, {40, 40}, {60, 23}, {80, 13}, {100, 7.5}, {120, 7.5}} "Table (e.g., table=[0,2]) (rhoTable)";
  parameter Real kDummy = 1 "Dummy(Do not change)";
  Blocks.KelvinToCelcius kelvinToCelcius1 annotation (
    Placement(transformation(origin = {40, -25}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(T5, gain4.y) annotation (
    Line(points = {{160, -5}, {155, -5}, {126, -5}, {121, -5}}));
  connect(nu, gain5.y) annotation (
    Line(points = {{205, -45}, {200, -45}, {176, -45}, {171, -45}}));
  connect(rho, gain6.y) annotation (
    Line(points = {{160, -70}, {155, -70}, {136, -70}, {131, -70}}));
  connect(thTout3.T, gain7.u) annotation (
    Line(points = {{-70, 80}, {-75, 80}, {-93, 80}, {-93, 95}, {-98, 95}}));
  connect(T3, gain7.y) annotation (
    Line(points = {{-140, 95}, {-135, 95}, {-126, 95}, {-121, 95}}));
  connect(thQfOut6.Q_flow, gain8.u) annotation (
    Line(points = {{-70, 35}, {-75, 35}, {-93, 35}, {-93, 30}, {-98, 30}}));
  connect(Qf1, gain8.y) annotation (
    Line(points = {{-140, 30}, {-135, 30}, {-126, 30}, {-121, 30}}));
  connect(thTout7.T, gain9.u) annotation (
    Line(points = {{-70, 0}, {-75, 0}, {-88, 0}, {-88, 5}, {-93, 5}}));
  connect(T4, gain9.y) annotation (
    Line(points = {{-140, 5}, {-135, 5}, {-121, 5}, {-116, 5}}));
  connect(thQfOut16.Q_flow, gain10.u) annotation (
    Line(points = {{45, 70}, {50, 70}, {63, 70}, {63, 60}, {68, 60}}));
  connect(Qf2, gain10.y) annotation (
    Line(points = {{110, 60}, {105, 60}, {96, 60}, {91, 60}}));
  connect(gain5.u, mm2stom2s1.y) annotation (
    Line(points = {{148, -45}, {143, -45}, {136, -45}, {131, -45}}));
  connect(Qf3, thTout3.Q_flow) annotation (
    Line(points = {{-140, 70}, {-135, 70}, {-75, 70}, {-70, 70}}, thickness = 0));
  connect(T1, thQfOut6.T) annotation (
    Line(points = {{-140, 45}, {-135, 45}, {-75, 45}, {-70, 45}}, thickness = 0));
  connect(Qf4, thTout7.Q_flow) annotation (
    Line(points = {{-140, -10}, {-135, -10}, {-75, -10}, {-70, -10}}, thickness = 0));
  connect(T2, thQfOut16.T) annotation (
    Line(points = {{110, 80}, {105, 80}, {50, 80}, {45, 80}}, thickness = 0));
  connect(oilHeatCapacity.port, thTout3.port_a) annotation (
    Line(points = {{-10, 90.3}, {-10, 85.3}, {-10, 75}, {-55.3, 75}, {-60.3, 75}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(oilHeatCapacity.port, thTout7.port_a) annotation (
    Line(points = {{-10, 90.3}, {-10, 85.3}, {-10, -5}, {-55.3, -5}, {-60.3, -5}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(RtoStartingDevice.port_a, oilHeatCapacity.port) annotation (
    Line(points = {{-25, 40}, {-20, 40}, {-10, 40}, {-10, 85.3}, {-10, 90.3}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(thQfOut6.port_a, RtoStartingDevice.port_b) annotation (
    Line(points = {{-60.3, 40}, {-55.3, 40}, {-50, 40}, {-45, 40}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(RtoGear.port_a, oilHeatCapacity.port) annotation (
    Line(points = {{5, 75}, {0, 75}, {-10, 75}, {-10, 85.3}, {-10, 90.3}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(thQfOut16.port_a, RtoGear.port_b) annotation (
    Line(points = {{35.3, 75}, {30.3, 75}, {30, 75}, {25, 75}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(QfFrMechControl.Q_flow, Qf5) annotation (
    Line(points = {{75, 40}, {80, 40}, {155, 40}, {160, 40}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(QfFrMechControl.port, oilHeatCapacity.port) annotation (
    Line(points = {{55, 40}, {50, 40}, {-10, 40}, {-10, 85.3}, {-10, 90.3}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(oilT.T, gain4.u) annotation (
    Line(points = {{25, -5}, {30, -5}, {93, -5}, {98, -5}}));
  connect(oilT.port, oilHeatCapacity.port) annotation (
    Line(points = {{5, -5}, {0, -5}, {-10, -5}, {-10, 85.3}, {-10, 90.3}}, color = {191, 0, 0}, thickness = 0.0625));
  connect(nuTable.y[1], mm2stom2s1.u) annotation (
    Line(points = {{86, -45}, {91, -45}, {103, -45}, {108, -45}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(rhoTable.y[1], gain6.u) annotation (
    Line(points = {{86, -70}, {91, -70}, {103, -70}, {108, -70}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(kelvinToCelcius1.u, oilT.T) annotation (
    Line(points = {{40, -13}, {40, -8}, {40, -5}, {30, -5}, {25, -5}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(nuTable.u[1], kelvinToCelcius1.y) annotation (
    Line(points = {{63, -45}, {58, -45}, {40, -45}, {40, -41}, {40, -36}}, color = {0, 0, 127}, thickness = 0.0625));
  connect(rhoTable.u[1], kelvinToCelcius1.y) annotation (
    Line(points = {{63, -70}, {58, -70}, {40, -70}, {40, -41}, {40, -36}}, color = {0, 0, 127}, thickness = 0.0625));
  annotation (
    Icon(coordinateSystem(extent = {{-300, -100}, {300, 100}}), graphics = {Rectangle(fillPattern = FillPattern.None, extent = {{-300, 100}, {300, -100}}), Text(textString = "%name", fillPattern = FillPattern.None, extent = {{-200, 40}, {200, -40}})}),
    experiment(StopTime = 1, StartTime = 0, Interval = 0.002, MaxInterval = "0.001"));
end Oil;
