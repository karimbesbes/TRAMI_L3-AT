within TRAMI_L3_STEP_AT.Libraries.Utilities;
model Min
  Modelica.Blocks.Interfaces.RealInput u1 annotation (
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Logical.LessEqual lessEqual1 annotation (
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(switch1.y, y) annotation (
    Line(points = {{12, 0}, {104, 0}, {104, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(u2, switch1.u3) annotation (
    Line(points = {{-120, -60}, {-30, -60}, {-30, -8}, {-12, -8}, {-12, -8}}, color = {0, 0, 127}));
  connect(u1, switch1.u1) annotation (
    Line(points = {{-120, 60}, {-30, 60}, {-30, 8}, {-12, 8}, {-12, 8}}, color = {0, 0, 127}));
  connect(lessEqual1.y, switch1.u2) annotation (
    Line(points = {{-38, 0}, {-12, 0}, {-12, 0}, {-12, 0}}, color = {255, 0, 255}));
  connect(u2, lessEqual1.u2) annotation (
    Line(points = {{-120, -60}, {-80, -60}, {-80, -8}, {-62, -8}, {-62, -8}}, color = {0, 0, 127}));
  connect(u1, lessEqual1.u1) annotation (
    Line(points = {{-120, 60}, {-80, 60}, {-80, 0}, {-62, 0}, {-62, 0}}, color = {0, 0, 127}));
end Min;
