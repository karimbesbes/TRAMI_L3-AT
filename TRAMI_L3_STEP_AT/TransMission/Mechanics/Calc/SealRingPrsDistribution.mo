within TRAMI_L3_STEP_AT.TransMission.Mechanics.Calc;
model SealRingPrsDistribution
  parameter Real P_lubrication = 500 "unit:kPa";
  Modelica.Blocks.Interfaces.RealInput p_clutch_cap_lup annotation (
    Placement(visible = true, transformation(origin = {-180, 174}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, 300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput p_clutch_cap_c1 annotation (
    Placement(visible = true, transformation(origin = {-180, 26}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput p_clutch_cap_c2 annotation (
    Placement(visible = true, transformation(origin = {-180, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput p_clutch_cap_c3 annotation (
    Placement(visible = true, transformation(origin = {-180, -106}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-160, -300}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput p_SR_Pa[26] annotation (
    Placement(visible = true, transformation(origin = {170, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex5 SR1(n1 = 2, n2 = 2, n3 = 2, n4 = 2, n5 = 2) annotation (
    Placement(visible = true, transformation(origin = {89, 73}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex4 SR2(n1 = 2, n2 = 2, n3 = 2, n4 = 2) annotation (
    Placement(visible = true, transformation(origin = {89, 25}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 SR3(n1 = 2, n2 = 2) annotation (
    Placement(visible = true, transformation(origin = {89, -79}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 SR4(n1 = 2, n2 = 2) annotation (
    Placement(visible = true, transformation(origin = {89, -135}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex4 multiplex41(n1 = 10, n2 = 8, n3 = 4, n4 = 4) annotation (
    Placement(visible = true, transformation(origin = {140, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant lubrication_kPa(k = P_lubrication) annotation (
    Placement(visible = true, transformation(origin = {-130, 122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain kPa2Pa(k = 1000) annotation (
    Placement(visible = true, transformation(origin = {-90, 122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant case(k = 0) annotation (
    Placement(visible = true, transformation(origin = {-30, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex1 annotation (
    Placement(visible = true, transformation(origin = {30, 168}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex2 annotation (
    Placement(visible = true, transformation(origin = {30, 142}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex3 annotation (
    Placement(visible = true, transformation(origin = {30, 116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex4 annotation (
    Placement(visible = true, transformation(origin = {30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex5 annotation (
    Placement(visible = true, transformation(origin = {30, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex6 annotation (
    Placement(visible = true, transformation(origin = {30, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex7 annotation (
    Placement(visible = true, transformation(origin = {30, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex8 annotation (
    Placement(visible = true, transformation(origin = {30, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex9 annotation (
    Placement(visible = true, transformation(origin = {30, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex10 annotation (
    Placement(visible = true, transformation(origin = {30, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex11 annotation (
    Placement(visible = true, transformation(origin = {30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex12 annotation (
    Placement(visible = true, transformation(origin = {30, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex13 annotation (
    Placement(visible = true, transformation(origin = {30, -156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(SR1.y, multiplex41.u1) annotation (
    Line(points = {{99, 73}, {120, 73}, {120, 10}, {128, 10}, {128, 11}}, color = {0, 0, 127}, thickness = 0.5));
  connect(SR2.y, multiplex41.u2) annotation (
    Line(points = {{99, 25}, {109.5, 25}, {109.5, 5}, {128, 5}}, color = {0, 0, 127}, thickness = 0.5));
  connect(SR3.y, multiplex41.u3) annotation (
    Line(points = {{99, -79}, {110, -79}, {110, -1}, {128, -1}}, color = {0, 0, 127}, thickness = 0.5));
  connect(SR4.y, multiplex41.u4) annotation (
    Line(points = {{99, -135}, {120, -135}, {120, -8}, {128, -8}, {128, -7}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex41.y, p_SR_Pa) annotation (
    Line(points = {{151, 2}, {170, 2}}, color = {0, 0, 127}, thickness = 0.5));
  connect(lubrication_kPa.y, kPa2Pa.u) annotation (
    Line(points = {{-119, 122}, {-102, 122}}, color = {0, 0, 127}));
  connect(multiplex1.u1[1], p_clutch_cap_lup) annotation (
    Line(points = {{18, 174}, {-180, 174}}, color = {0, 0, 127}));
  connect(multiplex1.u2[1], case.y) annotation (
    Line(points = {{-18, -180}, {0, -180}, {0, 162}, {18, 162}, {18, 162}}, color = {150, 150, 150}));
  connect(multiplex2.u1[1], case.y) annotation (
    Line(points = {{18, 148}, {0, 148}, {0, -180}, {-18, -180}, {-18, -180}}, color = {150, 150, 150}));
  connect(multiplex2.u2[1], p_clutch_cap_lup) annotation (
    Line(points = {{18, 136}, {-20, 136}, {-20, 174}, {-180, 174}, {-180, 174}}, color = {0, 0, 127}));
  connect(multiplex3.u1[1], kPa2Pa.y) annotation (
    Line(points = {{18, 122}, {-80, 122}, {-80, 122}, {-78, 122}}, color = {0, 0, 127}));
  connect(multiplex3.u2[1], case.y) annotation (
    Line(points = {{18, 110}, {0, 110}, {0, -180}, {-18, -180}, {-18, -180}}, color = {150, 150, 150}));
  connect(multiplex4.u1[1], p_clutch_cap_c2) annotation (
    Line(points = {{18, 96}, {-60, 96}, {-60, -40}, {-180, -40}}, color = {0, 0, 127}));
  connect(multiplex4.u2[1], kPa2Pa.y) annotation (
    Line(points = {{18, 84}, {-40, 84}, {-40, 122}, {-78, 122}}, color = {0, 0, 127}));
  connect(multiplex5.u1[1], case.y) annotation (
    Line(points = {{18, 70}, {0, 70}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
  connect(multiplex5.u2[1], p_clutch_cap_c2) annotation (
    Line(points = {{18, 58}, {-60, 58}, {-60, -40}, {-180, -40}}, color = {0, 0, 127}));
  connect(multiplex6.u1[1], kPa2Pa.y) annotation (
    Line(points = {{18, 40}, {-40, 40}, {-40, 122}, {-78, 122}}, color = {0, 0, 127}));
  connect(multiplex6.u2[1], case.y) annotation (
    Line(points = {{18, 28}, {0, 28}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
  connect(multiplex7.u1[1], p_clutch_cap_c2) annotation (
    Line(points = {{18, 14}, {-60, 14}, {-60, -40}, {-180, -40}}, color = {0, 0, 127}));
  connect(multiplex7.u2[1], kPa2Pa.y) annotation (
    Line(points = {{18, 2}, {-40, 2}, {-40, 122}, {-78, 122}}, color = {0, 0, 127}));
  connect(multiplex8.u1[1], kPa2Pa.y) annotation (
    Line(points = {{18, -12}, {-40, -12}, {-40, 122}, {-78, 122}}, color = {0, 0, 127}));
  connect(multiplex8.u2[1], p_clutch_cap_c2) annotation (
    Line(points = {{18, -24}, {-60, -24}, {-60, -40}, {-180, -40}}, color = {0, 0, 127}));
  connect(multiplex9.u1[1], case.y) annotation (
    Line(points = {{18, -38}, {0, -38}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
  connect(multiplex9.u2[1], kPa2Pa.y) annotation (
    Line(points = {{18, -50}, {-40, -50}, {-40, 122}, {-78, 122}}, color = {0, 0, 127}));
  connect(multiplex10.u1[1], p_clutch_cap_c3) annotation (
    Line(points = {{18, -68}, {-80, -68}, {-80, -106}, {-180, -106}}, color = {0, 0, 127}));
  connect(multiplex10.u2[1], case.y) annotation (
    Line(points = {{18, -80}, {0, -80}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
  connect(multiplex11.u1[1], case.y) annotation (
    Line(points = {{18, -94}, {0, -94}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
  connect(multiplex11.u2[1], p_clutch_cap_c3) annotation (
    Line(points = {{18, -106}, {-180, -106}}, color = {0, 0, 127}));
  connect(multiplex12.u1[1], p_clutch_cap_c1) annotation (
    Line(points = {{18, -124}, {-100, -124}, {-100, 26}, {-180, 26}}, color = {0, 0, 127}));
  connect(multiplex12.u2[1], case.y) annotation (
    Line(points = {{18, -136}, {0, -136}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
  connect(multiplex13.u1[1], case.y) annotation (
    Line(points = {{18, -150}, {0, -150}, {0, -180}, {-18, -180}}, color = {150, 150, 150}));
  connect(multiplex13.u2[1], p_clutch_cap_c1) annotation (
    Line(points = {{18, -162}, {-100, -162}, {-100, 26}, {-180, 26}}, color = {0, 0, 127}));
  connect(multiplex12.y, SR4.u1) annotation (
    Line(points = {{41, -130}, {78, -130}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex13.y, SR4.u2) annotation (
    Line(points = {{42, -156}, {60, -156}, {60, -140}, {78, -140}, {78, -140}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex1.y, SR1.u1) annotation (
    Line(points = {{42, 168}, {72, 168}, {72, 82}, {78, 82}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex2.y, SR1.u2) annotation (
    Line(points = {{42, 142}, {66, 142}, {66, 77.5}, {78, 77.5}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex3.y, SR1.u3) annotation (
    Line(points = {{42, 116}, {60, 116}, {60, 73}, {78, 73}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex4.y, SR1.u4) annotation (
    Line(points = {{42, 90}, {54, 90}, {54, 68.5}, {78, 68.5}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex5.y, SR1.u5) annotation (
    Line(points = {{42, 64}, {78, 64}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex6.y, SR2.u1) annotation (
    Line(points = {{42, 34}, {76, 34}, {76, 34}, {78, 34}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex7.y, SR2.u2) annotation (
    Line(points = {{42, 8}, {54, 8}, {54, 28}, {78, 28}, {78, 28}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex8.y, SR2.u3) annotation (
    Line(points = {{42, -18}, {60, -18}, {60, 22}, {78, 22}, {78, 22}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex9.y, SR2.u4) annotation (
    Line(points = {{42, -44}, {66, -44}, {66, 18}, {78, 18}, {78, 16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex10.y, SR3.u1) annotation (
    Line(points = {{42, -74}, {78, -74}, {78, -74}, {78, -74}}, color = {0, 0, 127}, thickness = 0.5));
  connect(multiplex11.y, SR3.u2) annotation (
    Line(points = {{42, -100}, {60, -100}, {60, -84}, {78, -84}, {78, -84}}, color = {0, 0, 127}, thickness = 0.5));
  annotation (
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-160, -200}, {160, 200}})),
    version = "",
    Icon(coordinateSystem(extent = {{-140, -400}, {140, 400}}, initialScale = 0.1), graphics = {Rectangle(origin = {3, -3}, extent = {{-143, 403}, {137, -397}}), Text(origin = {2, -416}, lineColor = {0, 0, 255}, extent = {{-282, 14}, {278, -46}}, textString = "%name"), Text(origin = {-40, 235}, extent = {{-100, -55}, {40, -215}}, textString = "PCL1"), Text(origin = {-40, 435}, extent = {{-100, -55}, {40, -215}}, textString = "PLup"), Text(origin = {-40, 35}, extent = {{-100, -55}, {40, -215}}, textString = "PCL2"), Text(origin = {-40, -165}, extent = {{-100, -55}, {40, -215}}, textString = "PCL3"), Text(origin = {100, 135}, extent = {{-100, -55}, {40, -215}}, textString = "PSR")}));
end SealRingPrsDistribution;
