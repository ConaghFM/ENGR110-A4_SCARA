x0 = 100; y0 = 100.1; x1 = 100.1; y1 = 200; x2 = 200; y2 = 200.1; x3 = 200.1; y3 = 100;

dplus = 10;
dminus = -10;

dsmall = 0.01;

xA = x0:dsmall:x1;
yA = y0:dplus:y1;

xB = x1:dplus:x2;
yB = y1:dsmall:y2;

xC = x2:dsmall:x3;
yC = y2:dminus:y3;

xD = x3:dminus:x0;
yD = y3:dsmall:y0;

x = horzcat(xA(1:10), xB(1:10), xC(1:10), xD(1:10));
y = horzcat(yA(1:10), yB(1:10), yC(1:10), yD(1:10));

plot(x,y);

[theta1, theta2] = xyToLinkageAngles(x,y);
[v1,v2] = a2pwm(theta1,theta2);
pen = 1500*ones(size(v1));

%transpose into output file
out(:,1) = v1';
out(:,2) = v2';
out(:,3) = pen';

dlmwrite('square', out);