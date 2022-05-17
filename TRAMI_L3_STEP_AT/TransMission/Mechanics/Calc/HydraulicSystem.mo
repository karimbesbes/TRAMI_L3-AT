within TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc;
model HydraulicSystem
  //constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter String TPMAP_LC_Filename;
  parameter String TPMAP_CL1_Filename;
  parameter String TPMAP_CL2_Filename;
  parameter String TPMAP_CL3_Filename;
  Modelica.Blocks.Interfaces.RealInput p_line_Pa annotation (
    Placement(visible = true, transformation(origin = {-140, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, 500}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_clutch_cap_lup annotation (
    Placement(visible = true, transformation(origin = {-140, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, 300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_clutch_cap_c1 annotation (
    Placement(visible = true, transformation(origin = {-140, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_clutch_cap_c2 annotation (
    Placement(visible = true, transformation(origin = {-140, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_clutch_cap_c3 annotation (
    Placement(visible = true, transformation(origin = {-140, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, -300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {10, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(fileName = currDir + "/Tables/" + TPMAP_LC_Filename, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D1(fileName = currDir + "/Tables/" + TPMAP_CL1_Filename, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D2(fileName = currDir + "/Tables/" + TPMAP_CL2_Filename, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D3(fileName = currDir + "/Tables/" + TPMAP_CL3_Filename, tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder3(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder4(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {10, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Min min annotation (
    Placement(visible = true, transformation(origin = {70, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Min min1 annotation (
    Placement(visible = true, transformation(origin = {70, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Min min2 annotation (
    Placement(visible = true, transformation(origin = {70, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Min min3 annotation (
    Placement(visible = true, transformation(origin = {70, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput p_line_Pa_fil annotation (
    Placement(visible = true, transformation(origin = {130, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, 502}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput p_clutch_cap_lup_fil annotation (
    Placement(visible = true, transformation(origin = {130, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, 300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput p_clutch_cap_c1_fil annotation (
    Placement(visible = true, transformation(origin = {130, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput p_clutch_cap_c2_fil annotation (
    Placement(visible = true, transformation(origin = {130, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput p_clutch_cap_c3_fil annotation (
    Placement(visible = true, transformation(origin = {130, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, -300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain kPa2Pa_lup(k = 1000) annotation (
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain kPa2Pa_c1(k = 1000) annotation (
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain kPa2Pa_c2(k = 1000) annotation (
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain kPa2Pa_c3(k = 1000) annotation (
    Placement(visible = true, transformation(origin = {-30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(tau_clutch_cap_lup, combiTable1D.u[1]) annotation (
    Line(points = {{-140, 50}, {-82, 50}}, color = {0, 0, 127}));
  connect(tau_clutch_cap_c1, combiTable1D1.u[1]) annotation (
    Line(points = {{-140, 0}, {-82, 0}}, color = {0, 0, 127}));
  connect(tau_clutch_cap_c2, combiTable1D2.u[1]) annotation (
    Line(points = {{-140, -50}, {-82, -50}}, color = {0, 0, 127}));
  connect(tau_clutch_cap_c3, combiTable1D3.u[1]) annotation (
    Line(points = {{-140, -100}, {-82, -100}}, color = {0, 0, 127}));
  connect(p_line_Pa, firstOrder.u) annotation (
    Line(points = {{-140, 100}, {-2, 100}}, color = {0, 0, 127}));
  connect(firstOrder1.y, min.u1) annotation (
    Line(points = {{21, 50}, {58, 50}}, color = {0, 0, 127}));
  connect(firstOrder2.y, min1.u1) annotation (
    Line(points = {{21, 0}, {58, 0}}, color = {0, 0, 127}));
  connect(firstOrder3.y, min2.u1) annotation (
    Line(points = {{21, -50}, {58, -50}}, color = {0, 0, 127}));
  connect(firstOrder4.y, min3.u1) annotation (
    Line(points = {{21, -100}, {58, -100}}, color = {0, 0, 127}));
  connect(firstOrder.y, min.u2) annotation (
    Line(points = {{21, 100}, {40, 100}, {40, 38}, {58, 38}}, color = {0, 0, 127}));
  connect(firstOrder.y, min1.u2) annotation (
    Line(points = {{21, 100}, {40, 100}, {40, -12}, {58, -12}}, color = {0, 0, 127}));
  connect(firstOrder.y, min2.u2) annotation (
    Line(points = {{21, 100}, {40, 100}, {40, -62}, {58, -62}}, color = {0, 0, 127}));
  connect(firstOrder.y, min3.u2) annotation (
    Line(points = {{21, 100}, {40, 100}, {40, -112}, {58, -112}}, color = {0, 0, 127}));
  connect(firstOrder.y, p_line_Pa_fil) annotation (
    Line(points = {{21, 100}, {130, 100}}, color = {0, 0, 127}));
  connect(min.y, p_clutch_cap_lup_fil) annotation (
    Line(points = {{81, 44}, {130, 44}}, color = {0, 0, 127}));
  connect(min1.y, p_clutch_cap_c1_fil) annotation (
    Line(points = {{81, -6}, {130, -6}}, color = {0, 0, 127}));
  connect(min2.y, p_clutch_cap_c2_fil) annotation (
    Line(points = {{81, -56}, {130, -56}}, color = {0, 0, 127}));
  connect(min3.y, p_clutch_cap_c3_fil) annotation (
    Line(points = {{81, -106}, {130, -106}}, color = {0, 0, 127}));
  connect(combiTable1D.y[1], kPa2Pa_lup.u) annotation (
    Line(points = {{-58, 50}, {-44, 50}, {-44, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(combiTable1D1.y[1], kPa2Pa_c1.u) annotation (
    Line(points = {{-58, 0}, {-44, 0}, {-44, 0}, {-42, 0}}, color = {0, 0, 127}));
  connect(combiTable1D2.y[1], kPa2Pa_c2.u) annotation (
    Line(points = {{-58, -50}, {-42, -50}, {-42, -50}, {-42, -50}}, color = {0, 0, 127}));
  connect(combiTable1D3.y[1], kPa2Pa_c3.u) annotation (
    Line(points = {{-58, -100}, {-42, -100}, {-42, -100}, {-42, -100}}, color = {0, 0, 127}));
  connect(firstOrder1.u, kPa2Pa_lup.y) annotation (
    Line(points = {{-2, 50}, {-20, 50}, {-20, 50}, {-18, 50}}, color = {0, 0, 127}));
  connect(firstOrder2.u, kPa2Pa_c1.y) annotation (
    Line(points = {{-2, 0}, {-18, 0}, {-18, 0}, {-18, 0}}, color = {0, 0, 127}));
  connect(firstOrder3.u, kPa2Pa_c2.y) annotation (
    Line(points = {{-2, -50}, {-18, -50}, {-18, -50}, {-18, -50}}, color = {0, 0, 127}));
  connect(firstOrder4.u, kPa2Pa_c3.y) annotation (
    Line(points = {{-2, -100}, {-18, -100}, {-18, -100}, {-18, -100}}, color = {0, 0, 127}));
  annotation (
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-120, -140}, {120, 140}})),
    version = "",
    Icon(coordinateSystem(extent = {{-140, -400}, {140, 600}}), graphics = {Text(origin = {4, -408}, lineColor = {0, 0, 255}, extent = {{-282, 14}, {278, -46}}, textString = "%name"), Text(origin = {142, 635}, extent = {{-142, -35}, {-2, -215}}, textString = "LinePrs"), Rectangle(origin = {-40, 532}, extent = {{-100, 68}, {180, -932}}), Text(origin = {100, 435}, extent = {{-100, -55}, {40, -215}}, textString = "PLup"), Text(origin = {100, 235}, extent = {{-100, -55}, {40, -215}}, textString = "PCL1"), Text(origin = {100, 35}, extent = {{-100, -55}, {40, -215}}, textString = "PCL2"), Text(origin = {100, -165}, extent = {{-100, -55}, {40, -215}}, textString = "PCL3")}));
end HydraulicSystem;
