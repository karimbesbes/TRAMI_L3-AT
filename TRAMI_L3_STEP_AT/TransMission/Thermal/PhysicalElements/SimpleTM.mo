within TRAMI_L3_STEP_AT.TransMission.Thermal.PhysicalElements;
model SimpleTM "Ideal gear without inertia"
  extends Modelica.Mechanics.Rotational.Icons.Gear;
  extends Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2;
  Modelica.SIunits.Angle phi_a "Angle between left shaft flange and support";
  Modelica.SIunits.Angle phi_b "Angle between right shaft flange and support";
  Modelica.Blocks.Interfaces.RealInput gearRatio "Actual gear ratio. Should be never zero during continuous integration." annotation (
    Placement(transformation(origin = {0, 106}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 106}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
protected
  Real ratio "Gear ratio actually used (is never zero)";
  constant Real eps = 1.e-10;
initial equation
  phi_a = ratio * phi_b;
equation
  /* coppied from Power Train Library by C.Tsunemitsu @Dassault Systemes
  	     Analysis of a singular situation:
  	 
  	     gearRatio may change smoothly between forward and backward gear and
  	     then passes zero, i.e., gearRatio=0 can occur. Depending on the connection
  	     structure, the equations are either resolved for flange_b.tau or for
  	     flange_a.tau. In the latter case, a division by zero will occur when gearRatio=0:
  	 
  	          flange_a.tau = flange_b.tau / gearRatio
  	 
  	     This case is uninteresting, because in such a case the clutch attached to
  	     IdealCVT will be anyway released and therefore the torques are zero.
  	 
  	     To avoid the division by zero, one might use the guard:
  	 
  	          ratio = if noEvent(abs(gearRatio) > eps) then gearRatio else eps;
  	 
  	     However, this equation needs to be differentiated, since 
  	    
  	          der(phi_a) = ratio*der(phi_b)
  	 
  	     and the acceleration needs to be computed, which means that der(ratio) is
  	     needed. A Modelica tool might print a warning in this case, because
  	     differentiating an if-clause usually results in a dirac impulse. 
  	     Mathematically, this is really the case above, because the if-clause is
  	     discontinuous. This error should not be relevant and shall therefore
  	     be neglected. This can be formulated with the smooth(..) operator:
  	 
  	         ratio = smooth(100, if noEvent(abs(gearRatio) > eps) then gearRatio else eps);
  	 
  	     In some special cases, "gearRatio" can be a constant, say 1. The symbolic 
  	     transformation algorithms may then transform the above equation to
  	 
  	         ratio = smooth(100, 1);
  	 
  	     Dymola has the bug, that the second argument to smooth cannot be an Integer,
  	     contrary to the specification. If it is an Integer an error occurs.
  	     To avoid this error in Dymola, gearRatio is multiplied with a number that is
  	     nearly one. This gives a negliable error. 
  	 
  	     The above analysis results in the following equation:
  	  */
  ratio = smooth(100, noEvent(if abs(gearRatio) > eps then (1.0 + Modelica.Constants.eps) * gearRatio else eps));
  /*
  	  ratio = smooth(100, noEvent(if abs(gearRatio) > eps then gearRatio else eps));
  	  */
  der(phi_a) = ratio * der(phi_b);
  phi_a = flange_a.phi - phi_support;
  phi_b = flange_b.phi - phi_support;
  0 = ratio * flange_a.tau + flange_b.tau;
  annotation (
    Icon(graphics = {Text(textString = "%name", lineColor = {0, 0, 255}, fillPattern = FillPattern.None, extent = {{-153, 145}, {147, 105}})}),
    Documentation(info = "<html>
<p>
This element characterizes any type of gear box which is fixed in the
ground and which has one driving shaft and one driven shaft.
The gear is <b>ideal</b>, i.e., it does not have inertia, elasticity, damping
or backlash. If these effects have to be considered, the gear has to be
connected to other elements in an appropriate way.
</p>

</html>"));
end SimpleTM;
