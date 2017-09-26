function [motor1, motor2] = a2pwm(theta1, theta2)

motor1 = (theta1 - 2.1*10^2) / -0.097
motor2 = (theta2 - 1.7*10^2)/ -0.08

end