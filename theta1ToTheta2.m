theta1ToTheta2(theta1, Xt, Yt)

//Constants:
int R
int Xm2
int Ym2

int Xc = (Xm2-Xt)/2+Xt
int Yc = (Ym2-Yt)/2+Yt
int AbC = (sqrt(Xm2-Xt)^2+(Ym2-Yt)^2)/2
if (AbC > R)
    singularity()

int n = sqrt(R^2-AbC^2)
int beta = arctan((Ym2-Yt)/(Xm2-Xt))

if (invertedR){
    Xj = Xc - n * Cos((Pi/2.00)-beta)
    Yj = Yc - n * Sin((Pi/2.00)-beta)
}
else {
    Xj = Xc + n * Cos((Pi/2.00)-beta)
    Yj = Yc + n * Sin((Pi/2.00)-beta)
}

theta2 = arctan2((Xj-Xm2), (Yj-Ym2))

return theta2
