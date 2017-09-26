function theta2 = theta1ToTheta2(Xt, Yt)

%Constants:
R = 241;
Xm2 = 394;
Ym2 = 445;

Xc = (Xm2-Xt)/2+Xt
Yc = (Ym2-Yt)/2+Yt
AbC = sqrt((Xm2-Xt)^2+(Ym2-Yt)^2)
AbC = AbC/2
%if (AbC > R) %singularity
%    return;
%end

value1 = Xm2-Xt

if (value1 == 0)
    value1 = 1
end

n = sqrt(R^2 - AbC^2)
beta = atan((Ym2-Yt)/value1)

if (0)
    Xj = Xc - n * cos((pi/2.00)-beta);
    Yj = Yc - n * sin((pi/2.00)-beta);
else 
    Xj = Xc + n * cos((pi/2.00)-beta);
    Yj = Yc + n * sin((pi/2.00)-beta);
end

arg1 = Xj-Xm2
arg2 = Yj-Ym2

theta2 = atan2(arg1,arg2);


