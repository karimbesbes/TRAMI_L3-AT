within TRAMI_L3_STEP_AT.TransMission.Mechanics;
model OilPump
  parameter String Oil_Pump_Loss_Table_Filename = "OP.txt";
  parameter Real Oil_Viscosity_Breakpoint[:] = {4.1e-6, 6.0e-6, 9.7e-6, 18.0e-6, 39.4e-6};
  Modelica.Blocks.Math.Gain gain2(k = 60 / (2 * Modelica.Constants.pi)) annotation (
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PHI_TM_PNT_OP_W annotation (
    Placement(visible = true, transformation(origin = {20, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput nu_oil_m2ps annotation (
    Placement(visible = true, transformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Libraries.Utilities.CombiTable3D combiTable3D1(filename = Oil_Pump_Loss_Table_Filename, z_ax = Oil_Viscosity_Breakpoint) annotation (
    Placement(visible = true, transformation(origin = {34, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /* Table Input Angular Velocity unit [rpm]　Oil Pressure unit [kPa] Oil Viscosity unit [mm^2/s]　*/
  Modelica.Blocks.Interfaces.RealInput p_Line_Pa annotation (
    Placement(visible = true, transformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -10) annotation (
    Placement(visible = true, transformation(origin = {-6, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput w_AT_PNT_radps annotation (
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput trq_AT_PNT_Nm annotation (
    Placement(visible = true, transformation(origin = {-110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Tanh tanh1 annotation (
    Placement(visible = true, transformation(origin = {30, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {-36, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = 1 / 1000) annotation (
    Placement(visible = true, transformation(origin = {-74, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gain3.y, firstOrder1.u) annotation (
    Line(points = {{-62, -40}, {-48, -40}, {-48, -40}, {-48, -40}}, color = {0, 0, 127}));
  connect(p_Line_Pa, gain3.u) annotation (
    Line(points = {{-110, -40}, {-86, -40}, {-86, -40}, {-86, -40}}, color = {0, 0, 127}));
  connect(nu_oil_m2ps, combiTable3D1.u2) annotation (
    Line(points = {{-110, -80}, {-10, -80}, {-10, -48}, {22, -48}}, color = {0, 0, 127}));
  connect(firstOrder1.y, combiTable3D1.u1) annotation (
    Line(points = {{-25, -40}, {22, -40}}, color = {0, 0, 127}));
  connect(tanh1.y, product2.u1) annotation (
    Line(points = {{42, 58}, {50, 58}, {50, 26}, {42, 26}, {42, 26}}, color = {0, 0, 127}));
  connect(gain1.y, tanh1.u) annotation (
    Line(points = {{6, 58}, {18, 58}, {18, 58}, {18, 58}}, color = {0, 0, 127}));
  connect(w_AT_PNT_radps, gain1.u) annotation (
    Line(points = {{-120, 80}, {-34, 80}, {-34, 58}, {-18, 58}, {-18, 58}}, color = {0, 0, 127}));
  connect(w_AT_PNT_radps, gain2.u) annotation (
    Line(points = {{-120, 80}, {-34, 80}, {-34, -20}, {-12, -20}, {-12, -20}}, color = {0, 0, 127}));
  connect(w_AT_PNT_radps, product1.u1) annotation (
    Line(points = {{-120, 80}, {62, 80}, {62, 26}, {68, 26}, {68, 26}}, color = {0, 0, 127}));
  connect(product2.y, trq_AT_PNT_Nm) annotation (
    Line(points = {{20, 20}, {-102, 20}, {-102, 20}, {-110, 20}}, color = {0, 0, 127}));
  connect(gain2.y, combiTable3D1.u) annotation (
    Line(points = {{13, -20}, {15, -20}, {15, -32}, {19, -32}, {19, -32}, {21, -32}}, color = {0, 0, 127}));
  connect(combiTable3D1.y, product2.u2) annotation (
    Line(points = {{46, -40}, {54, -40}, {54, 14}, {42, 14}, {42, 14}}, color = {0, 0, 127}));
  connect(combiTable3D1.y, product1.u2) annotation (
    Line(points = {{45, -40}, {54, -40}, {54, 14}, {68, 14}}, color = {0, 0, 127}));
  connect(product1.y, PHI_TM_PNT_OP_W) annotation (
    Line(points = {{91, 20}, {100, 20}, {100, -82}, {20, -82}, {20, -110}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Text(origin = {-2, 136}, lineColor = {0, 0, 255}, extent = {{-144, 24}, {144, -24}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(lineThickness = 0.75, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 25}, {100, -25}}), Ellipse(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Line(origin = {-78, 11}, points = {{-15, -2}, {-9, 2}, {-3, 2}, {3, -2}, {9, -2}, {15, 2}}, thickness = 0.15), Line(origin = {78, 10}, points = {{-14, 0}, {14, 0}}, thickness = 0.15), Line(rotation = -12, points = {{0, 50}, {0, -50}}, color = {160, 160, 160}), Line(rotation = 21, points = {{0, 50}, {0, -50}}, color = {220, 220, 220}), Line(rotation = 111, points = {{0, 50}, {0, -50}}, color = {220, 220, 220}), Line(rotation = 156, points = {{0, 50}, {0, -50}}, color = {220, 220, 220}), Line(rotation = 66, points = {{0, 50}, {0, -50}}, color = {220, 220, 220}), Line(rotation = 33, points = {{0, 50}, {0, -50}}, color = {160, 160, 160}), Line(rotation = 78, points = {{0, 50}, {0, -50}}, color = {160, 160, 160}), Line(rotation = 123, points = {{0, 50}, {0, -50}}, color = {160, 160, 160}), Line(points = {{0, 50}, {0, -50}}), Line(rotation = 45, points = {{0, 50}, {0, -50}}), Line(rotation = 135, points = {{0, 50}, {0, -50}}), Line(rotation = 90, points = {{0, 50}, {0, -50}}), Ellipse(fillColor = {144, 144, 144}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Line(origin = {-78, 0}, points = {{-15, -2}, {-9, 2}, {-3, 2}, {3, -2}, {9, -2}, {15, 2}}, thickness = 0.15), Line(origin = {-78, -11}, points = {{-15, -2}, {-9, 2}, {-3, 2}, {3, -2}, {9, -2}, {15, 2}}, thickness = 0.15), Line(origin = {78, 0}, points = {{-14, 0}, {14, 0}}, thickness = 0.15), Line(origin = {78, -10}, points = {{-14, 0}, {14, 0}}, thickness = 0.15), Text(origin = {-123, -58}, extent = {{-31, 6}, {25, -12}}, textString = "Oil_V"), Text(origin = {-123, -16}, extent = {{-37, 6}, {25, -12}}, textString = "Line_P"), Text(origin = {-131, 40}, extent = {{-3, 12}, {25, -12}}, textString = "T"), Text(origin = {-131, 112}, extent = {{-3, 12}, {25, -12}}, textString = "w"), Text(origin = {105, -62}, extent = {{-3, 12}, {49, -12}}, textString = "QfOP")}),
    uses(Modelica(version = "3.2.3")));
end OilPump;
