within TRAMI_L3_STEP_AT.Control;
model TCU_Main
  constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = 2:26, fileName = currDir + "/ModelicaInputData0120_v181.txt", tableName = "tab1", tableOnFile = true) annotation (
    Placement(visible = true, transformation(origin = {-464, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Control.Acceptance acceptance1 annotation (
    Placement(visible = true, transformation(origin = {132, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Control.TCU_Main_Execution TCU_Main_Execution1(samplePeriod = 0.010, startTime = 0) annotation (
    Placement(visible = true, transformation(origin = {6, 8}, extent = {{-68, -68}, {68, 68}}, rotation = 0)));
  Modelica.Blocks.Routing.DeMultiplex5 deMultiplex5(n1 = 2, n2 = 1, n3 = 14, n4 = 1, n5 = 7) annotation (
    Placement(visible = true, transformation(origin = {-381, 35}, extent = {{-39, -39}, {39, 39}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex5 multiplex5(n1 = 2, n2 = 1, n3 = 14, n4 = 1, n5 = 7) annotation (
    Placement(visible = true, transformation(origin = {-158, 36}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Math.MatrixGain matrixGain(K = [2 * 3.141592 / 2.05]) annotation (
    Placement(visible = true, transformation(origin = {-300, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MatrixGain matrixGain1(K = [3.066]) annotation (
    Placement(visible = true, transformation(origin = {-270, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(matrixGain1.u, matrixGain.y) annotation (
    Line(points = {{-282, -102}, {-289, -102}}, color = {0, 0, 127}, thickness = 0.5));
  connect(matrixGain.u, deMultiplex5.y4) annotation (
    Line(points = {{-312, -102}, {-328, -102}, {-328, 20}, {-338, 20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(combiTimeTable.y, deMultiplex5.u) annotation (
    Line(points = {{-453, 34}, {-428, 34}, {-428, 35}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex5.u2, matrixGain1.y) annotation (
    Line(points = {{-194, 52}, {-258, 52}, {-258, -102}, {-258, -102}}, color = {0, 0, 127}, thickness = 0.5));
  connect(deMultiplex5.y4, multiplex5.u4) annotation (
    Line(points = {{-338, 20}, {-198, 20}, {-198, 22}, {-194, 22}}, color = {0, 0, 127}, thickness = 0.5));
  connect(deMultiplex5.y5, multiplex5.u5) annotation (
    Line(points = {{-338, 6}, {-194, 6}}, color = {0, 0, 127}, thickness = 0.5));
  connect(deMultiplex5.y3, multiplex5.u3) annotation (
    Line(points = {{-338, 37}, {-269, 37}, {-269, 36}, {-194, 36}}, color = {0, 0, 127}, thickness = 0.5));
  connect(deMultiplex5.y1, multiplex5.u1) annotation (
    Line(points = {{-338, 68}, {-266, 68}, {-266, 66}, {-194, 66}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex5.y, TCU_Main_Execution1.SFunction_in1) annotation (
    Line(points = {{-124, 36}, {-82, 36}, {-82, 36}, {-80, 36}}, color = {0, 0, 127}, thickness = 0.5));
  connect(TCU_Main_Execution1.Sfunction_Out1, acceptance1.Acceptance_data) annotation (
    Line(points = {{80, 8}, {120, 8}}, color = {0, 0, 127}, thickness = 0.5));
  annotation (
    experiment(StartTime = 0, StopTime = 88, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TCU_Main;
