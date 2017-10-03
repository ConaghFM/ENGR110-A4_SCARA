x0 = 85; x1 = 162; x2 = 162.1; x3 = 85.1;
y0 = 85; y1 = 85.1; y2 = 162; y3 = 162.1;

N = 50; % number of points line is made from
dxa = (x1-x0)/N; % x increment
dxb = (x2-x1)/N;
dxc = (x3-x2)/N;
dxd = (x0-x3)/N;
dya = (y1-y0)/N; % y increment
dyb = (y2-y1)/N;
dyc = (y3-y2)/N;
dyd = (y0-y3)/N;

xa = x0:dxa:x1;
xb = x1:dxb:x2;
xc = x2:dxc:x3;
xd = x3:dxd:x0;
ya = y0:dya:y1;
yb = y1:dyb:y2;
yc = y2:dyc:y3;
yd = y3:dyd:y0;
x = cat(2,xa,xb,xc,xd);
y = cat(2,ya,yb,yc,yd);

[theta1, theta2] = xyToLinkageAngles(x,y);
[v1,v2] = a2pwm(theta1,theta2);
pen = 1500*ones(size(v1));

%transpose into output file
out(:,1) = v1';
out(:,2) = v2';
out(:,3) = pen';

dlmwrite('square', out);