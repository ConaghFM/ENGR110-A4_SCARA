x0 = 50; y0 = 50.1; x1 = 50.1; y1 = 122; x2 = 122; y2 = 122.1; x3 = 122.1; y3 = 50;

dplus = (y1-y0)/10;
dminus = (y0-y1)/10;

dsmall = (x1-x0)/10;

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