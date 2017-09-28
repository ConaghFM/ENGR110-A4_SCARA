function [theta1, theta2] = xyToLinkageAngles(Xt, Yt)

%Constants:
R = 241;
Xm1 = 261;
Ym1 = 448;

%Direct Kinematics:
Xc = ((Xt-Xm1));
Yc = ((Yt-Ym1)/2.00 + Ym1);

    %Adjacent
AbC = sqrt((Xt-Xm1).^2 + (Yt-Ym1).^2);
AbC = AbC/2.00;
if (AbC > R)
    % singularity()
end

    %Opposite
n = sqrt(R^2 - AbC.^2);

thetaB = asin(n/R);
thetaA = asin((Yc-Ym1)/(Xc-Xm1));   %assumes px are counted from top of frame

if (0) %to be fixed
    theta1 = thetaA - thetaB;
else theta1 = radtodeg(thetaA + thetaB);
end

%Inverse Kinematics:
theta2 = radtodeg(getTheta2(Xt, Yt));
end
