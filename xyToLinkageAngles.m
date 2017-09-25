xyToTheta1(Xt, Yt)

//Constants:
int R
int Xm1
int Ym1

//  Direct Kinematics:
Xc = ((Xt-Xm1))

//  Adjacent
int AbC = (sqrt(Xt-Xm1)^2 + (Yt-Ym1)^2)/2.00
singularity check: if (AbC > R)

//  Opposite
int n = sqrt(AbC^2 - R^2)

thetaB = sin^-1(n, R)
thetaA = sin^-1((Yx-Ym1)/(Xc-Ym1))   //assumes px are counted from top of frame
if (invertedFlag) theta = thetaA - thetaB
else theta = thetaA + thetaB

return theta
