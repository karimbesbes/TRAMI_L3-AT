within TRAMI_L3_STEP_AT.TransMission.Thermal.PhysicalElements;
model HeatCapacitorInitT "Lumped thermal element storing heat"
  HeatPort port "Thermal port for 1-dim. heat transfer" annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{-10, -106.7}, {10, -86.7}})));
  parameter Modelica.SIunits.HeatCapacity C "Heat capacity of element (= cp*m)";
  Modelica.SIunits.TemperatureSlope der_T(start = 0) "Time derivative of temperature (= der(T))";
  ThermodynamicTemperature T "Temperature of element" annotation (
    Dialog(group = "Initialization", showStartAttribute = true));
equation
  T = port.T;
  der_T = der(T);
  C * der(T) = port.Q_flow;
  annotation (
    Icon(graphics = {Text(textString = "%name", lineColor = {0, 0, 255}, fillPattern = FillPattern.None, extent = {{-150, 110}, {150, 70}}), Polygon(points = ":189:
789C5CD23B0EC2300C8061AB13C76062E8C08000090670518B78D307709EDC8C1C892350E1DF484DA42AF9E43871D2642232E9BF4C92166BB5C13CFEBA70C725
BEE013AEF01517B831CB0AB738C71DFEBC2DCF3D8DC3F876E85025F63AD84F6BE2F4EAFB1EB0AFBBB13E3EF02CB130FF89C756B7BEF032B19AA3CFE75ED4D73B
13F77AB847AF2F70EFE146BCD1E47CF848BCC505EECCB260BE3B4F3C228F7C99EA60FFFFFFA2DEC0B9648F4BBCC3FE1ED69CC7D7A1F5EFE90B0000FFFF",
                                                                                                                     lineColor = {160, 160, 164}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Polygon(points = ":201:
789C5CD14B0AC2400C06E0D033B874E1C2851411AC5228428DD0966AAB687D9C676EE61CC92358CC1F212994F0919964669210D172FC13D2EF1C7F211C587C13
53010F700ADFE1CF5BF6A957D1E6F7D6A1763E21A21F5F914764EDDBC25AB794181F70E64C58FF8467726E7EC1B9338BA3AEAF91D77A1DF283CBEB792AE712EB
D55B572F739E3B93ABB7C07DB47FEEACEFA173AB90D7F73C4A0C1DDCC33A8FFFFCADA940BC20A6CE13E729DBFD6B36FD680363EEB4835BED0F3770C3E63EA1B7
F5C7F55F000000FFFF",
             fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Text(textString = "%C", fillPattern = FillPattern.None, extent = {{-69, 7}, {71, -24}})}),
    Diagram(graphics = {Polygon(points = ":189:
789C5CD23B0EC2300C8061AB13C76062E8C08000090670518B78D307709EDC8C1C892350E1DF484DA42AF9E43871D2642232E9BF4C92166BB5C13CFEBA70C725
BEE013AEF01517B831CB0AB738C71DFEBC2DCF3D8DC3F876E85025F63AD84F6BE2F4EAFB1EB0AFBBB13E3EF02CB130FF89C756B7BEF032B19AA3CFE75ED4D73B
13F77AB847AF2F70EFE146BCD1E47CF848BCC505EECCB260BE3B4F3C228F7C99EA60FFFFFFA2DEC0B9648F4BBCC3FE1ED69CC7D7A1F5EFE90B0000FFFF",
                                                                                                                     lineColor = {160, 160, 164}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Polygon(points = ":201:
789C5CD14B0AC2400C06E0D033B874E1C2851411AC5228428DD0966AAB687D9C676EE61CC92358CC1F212994F0919964669210D172FC13D2EF1C7F211C587C13
53010F700ADFE1CF5BF6A957D1E6F7D6A1763E21A21F5F914764EDDBC25AB794181F70E64C58FF8467726E7EC1B9338BA3AEAF91D77A1DF283CBEB792AE712EB
D55B572F739E3B93ABB7C07DB47FEEACEFA173AB90D7F73C4A0C1DDCC33A8FFFFCADA940BC20A6CE13E729DBFD6B36FD680363EEB4835BED0F3770C3E63EA1B7
F5C7F55F000000FFFF",
             fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Ellipse(lineColor = {255, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-6, -1}, {6, -12}}), Text(textString = "T", fillPattern = FillPattern.None, extent = {{11, 13}, {50, -25}}), Line(points = {{0, -12}, {0, -96}}, color = {255, 0, 0})}),
    Documentation(info = "<HTML><HEAD>
<META charset=\"utf-8\">
<STYLE type=\"text/css\">
a {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;}
body, blockquote, table, p, li, dl, ul, ol {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; color: black;}
h3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11pt; font-weight: bold;}
h4 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold;}
h5 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: bold;}
h6 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; font-weight: bold; font-style:italic}
pre {font-family: Courier, monospace; font-size: 9pt;}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<P>This is a generic model for the heat capacity of a material. No specific 
geometry is assumed beyond a total volume with uniform temperature for the 
entire volume. Furthermore, it is assumed that the heat capacity is constant 
(independent of temperature). </P>
<P>The temperature T [Kelvin] of this component is a <B>state</B>. A default of 
T = 25 degree Celsius (= SIunits.Conversions.from_degC(25)) is used as start 
value for initialization. This usually means that at start of integration the 
temperature of this component is 25 degrees Celsius. You may, of course, define 
a different temperature as start value for initialization. Alternatively, it is 
possible to set parameter <B>steadyStateStart</B> to <B>true</B>. In this case
 the additional equation '<B>der</B>(T) = 0' is used during initialization, 
i.e., the temperature T is computed in such a way that the component starts in 
<B>steady state</B>. This is useful in cases, where one would like to start 
simulation in a suitable operating point without being forced to integrate for a 
long time to arrive at this point. </P>
<P>Note, that parameter <B>steadyStateStart</B> is not available in the 
parameter menu of the simulation window, because its value is utilized during 
translation to generate quite different equations depending on its setting. 
Therefore, the value of this parameter can only be changed before translating 
the model. </P>
<P>This component may be used for complicated geometries where the heat capacity 
C is determined my measurements. If the component consists mainly of one type of 
material, the <B>mass m</B> of the component may be measured or calculated and 
multiplied with the <B>specific heat capacity cp</B> of the component material 
to compute C: </P>
<PRE>   C = cp*m.
   Typical values for cp at 20 degC in J/(kg.K):
      aluminium   896
      concrete    840
      copper      383
      iron        452
      silver      235
      steel       420 ... 500 (V2A)
      wood       2500
</PRE></BODY></HTML>
            "));
end HeatCapacitorInitT;
