within TRAMI_L3_STEP_AT.Libraries;
package Utilities






  /*  model CombiTable3D
              parameter String filename;
              constant String currDir = Modelica.Utilities.Files.loadResource("modelica://TRAMI_L3_STEP_AT");
              parameter Real z_ax[:] = {10, 20, 40, 50};
              Modelica.Blocks.Tables.CombiTable2D combiTable2D1[nz](each fileName = currDir + "/Tables/" + filename, each smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, tableName = {"tab" + String(i) for i in 1:nz}, each tableOnFile = true) annotation(
                Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
              Modelica.Blocks.Interfaces.RealInput u annotation(
                Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
              Modelica.Blocks.Interfaces.RealInput u1 annotation(
                Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
              Modelica.Blocks.Interfaces.RealInput u2 annotation(
                Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
              parameter Boolean noExtrapolate = true;
              parameter Integer nz = size(z_ax, 1) "number of zi";
              Modelica.Blocks.Interfaces.RealOutput y annotation(
                Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
              Real y_z[nz];
            equation
              if noExtrapolate and (u2 < z_ax[1] or u2 >= z_ax[nz]) then
                if u2 < z_ax[1] then
                  y = combiTable2D1[1].y;
                else
                  y = combiTable2D1[nz].y;
                end if;
              else
                  y = Modelica.Math.Vectors.interpolate(z_ax, y_z, u2);
              end if;
              for i in 1:nz loop
                combiTable2D1[i].u1 = u;
                combiTable2D1[i].u2 = u1;
                y_z[i] = combiTable2D1[i].y;
              end for;
              annotation(
                Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {-16, -8}, points = {{-60, 40}, {-60, -40}, {60, -40}, {60, 40}, {30, 40}, {30, -40}, {-30, -40}, {-30, 40}, {-60, 40}, {-60, 20}, {60, 20}, {60, 0}, {-60, 0}, {-60, -20}, {60, -20}, {60, -40}, {-60, -40}, {-60, 40}, {60, 40}, {60, -40}}), Line(origin = {-16, -8}, points = {{0, 40}, {0, -40}}), Line(origin = {-16, -8}, points = {{-60, 40}, {-30, 20}}), Line(origin = {-16, -8}, points = {{-30, 40}, {-60, 20}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, 0}, {-32.3077, 20}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, -20}, {-32.3077, 0}}), Rectangle(origin = {-13.6923, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-62.3077, -40}, {-32.3077, -20}}), Rectangle(origin = {-16, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-30, 20}, {0, 40}}), Rectangle(origin = {-16, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 20}, {30, 40}}), Line(origin = {-2, 4}, points = {{-60, 40}, {-60, 28}, {60, 28}, {60, 40}, {30, 40}, {30, 28}, {-30, 28}, {-30, 40}, {-60, 40}, {-60, 28}, {60, 28}, {60, 0}, {46, 0}, {46, -20}, {60, -20}, {60, -40}, {46, -40}, {46, 40}, {60, 40}, {60, -40}}), Rectangle(origin = {-2, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Rectangle(origin = {-32, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Line(origin = {-2, 4}, points = {{-60, 40}, {-44, 28}}), Line(origin = {-2, 4}, points = {{-30, 40}, {-48, 28}}), Line(origin = {12, 16}, points = {{-60, 40}, {-60, 28}, {60, 28}, {60, 40}, {30, 40}, {30, 28}, {-30, 28}, {-30, 40}, {-60, 40}, {-60, 28}, {60, 28}, {60, 0}, {46, 0}, {46, -20}, {60, -20}, {60, -40}, {46, -40}, {46, 40}, {60, 40}, {60, -40}}), Rectangle(origin = {12, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Rectangle(origin = {-18, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{0, 28}, {30, 40}}), Line(origin = {12, 16}, points = {{-60, 40}, {-44, 28}}), Rectangle(origin = {9.692, 16}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Rectangle(origin = {-4.308, 4}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Rectangle(origin = {-18.308, -8}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{32.3077, 20}, {62.3077, 40}}), Line(origin = {11.9666, 16.1}, points = {{-30, 40}, {-48, 28}}), Text(origin = {0, 133}, lineColor = {0, 0, 255}, extent = {{-140, 23}, {140, -23}}, textString = "%name")}),
                Diagram(coordinateSystem(initialScale = 0.1)),
                uses(Modelica(version = "3.2.3")));
            end CombiTable3D;*/

end Utilities;
