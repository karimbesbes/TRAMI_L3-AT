within TRAMI_L3_STEP_AT.Libraries.Utilities;
model CombiTable3D
  Modelica.Blocks.Interfaces.RealInput u annotation (
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u1 annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
  parameter Real z_ax[:] = {10, 20, 40, 50};
  parameter Integer nz = size(z_ax, 1) "number of zi";
  parameter String filename = "NoName" "File where matrix is stored" annotation (
    Dialog(group = "Table data definition", enable = tableOnFile, loadSelector(filter = "Text files (*.txt);;MATLAB MAT-files (*.mat)", caption = "Open file in which table is present")));
  parameter String tableName = "tab(i) for i=1:nz" "Table name on file" annotation (
    Dialog(group = "Table data definition", enable = tableOnFile));
  parameter Boolean verboseRead = true "= true, if info message that file is loading is to be printed" annotation (
    Dialog(group = "Table data definition", enable = tableOnFile));
  parameter Modelica.Blocks.Types.Smoothness smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments "Smoothness of table interpolation" annotation (
    Dialog(group = "Table data interpretation"));
  parameter Modelica.Blocks.Types.Extrapolation extrapolation = Modelica.Blocks.Types.Extrapolation.LastTwoPoints "Extrapolation of data outside the definition range" annotation (
    Dialog(group = "Table data interpretation"));
  parameter Boolean verboseExtrapolation = false "= true, if warning messages are to be printed if table input is outside the definition range" annotation (
    Dialog(group = "Table data interpretation", enable = extrapolation == Modelica.Blocks.Types.Extrapolation.LastTwoPoints or extrapolation == Modelica.Blocks.Types.Extrapolation.HoldLastPoint));

  class ExternalCombiTable3D
    extends ExternalObject;

    function constructor
      extends Modelica.Icons.Function;
      input String tableName;
      input String fileName;
      input Real z_ax[:];
      input Integer nz;
      input Real table[:, :];
      input Modelica.Blocks.Types.Smoothness smoothness;
      input Modelica.Blocks.Types.Extrapolation extrapolation = Modelica.Blocks.Types.Extrapolation.LastTwoPoints;
      input Boolean verbosRead = true;
      output ExternalCombiTable3D tableID;

      external "C" tableID = createCombiTable3D(fileName, tableName, z_ax, nz, table, size(table, 1), size(table, 2), smoothness, extrapolation, verbosRead)
      annotation (
        Include = "#include <CombiTable3D.c>",
        IncludeDirectory = "modelica://TRAMI_L3_STEP_AT/library_etc");
    end constructor;

    function destructor
      extends Modelica.Icons.Function;
      input ExternalCombiTable3D tableID;

      external "C" deleteCombiTable3D(tableID)
      annotation (
        Include = "#include <CombiTable3D.c>",
        IncludeDirectory = "modelica://TRAMI_L3_STEP_AT/library_etc");
    end destructor;
  end ExternalCombiTable3D;

  function CombiTable3D_getValue
    extends Modelica.Icons.Function;
    input ExternalCombiTable3D tableID;
    input Real u1;
    input Real u2;
    input Real u3;
    output Real out;

    external "C" out = combiTable3D_getValue(tableID, u1, u2, u3)
    annotation (
      Include = "#include <CombiTable3D.c>",
      IncludeDirectory = "modelica://TRAMI_L3_STEP_AT/library_etc",
      Library = "ModelicaStandardTables");
  end CombiTable3D_getValue;
protected
  parameter Boolean tableOnFile = true "= true, if table is defined on file or in function usertab" annotation (
    Dialog(group = "Table data definition"));
  parameter Real table[:, :] = fill(0.0, 0, 2) "Table matrix (grid u1 = first column, grid u2 = first row; e.g., table=[0, 0; 0, 1])" annotation (
    Dialog(group = "Table data definition", enable = not tableOnFile));
  parameter ExternalCombiTable3D tableID = ExternalCombiTable3D(if tableOnFile then tableName else "NoName", if tableOnFile and filename <> "NoName" and not Modelica.Utilities.Strings.isEmpty(filename) then currDir + "/Tables/" + filename else "NoName", z_ax, nz, table, smoothness, extrapolation, if tableOnFile then verboseRead else false);
equation
  y = CombiTable3D_getValue(tableID, u, u1, u2);
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {-16, -8}, points = {{-60, 40}, {-60, -40}, {60, -40}, {60, 40}, {30, 40}, {30, -40}, {-30, -40}, {-30, 40}, {-60, 40}, {-60, 20}, {60, 20}, {60, 0}, {-60, 0}, {-60, -20}, {60, -20}, {60, -40}, {-60, -40}, {-60, 40}, {60, 40}, {60, -40}}), Line(origin = {-16, -8}, points = {{0, 40}, {0, -40}}), Line(origin = {-16, -8}, points = {{-60, 40}, {-30, 20}}), Line(origin = {-16, -8}, points = {{-30, 40}, {-60, 20}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, 0}, {-32.3077, 20}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, -20}, {-32.3077, 0}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, -40}, {-32.3077, -20}}), Rectangle(origin = {-16, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-30, 20}, {0, 40}}), Rectangle(origin = {-16, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 20}, {30, 40}}), Line(origin = {-2, 4}, points = {{-60, 40}, {-60, 28}, {60, 28}, {60, 40}, {30, 40}, {30, 28}, {-30, 28}, {-30, 40}, {-60, 40}, {-60, 28}, {60, 28}, {60, 0}, {46, 0}, {46, -20}, {60, -20}, {60, -40}, {46, -40}, {46, 40}, {60, 40}, {60, -40}}), Rectangle(origin = {-2, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Rectangle(origin = {-32, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Line(origin = {-2, 4}, points = {{-60, 40}, {-44, 28}}), Line(origin = {-2, 4}, points = {{-30, 40}, {-48, 28}}), Line(origin = {12, 16}, points = {{-60, 40}, {-60, 28}, {60, 28}, {60, 40}, {30, 40}, {30, 28}, {-30, 28}, {-30, 40}, {-60, 40}, {-60, 28}, {60, 28}, {60, 0}, {46, 0}, {46, -20}, {60, -20}, {60, -40}, {46, -40}, {46, 40}, {60, 40}, {60, -40}}), Rectangle(origin = {12, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Rectangle(origin = {-18, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Line(origin = {12, 16}, points = {{-60, 40}, {-44, 28}}), Rectangle(origin = {9.692, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Rectangle(origin = {-4.308, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Rectangle(origin = {-18.308, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Line(origin = {11.9666, 16.1}, points = {{-30, 40}, {-48, 28}}), Text(origin = {0, 133}, lineColor = {0, 0, 255}, extent = {{-140, 23}, {140, -23}}, textString = "%name")}),
    Diagram(coordinateSystem(initialScale = 0.1)),
    uses(Modelica(version = "3.2.3")));
end CombiTable3D;
