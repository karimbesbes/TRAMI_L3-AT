within TRAMI_L3_STEP_AT.Libraries.Mechanics;
model ElastoGap
  import SI = Modelica.SIunits;
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  parameter SI.TranslationalSpringConstant c(final min = 0, start = 1) "Spring constant";
  parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) "Damping constant";
  parameter SI.Position s_rel0 = 0 "Unstretched spring length";
  parameter Real n(final min = 1) = 1 "Exponent of spring force ( f_c = -c*|s_rel-s_rel0|^n )";
  parameter Real Coeff = 1e5;
  SI.Force f_c "Spring force";
  SI.Force f_d2 "Linear damping force";
  SI.Force f_d_tmp;
  SI.Force f_d "Linear damping force which is limited by spring force (|f_d| <= |f_c|)";
  Real contact;
  Real gap;
equation
  gap = s_rel0 - s_rel;
  contact = (1 + tanh(Coeff * gap)) / 2;
  f_c = -c * abs(gap) ^ n * contact;
  f_d2 = d * v_rel * contact;
  f_d_tmp = noEvent(max(-abs(f_c), f_d2));
  f_d = noEvent(min(abs(f_c), f_d_tmp));
  f = f_c + f_d;
  annotation (
    Icon(graphics = {Polygon(lineColor = {95, 127, 95}, fillColor = {95, 127, 95}, fillPattern = FillPattern.Solid, points = {{58, -70}, {28, -60}, {28, -80}, {58, -70}}), Text(extent = {{-150, -160}, {150, -130}}, textString = "d=%d"), Rectangle(lineColor = {0, 127, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{10, -6}, {50, -50}}), Text(extent = {{-150, -125}, {150, -95}}, textString = "c=%c"), Line(points = {{-12, -38}, {-12, 36}}, color = {0, 127, 0}, thickness = 1), Line(points = {{-12, -28}, {70, -28}, {70, 24}}, color = {0, 127, 0}), Line(visible = false, points = {{-100, -100}, {-100, -44}, {22, -44}, {22, -28}}, color = {191, 0, 0}, pattern = LinePattern.Dot), Line(points = {{-48, 36}, {-48, -38}}, color = {0, 127, 0}, thickness = 1), Line(points = {{-12, 24}, {0, 24}, {6, 34}, {18, 14}, {30, 34}, {42, 14}, {54, 34}, {60, 24}, {70, 24}}, color = {0, 127, 0}), Line(points = {{0, -50}, {50, -50}, {50, -6}, {0, -6}}, color = {0, 127, 0}), Line(points = {{-98, 0}, {-48, 0}}, color = {0, 127, 0}), Line(points = {{-52, -70}, {28, -70}}, color = {95, 127, 95}), Text(lineColor = {0, 0, 255}, extent = {{-150, 100}, {150, 60}}, textString = "%name")}));
end ElastoGap;
