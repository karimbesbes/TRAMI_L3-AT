within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block CombiTable3D "3-Dim Table"
  parameter String fileName = "NoName" "File where matrixes is stored";
  parameter String tableName = "test" "TableName";
  parameter Real zi[:] = {1, 2, 3} "z axis values";
  Modelica.Blocks.Tables.CombiTable2D block1[nz](each tableOnFile = true, tableName = {tableName + String(i) for i in 1:nz}, each fileName = fileName) "Table look-up in two dimensions (matrix/file)" annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  parameter Boolean noExtrapolate = true "Do not Extrapolate(unavailable)";
  //	protected
  parameter Integer nz = size(zi, 1) "number of zi";
public
  extends Interfaces.SI3SO;
algorithm
  // enter your algorithm here
  if noExtrapolate and (u3 < zi[1] or u3 >= zi[nz]) then
    if u3 < zi[1] then
      y := block1[1].y;
    else
      y := block1[nz].y;
    end if;
  else
    y := Modelica.Math.Vectors.interpolate(zi, block1.y, u3);
  end if;
equation
  // enter your equations here
  for i in 1:nz loop
    block1[i].u1 = u1;
    block1[i].u2 = u2;
  end for;
end CombiTable3D;
