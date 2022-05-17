within TRAMI_L3_STEP_AT.TransMission;
package Mechanics











  //    model Actuator_eLoss
  //      Modelica.Blocks.Interfaces.RealInput I_TM_CNT_ACT_A annotation(
  //        Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  //      Modelica.Blocks.Interfaces.RealInput V_BT_PNT_Lo_V annotation(
  //        Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  //      Modelica.Blocks.Interfaces.RealOutput PHI_TM_PNT_Actuator_W annotation(
  //        Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //      Modelica.Blocks.Math.Product lossPower annotation(
  //        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //      Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation(
  //        Placement(visible = true, transformation(origin = {-58, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  //    equation
  //      connect(firstOrder1.y, lossPower.u1) annotation(
  //        Line(points = {{-52, 40}, {-20, 40}, {-20, 6}, {-12, 6}, {-12, 6}}, color = {0, 0, 127}));
  //      connect(I_TM_CNT_ACT_A, firstOrder1.u) annotation(
  //        Line(points = {{-120, 40}, {-66, 40}, {-66, 40}, {-66, 40}}, color = {0, 0, 127}));
  //      connect(lossPower.y, PHI_TM_PNT_Actuator_W) annotation(
  //        Line(points = {{12, 0}, {102, 0}, {102, 0}, {110, 0}}, color = {0, 0, 127}));
  //      connect(V_BT_PNT_Lo_V, lossPower.u2) annotation(
  //        Line(points = {{-120, -40}, {-20, -40}, {-20, -6}, {-12, -6}, {-12, -6}}, color = {0, 0, 127}));
  //      annotation(
  //        Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {0, 0, 255}, extent = {{-100, 40}, {100, -40}}, textString = "%name")}));
  //    end Actuator_eLoss;
  //    model EOP_eLoss
  //      Modelica.Blocks.Interfaces.RealInput I_TM_CNT_EOP_A annotation(
  //        Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  //      Modelica.Blocks.Interfaces.RealInput V_BT_PNT_Lo_V annotation(
  //        Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  //      Modelica.Blocks.Interfaces.RealOutput PHI_TM_PNT_EOP_W annotation(
  //        Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //      Modelica.Blocks.Math.Product lossPower annotation(
  //        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //      Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01, k = 1, y(fixed = true), y_start = 0) annotation(
  //        Placement(visible = true, transformation(origin = {-58, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  //    equation
  //      connect(firstOrder1.y, lossPower.u1) annotation(
  //        Line(points = {{-52, 40}, {-20, 40}, {-20, 6}, {-12, 6}, {-12, 6}}, color = {0, 0, 127}));
  //      connect(I_TM_CNT_EOP_A, firstOrder1.u) annotation(
  //        Line(points = {{-120, 40}, {-66, 40}, {-66, 40}, {-66, 40}}, color = {0, 0, 127}));
  //      connect(lossPower.y, PHI_TM_PNT_EOP_W) annotation(
  //        Line(points = {{12, 0}, {102, 0}, {102, 0}, {110, 0}}, color = {0, 0, 127}));
  //      connect(V_BT_PNT_Lo_V, lossPower.u2) annotation(
  //        Line(points = {{-120, -40}, {-20, -40}, {-20, -6}, {-12, -6}, {-12, -6}}, color = {0, 0, 127}));
  //      annotation(
  //        Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {0, 0, 255}, extent = {{-100, 40}, {100, -40}}, textString = "%name")}));
  //    end EOP_eLoss;

end Mechanics;
