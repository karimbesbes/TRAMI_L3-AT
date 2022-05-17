within TRAMI_L3_STEP_AT.TransMission.Mechanics;
model TransmissionLoss
  constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter Real Oil_Viscosity_Breakpoint[:] = {4.1e-6, 6.0e-6, 9.7e-6, 18.0e-6, 39.4e-6};
  parameter String Loss_TorqueDependent_Filename_rev, Loss_TorqueDependent_Filename_1st, Loss_TorqueDependent_Filename_2nd, Loss_TorqueDependent_Filename_3rd, Loss_TorqueDependent_Filename_4th, Loss_TorqueDependent_Filename_5th, Loss_TorqueDependent_Filename_6th, Loss_TorqueDependent_Filename_7th, Loss_TorqueDependent_Filename_8th, Loss_TorqueDependent_Filename_9th;
  parameter String Loss_Omega_OilPressureDpendent_Filename_rev, Loss_Omega_OilPressureDpendent_Filename_1st, Loss_Omega_OilPressureDpendent_Filename_2nd, Loss_Omega_OilPressureDpendent_Filename_3rd, Loss_Omega_OilPressureDpendent_Filename_4th, Loss_Omega_OilPressureDpendent_Filename_5th, Loss_Omega_OilPressureDpendent_Filename_6th, Loss_Omega_OilPressureDpendent_Filename_7th, Loss_Omega_OilPressureDpendent_Filename_8th, Loss_Omega_OilPressureDpendent_Filename_9th;
  Modelica.Blocks.Interfaces.RealInput trq_inpupt_Nm annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 104}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput GearRatio annotation (
    Placement(visible = true, transformation(origin = {26, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput p_line_Pa annotation (
    Placement(visible = true, transformation(origin = {-120, -210}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -106}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-120, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -36}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_input_rpm annotation (
    Placement(visible = true, transformation(origin = {-120, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 34}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput LossTorque annotation (
    Placement(visible = true, transformation(origin = {190, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D1(filename = Loss_TorqueDependent_Filename_rev, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-52, 6}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D2(filename = Loss_TorqueDependent_Filename_1st, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-52, -14}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D3(filename = Loss_TorqueDependent_Filename_2nd, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-52, -34}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D4(filename = Loss_TorqueDependent_Filename_3rd, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-52, -54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D5(filename = Loss_TorqueDependent_Filename_4th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-52, -74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D6(filename = Loss_TorqueDependent_Filename_5th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-52, -94}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D7(filename = Loss_TorqueDependent_Filename_6th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-52, -114}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D8(filename = Loss_TorqueDependent_Filename_7th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-52, -134}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D9(filename = Loss_TorqueDependent_Filename_8th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-52, -154}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D10(filename = Loss_TorqueDependent_Filename_9th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-52, -174}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D11(filename = Loss_Omega_OilPressureDpendent_Filename_rev, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D12(filename = Loss_Omega_OilPressureDpendent_Filename_1st, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -24}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D13(filename = Loss_Omega_OilPressureDpendent_Filename_2nd, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D14(filename = Loss_Omega_OilPressureDpendent_Filename_3rd, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -64}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D15(filename = Loss_Omega_OilPressureDpendent_Filename_4th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D16(filename = Loss_Omega_OilPressureDpendent_Filename_5th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -104}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D17(filename = Loss_Omega_OilPressureDpendent_Filename_6th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -124}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D18(filename = Loss_Omega_OilPressureDpendent_Filename_7th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -144}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D19(filename = Loss_Omega_OilPressureDpendent_Filename_8th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -164}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D20(filename = Loss_Omega_OilPressureDpendent_Filename_9th, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {-20, -184}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {50, 4}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation (
    Placement(visible = true, transformation(origin = {4, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {50, -16}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation (
    Placement(visible = true, transformation(origin = {4, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {50, -36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation (
    Placement(visible = true, transformation(origin = {4, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product4 annotation (
    Placement(visible = true, transformation(origin = {50, -56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4 annotation (
    Placement(visible = true, transformation(origin = {4, -60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product5 annotation (
    Placement(visible = true, transformation(origin = {50, -76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5 annotation (
    Placement(visible = true, transformation(origin = {4, -80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product6 annotation (
    Placement(visible = true, transformation(origin = {50, -96}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add6 annotation (
    Placement(visible = true, transformation(origin = {4, -100}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product7 annotation (
    Placement(visible = true, transformation(origin = {50, -116}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add7 annotation (
    Placement(visible = true, transformation(origin = {4, -120}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product8 annotation (
    Placement(visible = true, transformation(origin = {50, -136}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add8 annotation (
    Placement(visible = true, transformation(origin = {4, -140}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add9 annotation (
    Placement(visible = true, transformation(origin = {4, -160}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product9 annotation (
    Placement(visible = true, transformation(origin = {50, -156}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product10 annotation (
    Placement(visible = true, transformation(origin = {50, -176}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add10 annotation (
    Placement(visible = true, transformation(origin = {4, -180}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder3(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-85, -210}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder4(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-85, -140}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.MultiSum multiSum1(nu = 10) annotation (
    Placement(visible = true, transformation(origin = {100, -8}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder5(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {160, -8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-85, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-85, -70}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
    Placement(visible = true, transformation(origin = {132, -8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Control.GearSelector gearSelector annotation (
    Placement(visible = true, transformation(origin = {26, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(GearRatio, gearSelector.GearRatio) annotation (
    Line(points = {{26, 120}, {26, 120}, {26, 72}, {26, 72}}, color = {0, 0, 127}));
  connect(gearSelector.GearSelectSignal[1], product1.u1) annotation (
    Line(points = {{26, 49}, {26, 8}, {42, 8}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gearSelector.GearSelectSignal[2], product2.u1) annotation (
    Line(points = {{26, 49}, {26, -12}, {42, -12}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gearSelector.GearSelectSignal[3], product3.u1) annotation (
    Line(points = {{26, 49}, {26, -32}, {42, -32}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gearSelector.GearSelectSignal[4], product4.u1) annotation (
    Line(points = {{26, 49}, {26, -52}, {42, -52}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gearSelector.GearSelectSignal[5], product5.u1) annotation (
    Line(points = {{26, 49}, {26, -72}, {42, -72}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gearSelector.GearSelectSignal[6], product6.u1) annotation (
    Line(points = {{26, 49}, {26, -92}, {42, -92}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gearSelector.GearSelectSignal[7], product7.u1) annotation (
    Line(points = {{26, 49}, {26, -112}, {42, -112}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gearSelector.GearSelectSignal[8], product8.u1) annotation (
    Line(points = {{26, 49}, {26, -132}, {42, -132}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gearSelector.GearSelectSignal[9], product9.u1) annotation (
    Line(points = {{26, 49}, {26, -152}, {42, -152}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gearSelector.GearSelectSignal[10], product10.u1) annotation (
    Line(points = {{26, 49}, {26, -172}, {42, -172}}, color = {0, 0, 127}, thickness = 0.5));
  connect(gain1.y, firstOrder5.u) annotation (
    Line(points = {{138, -8}, {152, -8}, {152, -8}, {152, -8}}, color = {0, 0, 127}));
  connect(multiSum1.y, gain1.u) annotation (
    Line(points = {{112, -8}, {124, -8}, {124, -8}, {124, -8}}, color = {0, 0, 127}));
  connect(product2.y, multiSum1.u[2]) annotation (
    Line(points = {{56, -16}, {70, -16}, {70, 2}, {90, 2}, {90, -8}}, color = {0, 0, 127}));
  connect(product1.y, multiSum1.u[1]) annotation (
    Line(points = {{56, 4}, {90, 4}, {90, -8}}, color = {0, 0, 127}));
  connect(product3.y, multiSum1.u[3]) annotation (
    Line(points = {{56, -36}, {72, -36}, {72, 0}, {90, 0}, {90, -8}}, color = {0, 0, 127}));
  connect(product4.y, multiSum1.u[4]) annotation (
    Line(points = {{56, -56}, {74, -56}, {74, -2}, {90, -2}, {90, -8}}, color = {0, 0, 127}));
  connect(product5.y, multiSum1.u[5]) annotation (
    Line(points = {{56, -76}, {76, -76}, {76, -4}, {90, -4}, {90, -8}}, color = {0, 0, 127}));
  connect(product6.y, multiSum1.u[6]) annotation (
    Line(points = {{56, -96}, {78, -96}, {78, -6}, {90, -6}, {90, -8}}, color = {0, 0, 127}));
  connect(product7.y, multiSum1.u[7]) annotation (
    Line(points = {{56, -116}, {80, -116}, {80, -8}, {90, -8}}, color = {0, 0, 127}));
  connect(product8.y, multiSum1.u[8]) annotation (
    Line(points = {{56, -136}, {82, -136}, {82, -10}, {90, -10}, {90, -8}}, color = {0, 0, 127}));
  connect(product9.y, multiSum1.u[9]) annotation (
    Line(points = {{56, -156}, {84, -156}, {84, -12}, {90, -12}, {90, -8}}, color = {0, 0, 127}));
  connect(product10.y, multiSum1.u[10]) annotation (
    Line(points = {{56, -176}, {86, -176}, {86, -14}, {90, -14}, {90, -8}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D20.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -180}, {-28, -180}, {-28, -180}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D19.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -160}, {-28, -160}, {-28, -160}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D18.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -140}, {-28, -140}, {-28, -140}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D17.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -118}, {-28, -118}, {-28, -120}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D16.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -98}, {-28, -98}, {-28, -100}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D15.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -78}, {-28, -78}, {-28, -80}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D14.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -58}, {-28, -58}, {-28, -60}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D13.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -38}, {-28, -38}, {-28, -40}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D12.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, -20}, {-28, -20}, {-28, -20}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D11.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 16}, {-34, 16}, {-34, 0}, {-28, 0}, {-28, 0}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D10.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, -168}, {-60, -168}, {-60, -170}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D9.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, -148}, {-60, -148}, {-60, -150}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D8.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, -128}, {-60, -128}, {-60, -130}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D7.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, -108}, {-60, -108}, {-60, -110}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D6.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, -88}, {-60, -88}, {-60, -90}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D5.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, -68}, {-60, -68}, {-60, -70}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D4.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, -48}, {-60, -48}, {-60, -50}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D3.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, -28}, {-60, -28}, {-60, -30}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D2.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, -8}, {-60, -8}, {-60, -10}}, color = {0, 0, 127}));
  connect(firstOrder2.y, combiTable3D1.u) annotation (
    Line(points = {{-80, -70}, {-74, -70}, {-74, 11}, {-59, 11}}, color = {0, 0, 127}));
  connect(w_input_rpm, firstOrder2.u) annotation (
    Line(points = {{-120, -70}, {-92, -70}, {-92, -70}, {-90, -70}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D10.u1) annotation (
    Line(points = {{-80, 0}, {-70, 0}, {-70, -174}, {-60, -174}, {-60, -174}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D9.u1) annotation (
    Line(points = {{-80, 0}, {-70, 0}, {-70, -154}, {-60, -154}, {-60, -154}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D8.u1) annotation (
    Line(points = {{-80, 0}, {-70, 0}, {-70, -134}, {-60, -134}, {-60, -134}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D7.u1) annotation (
    Line(points = {{-80, 0}, {-70, 0}, {-70, -114}, {-60, -114}, {-60, -114}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D6.u1) annotation (
    Line(points = {{-80, 0}, {-70, 0}, {-70, -94}, {-60, -94}, {-60, -94}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D5.u1) annotation (
    Line(points = {{-80, 0}, {-70, 0}, {-70, -74}, {-60, -74}, {-60, -74}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D4.u1) annotation (
    Line(points = {{-80, 0}, {-70, 0}, {-70, -54}, {-60, -54}, {-60, -54}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D3.u1) annotation (
    Line(points = {{-80, 0}, {-70, 0}, {-70, -34}, {-60, -34}, {-60, -34}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D2.u1) annotation (
    Line(points = {{-80, 0}, {-70, 0}, {-70, -14}, {-60, -14}, {-60, -14}, {-60, -14}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D1.u1) annotation (
    Line(points = {{-80, 0}, {-70, 0}, {-70, 6}, {-60, 6}}, color = {0, 0, 127}));
  connect(trq_inpupt_Nm, firstOrder1.u) annotation (
    Line(points = {{-120, 0}, {-92, 0}, {-92, 0}, {-90, 0}}, color = {0, 0, 127}));
  connect(firstOrder5.y, LossTorque) annotation (
    Line(points = {{166, -8}, {182, -8}, {182, -8}, {190, -8}}, color = {0, 0, 127}));
  connect(firstOrder3.y, combiTable3D16.u1) annotation (
    Line(points = {{-80, -210}, {-38, -210}, {-38, -104}, {-28, -104}, {-28, -104}}, color = {0, 0, 127}));
  connect(add10.y, product10.u2) annotation (
    Line(points = {{10, -180}, {42, -180}, {42, -180}, {42, -180}}, color = {0, 0, 127}));
  connect(add9.y, product9.u2) annotation (
    Line(points = {{10, -160}, {42, -160}, {42, -160}, {42, -160}}, color = {0, 0, 127}));
  connect(add8.y, product8.u2) annotation (
    Line(points = {{10, -140}, {42, -140}, {42, -140}, {42, -140}}, color = {0, 0, 127}));
  connect(add7.y, product7.u2) annotation (
    Line(points = {{10, -120}, {42, -120}, {42, -120}, {42, -120}}, color = {0, 0, 127}));
  connect(add6.y, product6.u2) annotation (
    Line(points = {{10, -100}, {42, -100}, {42, -100}, {42, -100}}, color = {0, 0, 127}));
  connect(add5.y, product5.u2) annotation (
    Line(points = {{10, -80}, {42, -80}, {42, -80}, {42, -80}}, color = {0, 0, 127}));
  connect(add4.y, product4.u2) annotation (
    Line(points = {{10, -60}, {42, -60}, {42, -60}, {42, -60}}, color = {0, 0, 127}));
  connect(add3.y, product3.u2) annotation (
    Line(points = {{10, -40}, {42, -40}, {42, -40}, {42, -40}}, color = {0, 0, 127}));
  connect(add2.y, product2.u2) annotation (
    Line(points = {{10, -20}, {42, -20}, {42, -20}, {42, -20}}, color = {0, 0, 127}));
  connect(add1.y, product1.u2) annotation (
    Line(points = {{10, 0}, {42, 0}, {42, 0}, {42, 0}}, color = {0, 0, 127}));
  connect(combiTable3D10.y, add10.u1) annotation (
    Line(points = {{-46, -174}, {-10, -174}, {-10, -176}, {-4, -176}, {-4, -176}}, color = {0, 0, 127}));
  connect(combiTable3D9.y, add9.u1) annotation (
    Line(points = {{-46, -154}, {-10, -154}, {-10, -156}, {-4, -156}, {-4, -156}}, color = {0, 0, 127}));
  connect(combiTable3D8.y, add8.u1) annotation (
    Line(points = {{-46, -134}, {-10, -134}, {-10, -136}, {-4, -136}, {-4, -136}}, color = {0, 0, 127}));
  connect(combiTable3D7.y, add7.u1) annotation (
    Line(points = {{-46, -114}, {-10, -114}, {-10, -116}, {-4, -116}, {-4, -116}}, color = {0, 0, 127}));
  connect(combiTable3D6.y, add6.u1) annotation (
    Line(points = {{-46, -94}, {-10, -94}, {-10, -96}, {-4, -96}, {-4, -96}}, color = {0, 0, 127}));
  connect(combiTable3D5.y, add5.u1) annotation (
    Line(points = {{-46, -74}, {-10, -74}, {-10, -76}, {-4, -76}, {-4, -76}}, color = {0, 0, 127}));
  connect(combiTable3D4.y, add4.u1) annotation (
    Line(points = {{-46, -54}, {-10, -54}, {-10, -56}, {-4, -56}, {-4, -56}}, color = {0, 0, 127}));
  connect(combiTable3D1.y, add1.u1) annotation (
    Line(points = {{-45.4, 6}, {-9.4, 6}, {-9.4, 4}, {-2.4, 4}}, color = {0, 0, 127}));
  connect(combiTable3D3.y, add3.u1) annotation (
    Line(points = {{-46, -34}, {-10, -34}, {-10, -36}, {-4, -36}, {-4, -36}}, color = {0, 0, 127}));
  connect(combiTable3D2.y, add2.u1) annotation (
    Line(points = {{-46, -14}, {-10, -14}, {-10, -16}, {-4, -16}, {-4, -16}}, color = {0, 0, 127}));
  connect(combiTable3D12.y, add2.u2) annotation (
    Line(points = {{-14, -24}, {-4, -24}, {-4, -24}, {-4, -24}}, color = {0, 0, 127}));
  connect(combiTable3D13.y, add3.u2) annotation (
    Line(points = {{-14, -44}, {-14, -44}, {-14, -44}, {-4, -44}, {-4, -44}}, color = {0, 0, 127}));
  connect(combiTable3D14.y, add4.u2) annotation (
    Line(points = {{-14, -64}, {-12, -64}, {-12, -64}, {-4, -64}, {-4, -64}}, color = {0, 0, 127}));
  connect(combiTable3D15.y, add5.u2) annotation (
    Line(points = {{-14, -84}, {-4, -84}, {-4, -84}, {-4, -84}}, color = {0, 0, 127}));
  connect(combiTable3D16.y, add6.u2) annotation (
    Line(points = {{-14, -104}, {-4, -104}, {-4, -104}, {-4, -104}}, color = {0, 0, 127}));
  connect(combiTable3D17.y, add7.u2) annotation (
    Line(points = {{-14, -124}, {-4, -124}, {-4, -124}, {-4, -124}}, color = {0, 0, 127}));
  connect(combiTable3D18.y, add8.u2) annotation (
    Line(points = {{-14, -144}, {-4, -144}, {-4, -144}, {-4, -144}}, color = {0, 0, 127}));
  connect(combiTable3D19.y, add9.u2) annotation (
    Line(points = {{-14, -164}, {-4, -164}, {-4, -164}, {-4, -164}}, color = {0, 0, 127}));
  connect(combiTable3D20.y, add10.u2) annotation (
    Line(points = {{-14, -184}, {-4, -184}, {-4, -184}, {-4, -184}, {-4, -184}}, color = {0, 0, 127}));
  connect(firstOrder3.y, combiTable3D20.u1) annotation (
    Line(points = {{-80, -210}, {-38, -210}, {-38, -184}, {-28, -184}, {-28, -184}}, color = {0, 0, 127}));
  connect(firstOrder3.y, combiTable3D19.u1) annotation (
    Line(points = {{-80, -210}, {-38, -210}, {-38, -164}, {-28, -164}, {-28, -164}}, color = {0, 0, 127}));
  connect(firstOrder3.y, combiTable3D18.u1) annotation (
    Line(points = {{-80, -210}, {-38, -210}, {-38, -144}, {-28, -144}, {-28, -144}}, color = {0, 0, 127}));
  connect(firstOrder3.y, combiTable3D17.u1) annotation (
    Line(points = {{-80, -210}, {-38, -210}, {-38, -124}, {-28, -124}, {-28, -124}}, color = {0, 0, 127}));
  connect(firstOrder3.y, combiTable3D15.u1) annotation (
    Line(points = {{-80, -210}, {-38, -210}, {-38, -84}, {-28, -84}, {-28, -84}}, color = {0, 0, 127}));
  connect(firstOrder3.y, combiTable3D14.u1) annotation (
    Line(points = {{-80, -210}, {-38, -210}, {-38, -64}, {-28, -64}, {-28, -64}}, color = {0, 0, 127}));
  connect(firstOrder3.y, combiTable3D13.u1) annotation (
    Line(points = {{-80, -210}, {-38, -210}, {-38, -44}, {-28, -44}, {-28, -44}}, color = {0, 0, 127}));
  connect(firstOrder3.y, combiTable3D12.u1) annotation (
    Line(points = {{-80, -210}, {-38, -210}, {-38, -24}, {-28, -24}, {-28, -24}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D20.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -190}, {-28, -190}, {-28, -188}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D19.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -168}, {-28, -168}, {-28, -168}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D18.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -148}, {-28, -148}, {-28, -148}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D17.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -128}, {-28, -128}, {-28, -128}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D16.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -108}, {-28, -108}, {-28, -108}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D15.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -88}, {-28, -88}, {-28, -88}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D14.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -68}, {-28, -68}, {-28, -68}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D13.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -48}, {-28, -48}, {-28, -48}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D12.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -28}, {-28, -28}, {-28, -28}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D10.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -178}, {-60, -178}, {-60, -178}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D9.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -158}, {-60, -158}, {-60, -158}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D8.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -138}, {-60, -138}, {-60, -138}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D7.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -118}, {-60, -118}, {-60, -118}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D6.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -98}, {-60, -98}, {-60, -98}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D5.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -78}, {-60, -78}, {-60, -78}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D4.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -58}, {-60, -58}, {-60, -58}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D3.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -38}, {-60, -38}, {-60, -38}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D2.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -18}, {-60, -18}, {-60, -18}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D11.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, -4}, {-42, -4}, {-42, -8}, {-28, -8}, {-28, -8}}, color = {0, 0, 127}));
  connect(firstOrder4.y, combiTable3D1.u2) annotation (
    Line(points = {{-80, -140}, {-66, -140}, {-66, 2}, {-60, 2}, {-60, 2}}, color = {0, 0, 127}));
  connect(combiTable3D11.y, add1.u2) annotation (
    Line(points = {{-13.4, -4}, {-2.4, -4}}, color = {0, 0, 127}));
  connect(firstOrder3.y, combiTable3D11.u1) annotation (
    Line(points = {{-79.5, -210}, {-38, -210}, {-38, -4}, {-27, -4}}, color = {0, 0, 127}));
  connect(nu_oil_m2ps, firstOrder4.u) annotation (
    Line(points = {{-120, -140}, {-90, -140}, {-90, -140}, {-90, -140}}, color = {0, 0, 127}));
  connect(p_line_Pa, firstOrder3.u) annotation (
    Line(points = {{-120, -210}, {-106, -210}, {-106, -210}, {-92, -210}, {-92, -210}, {-91, -210}, {-91, -210}, {-90.5, -210}, {-90.5, -210}, {-90, -210}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -320}, {280, 200}})),
    __OpenModelica_commandLineOptions = "",
    Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -135}, lineColor = {0, 0, 255}, extent = {{-140, 25}, {140, -25}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end TransmissionLoss;
