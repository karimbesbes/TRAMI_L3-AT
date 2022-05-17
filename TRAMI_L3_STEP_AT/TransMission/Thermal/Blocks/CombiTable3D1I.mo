within TRAMI_L3_STEP_AT.TransMission.Thermal.Blocks;
block CombiTable3D1I "Combination of 3-Dim Tables"
  parameter String fileName = "noName" "File where matrixis stored";
  parameter String tableName = "test" "TableName";
  parameter Integer nGears[:] = {1, 2, 3, 4, 5, 6} "numbers of Shift Gear";
  parameter Real zi[:] = {1, 2, 3} "z axis values";
protected
  parameter Integer nGearsNum = size(nGears, 1);
public
  parameter Boolean noExtrapolate = true "Do not Extrapolate(unavailable)";
  CombiTable3D combiTable3D1[nGearsNum](fileName = {Modelica.Utilities.Strings.substring(fileName, 1, Modelica.Utilities.Strings.findLast(fileName, String(min(nGears))) - 1) + String(i) + Modelica.Utilities.Strings.substring(fileName, Modelica.Utilities.Strings.findLast(fileName, String(min(nGears))) + Modelica.Utilities.Strings.length(String(min(nGears))), Modelica.Utilities.Strings.length(fileName)) for i in nGears}, each tableName = tableName, each zi = zi) "CoombiTable3D" annotation (
    Placement(transformation(extent = {{45, -10}, {65, 10}})));
protected
  Integer calcIndex = min(max(nGear - min(nGears) + 1, 1), nGearsNum) "Variable";
public
  extends Interfaces.SI4SO;
equation
  // enter your equations here
  for i in 1:size(nGears, 1) loop
    combiTable3D1[i].u1 = u1;
    combiTable3D1[i].u2 = u2;
    combiTable3D1[i].u3 = u3;
  end for;
  y = combiTable3D1[calcIndex].y;
  annotation (
    Documentation(info = "<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=shift_jis\">
<META name=\"GENERATOR\" content=\"MSHTML 11.00.9600.19204\"></HEAD>
<BODY>
<P>&nbsp;2018/12/19</P>
<P>Input integer value of calcIndex is limited to avoid out of array 
range.&nbsp;</P></BODY></HTML>
            "));
end CombiTable3D1I;
