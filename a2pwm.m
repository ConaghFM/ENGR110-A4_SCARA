function [motor1, motor2] = a2pwm(theta1, theta2)


%motor2 = (theta1 - 2.5*10^2) / (-0.094)
%motor1 = (theta1 - 2.1*10^2) / -0.097
%motor2 = (theta2 - 1.7*10^2)/ -0.08
%motor1 = (-10 * theta2 + 2*10^3)

motor1 = round(-10 * (theta1 - 264));
motor2 = round(-10 * (theta2 - 204));

end
