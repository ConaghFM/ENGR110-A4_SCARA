function theta2 = getTheta2(Xt, Yt)

%Constants:
R = 241.0;
Xm2 = 394.0;
Ym2 = 445.0;

%Calculate C cooridinates, halfway point on hypotenuse of T and M2
Xc = (Xm2-Xt)/2.0+Xt;
Yc = (Ym2-Yt)/2.0+Yt;

%Adjacent length from C to T
AbC = sqrt((Xm2-Xt).^2+(Ym2-Yt).^2);
AbC = AbC/2.00;

%if (AbC > R) %singularity
%    return;
%end

%Opposite length from C to J2
n = sqrt(R.^2 - AbC.^2);

value1 = Xm2-Xt;
if (value1 == 0)
    value1 = 1;
end

beta = atan((Ym2-Yt)/value1);
delta = acos(AbC/R);
theta2 = pi-beta-delta;

%arg1 = Xj-Xm2
%arg2 = Yj-Ym2

%theta2 = atan2(arg1,arg2);


