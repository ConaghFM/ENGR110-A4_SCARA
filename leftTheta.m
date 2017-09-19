function  thetaL = leftTheta(XT, YT, Xm1, Ym1, R)
directLine = sqrt((abs(XT-Xm)^2)+(abs(YT-Ym)));
halfDirectLine = directLine/2;
theta1 = acos(halfDirectLine/R);
theta2 = atan(abs(YT-Ym)/abs(XT-Xm));
thetaL = theta1+theta2;
end



