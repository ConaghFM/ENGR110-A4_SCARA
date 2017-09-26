function theta2 = theta1ToTheta2(theta1, Xt, Yt)

%Constants:
R = 
Xm2
Ym2

Xc = (Xm2-Xt)/2+Xt;
Yc = (Ym2-Yt)/2+Yt;
AbC = (sqrt(Xm2-Xt)^2+(Ym2-Yt)^2)/2;
if (AbC > R) %singularity
    return;
end

n = sqrt(R^2-AbC^2);
beta = arctan((Ym2-Yt)/(Xm2-Xt));

if (invertedR)
    Xj = Xc - n * Cos((Pi/2.00)-beta);
    Yj = Yc - n * Sin((Pi/2.00)-beta);
else 
    Xj = Xc + n * Cos((Pi/2.00)-beta);
    Yj = Yc + n * Sin((Pi/2.00)-beta);
end

theta2 = arctan2((Xj-Xm2), (Yj-Ym2));

return theta2;
