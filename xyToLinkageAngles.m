function [theta1, theta2] = xyToLinkageAngles(Xt, Yt)

%Constants:
R =
Xm1 =
Ym1 =

%Direct Kinematics:
Xc = ((Xt-Xm1));

    %Adjacent
int AbC = (sqrt(Xt-Xm1)^2 + (Yt-Ym1)^2)/2.00;
if (AbC > R)
    singularity()
end

    %Opposite
n = sqrt(AbC^2 - R^2);

thetaB = arcsin(n, R);
thetaA = arcsin((Yx-Ym1)/(Xc-Ym1));   %assumes px are counted from top of frame

if (invertedL)
    theta1 = thetaA - thetaB;
else theta1 = thetaA + thetaB;
end

%Inverse Kinematics:
theta2 = theta1ToTheta2(theta1, Xt, Yt);

return [theta1, theta2]
