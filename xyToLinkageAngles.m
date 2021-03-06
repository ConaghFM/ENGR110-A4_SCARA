function [theta1, theta2] = xyToLinkageAngles(Xt, Yt)

%Constants:
R = 241.0;
Xm1 = 261.0;
Ym1 = 448.0;

%Direct Kinematics:
%Xc = ((Xt-Xm1)/2.00 + Xm1);
%Yc = ((Yt-Ym1)/2.00 + Ym1);

    %Adjacent
AbC = sqrt((Xt-Xm1).^2 + (Yt-Ym1).^2);
AbC = AbC/2.00;
if (AbC > R)
    AbC = R;
    disp('T out of bounds');
end

    %Opposite
n = sqrt(R.^2 - AbC.^2);

thetaB = asin(n/R);
thetaA = atan((Yt-Ym1)/(Xt-Xm1));   %assumes px are counted from top of frame

%if (0) %to be fixed
%    theta1 = thetaA - thetaB;
%else 
%end

theta1 = radtodeg(thetaA + thetaB);

%Inverse Kinematics:
theta2 = radtodeg(getTheta2(Xt, Yt));
end
