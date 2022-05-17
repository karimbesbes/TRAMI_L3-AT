within TRAMI_L3_STEP_AT.Vehicle;
model VEHICLE
  parameter Real Mv = 1738;
  parameter Real Rt = 0.334;
  parameter Real Coef_A = 196.5;
  parameter Real Coef_C = 0.03014;
  Modelica.Blocks.Math.Gain gain1(k = 1 / 100) annotation (
    Placement(visible = true, transformation(origin = {-195, -131}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Atan atan1 annotation (
    Placement(visible = true, transformation(origin = {-179, -131}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant CAR_WEIGHT(k = Mv) annotation (
    Placement(visible = true, transformation(origin = {-154, -110}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant ROAD_GRADIENT(k = 0) annotation (
    Placement(visible = true, transformation(origin = {-211, -131}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain TIRE_R2(k = Rt) annotation (
    Placement(visible = true, transformation(origin = {40, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 3.6) annotation (
    Placement(visible = true, transformation(origin = {64, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain TIRE_R3(k = Rt) annotation (
    Placement(visible = true, transformation(origin = {40, 28}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = 1 / 9.8) annotation (
    Placement(visible = true, transformation(origin = {66, 28}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Cd(k = Coef_C) annotation (
    Placement(visible = true, transformation(origin = {-169, -79}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product7 annotation (
    Placement(visible = true, transformation(origin = {-132, -76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product8 annotation (
    Placement(visible = true, transformation(origin = {-132, -120}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Sin sin1 annotation (
    Placement(visible = true, transformation(origin = {-153, -131}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v_vehicle_mps annotation (
    Placement(visible = true, transformation(origin = {118, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, 34}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain8(k = -9.8) annotation (
    Placement(visible = true, transformation(origin = {-112, -120}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain7(k = -Rt) annotation (
    Placement(visible = true, transformation(origin = {-154, 6}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product9 annotation (
    Placement(visible = true, transformation(origin = {-189, -67}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput out_vehicle_G_g annotation (
    Placement(visible = true, transformation(origin = {118, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, 12}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor1 annotation (
    Placement(visible = true, transformation(origin = {-56, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = Mv * Rt ^ 2 + 3.05, phi(fixed = true, start = 0), w(start = 0)) annotation (
    Placement(visible = true, transformation(origin = {-6, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d = 0, w_rel(fixed = true)) annotation (
    Placement(visible = true, transformation(origin = {76, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation (
    Placement(visible = true, transformation(origin = {116, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque LoadTorque annotation (
    Placement(visible = true, transformation(origin = {-34, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor WheelSpeedW annotation (
    Placement(visible = true, transformation(origin = {26, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sensors.AccSensor accSensor1 annotation (
    Placement(visible = true, transformation(origin = {14, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Add add1 annotation (
    Placement(visible = true, transformation(origin = {-85, -57}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation (
    Placement(visible = true, transformation(origin = {-17, -57}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput tau_brake annotation (
    Placement(visible = true, transformation(origin = {-200, 132}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-81, -9}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput trq_DS_PNT_out_Nm annotation (
    Placement(visible = true, transformation(origin = {-238, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-108, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_DS_PNT_out_radps annotation (
    Placement(visible = true, transformation(origin = {-238, 102}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, 58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain9(k = 1000 / 3600) annotation (
    Placement(visible = true, transformation(origin = {96, 54}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = Coef_A) annotation (
    Placement(visible = true, transformation(origin = {-123, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation (
    Placement(visible = true, transformation(origin = {-172, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {-102, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.TorqueToAngleAdaptor torqueToAngleAdaptor1(use_a = false, use_w = true) annotation (
    Placement(visible = true, transformation(origin = {-188, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain4(k = -1) annotation (
    Placement(visible = true, transformation(origin = {-210, 82}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds1(table = [-1, -1; -0.1, -1; 0, 0; 0.1, 1; 1, 1]) annotation (
    Placement(visible = true, transformation(origin = {-150, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TRAMI_L3_STEP_AT.Vehicle.TRAMI_Brake tRAMI_Brake(Coeff = 1e2) annotation (
    Placement(visible = true, transformation(origin = {-140, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 2000) annotation (
    Placement(visible = true, transformation(origin = {-160, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(combiTable1Ds1.y[1], product1.u1) annotation (
    Line(points = {{-138, 34}, {-126, 34}, {-126, 18}, {-114, 18}, {-114, 18}}, color = {0, 0, 127}, thickness = 0.5));
  connect(speedSensor1.w, combiTable1Ds1.u) annotation (
    Line(points = {{-172, 60}, {-172, 60}, {-172, 34}, {-162, 34}, {-162, 34}}, color = {0, 0, 127}));
  connect(torqueToAngleAdaptor1.flange, speedSensor1.flange) annotation (
    Line(points = {{-186, 100}, {-172, 100}, {-172, 80}, {-172, 80}}));
  connect(gain7.y, product1.u2) annotation (
    Line(points = {{-148, 6}, {-114, 6}, {-114, 6}, {-114, 6}}, color = {0, 0, 127}));
  connect(add2.y, gain7.u) annotation (
    Line(points = {{-9, -57}, {0, -57}, {0, -26}, {-176, -26}, {-176, 6}, {-161, 6}}, color = {0, 0, 127}));
  connect(gain4.y, torqueToAngleAdaptor1.tau) annotation (
    Line(points = {{-204, 82}, {-198, 82}, {-198, 92}, {-192, 92}, {-192, 92}}, color = {0, 0, 127}));
  connect(trq_DS_PNT_out_Nm, gain4.u) annotation (
    Line(points = {{-238, 82}, {-218, 82}, {-218, 82}, {-218, 82}}, color = {0, 0, 127}));
  connect(product1.y, LoadTorque.tau) annotation (
    Line(points = {{-90, 12}, {-48, 12}, {-48, 12}, {-46, 12}}, color = {0, 0, 127}));
  connect(w_DS_PNT_out_radps, torqueToAngleAdaptor1.w) annotation (
    Line(points = {{-238, 102}, {-208, 102}, {-208, 102}, {-192, 102}, {-192, 104}}, color = {0, 0, 127}));
  connect(LoadTorque.flange, inertia1.flange_a) annotation (
    Line(points = {{-24, 12}, {-16, 12}, {-16, 100}, {-16, 100}}));
  connect(Cd.y, product7.u2) annotation (
    Line(points = {{-163.5, -79}, {-139.5, -79}, {-139.5, -81}}, color = {0, 0, 127}));
  connect(add1.y, add2.u1) annotation (
    Line(points = {{-78, -56}, {-56, -56}, {-56, -52}, {-26, -52}, {-26, -52}, {-26, -52}}, color = {0, 0, 127}));
  connect(gain8.y, add2.u2) annotation (
    Line(points = {{-105.4, -120}, {-39.4, -120}, {-39.4, -62}, {-25, -62}, {-25, -61}}, color = {0, 0, 127}));
  connect(const.y, add1.u1) annotation (
    Line(points = {{-117.5, -53}, {-91.5, -53}}, color = {0, 0, 127}));
  connect(product7.y, add1.u2) annotation (
    Line(points = {{-125, -76}, {-113.4, -76}, {-113.4, -59}, {-103.2, -59}, {-103.2, -61}, {-93, -61}}, color = {0, 0, 127}));
  connect(product9.y, product7.u1) annotation (
    Line(points = {{-183.5, -67}, {-150, -67}, {-150, -68}, {-149, -68}, {-149, -74}, {-140, -74}}, color = {0, 0, 127}));
  connect(gain2.y, product9.u1) annotation (
    Line(points = {{70, 54}, {80, 54}, {80, -146}, {-238, -146}, {-238, -64}, {-195, -64}}, color = {0, 0, 127}));
  connect(gain2.y, product9.u2) annotation (
    Line(points = {{70, 54}, {80, 54}, {80, -146}, {-238, -146}, {-238, -70}, {-195, -70}}, color = {0, 0, 127}));
  connect(product8.y, gain8.u) annotation (
    Line(points = {{-125.4, -120}, {-120.4, -120}}, color = {0, 0, 127}));
  connect(sin1.y, product8.u2) annotation (
    Line(points = {{-147.5, -131}, {-146.375, -131}, {-146.375, -131}, {-145.25, -131}, {-145.25, -131}, {-143, -131}, {-143, -124}, {-141.5, -124}, {-141.5, -124}, {-140, -124}}, color = {0, 0, 127}));
  connect(atan1.y, sin1.u) annotation (
    Line(points = {{-173.5, -131}, {-159.5, -131}}, color = {0, 0, 127}));
  connect(CAR_WEIGHT.y, product8.u1) annotation (
    Line(points = {{-147.4, -110}, {-143.4, -110}, {-143.4, -116}, {-139.4, -116}, {-139.4, -116}, {-139.4, -116}, {-139.4, -116}}, color = {0, 0, 127}));
  connect(ROAD_GRADIENT.y, gain1.u) annotation (
    Line(points = {{-205.5, -131}, {-201.5, -131}}, color = {0, 0, 127}));
  connect(gain1.y, atan1.u) annotation (
    Line(points = {{-189.5, -131}, {-185.5, -131}}, color = {0, 0, 127}));
  connect(torqueSensor1.flange_b, inertia1.flange_a) annotation (
    Line(points = {{-46, 100}, {-16, 100}}));
  connect(accSensor1.a, TIRE_R3.u) annotation (
    Line(points = {{14, 38}, {14, 38}, {14, 28}, {32, 28}, {32, 28}}, color = {0, 0, 127}));
  connect(gain9.y, v_vehicle_mps) annotation (
    Line(points = {{102, 54}, {112, 54}, {112, 54}, {118, 54}}, color = {0, 0, 127}));
  connect(gain9.u, gain2.y) annotation (
    Line(points = {{88, 54}, {70, 54}, {70, 54}, {70, 54}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, accSensor1.flange) annotation (
    Line(points = {{4, 100}, {14, 100}, {14, 58}, {14, 58}}));
  connect(gain3.y, out_vehicle_G_g) annotation (
    Line(points = {{73, 28}, {116, 28}}, color = {0, 0, 127}));
  connect(TIRE_R2.u, WheelSpeedW.w) annotation (
    Line(points = {{33, 54}, {26, 54}, {26, 69}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, WheelSpeedW.flange) annotation (
    Line(points = {{4, 100}, {26, 100}, {26, 90}}));
  connect(TIRE_R3.y, gain3.u) annotation (
    Line(points = {{47, 28}, {59, 28}}, color = {0, 0, 127}));
  connect(TIRE_R2.y, gain2.u) annotation (
    Line(points = {{47, 54}, {57, 54}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, damper1.flange_a) annotation (
    Line(points = {{4, 100}, {66, 100}}));
  connect(damper1.flange_b, fixed1.flange) annotation (
    Line(points = {{86, 100}, {116, 100}, {116, 100}, {116, 100}}));
  connect(torqueToAngleAdaptor1.flange, tRAMI_Brake.flange_a) annotation (
    Line(points = {{-186, 100}, {-150, 100}, {-150, 100}, {-150, 100}}));
  connect(tRAMI_Brake.flange_b, torqueSensor1.flange_a) annotation (
    Line(points = {{-130, 100}, {-68, 100}, {-68, 100}, {-66, 100}}));
  connect(tau_brake, gain.u) annotation (
    Line(points = {{-200, 132}, {-172, 132}, {-172, 132}, {-172, 132}}, color = {0, 0, 127}));
  connect(gain.y, tRAMI_Brake.tau_cap) annotation (
    Line(points = {{-148, 132}, {-140, 132}, {-140, 112}, {-140, 112}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Polygon(origin = {3, 42}, fillColor = {0, 170, 255},
            fillPattern =                                                               FillPattern.Solid, points = {{-43, 30}, {7, 30}, {37, -2}, {77, -2}, {77, -36}, {-83, -36}, {-83, -2}, {-63, -2}, {-43, 30}}), Polygon(origin = {11, 54}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-31, 14}, {-5, 14}, {21, -14}, {-31, -14}, {-31, 14}}), Polygon(origin = {-39, 54}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{1, 14}, {-15, -14}, {15, -14}, {15, 14}, {1, 14}}), Ellipse(origin = {-45, 7},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-15, 15}, {15, -15}}, endAngle = 360), Ellipse(origin = {47, 7},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-15, 15}, {15, -15}}, endAngle = 360)}, coordinateSystem(extent = {{-250, -150}, {200, 150}}, initialScale = 0.1)),
    Diagram(coordinateSystem(extent = {{-250, -150}, {200, 150}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end VEHICLE;
