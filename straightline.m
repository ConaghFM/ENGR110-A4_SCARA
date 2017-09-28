x0 = 100; y0 = 100; x1 = 200; y1 = 100.1;
N = 50; % number of points line is made from
dx = (x1-x0)/N; % x increment
dy = (y1-y0)/N; % y increment
x = x0:dx:x1;
y = y0:dy:y1;

[theta1, theta2] = xyToLinkageAngles(x,y);
[v1,v2] = a2pwm(theta1,theta2);
pen = 1500*ones(size(v1));

%transpose into output file
out(:,1) = v1';
out(:,2) = v2';
out(:,3) = pen';

dlmwrite('straightline', out);





%angles = zeros(N,2);
%pwm = zeros(N,2);

% pen down


% Add desired command for each point to commands
%for i=1:1:N
    %str = ['x:',x(i),' y:',y(i)];
%    [theta1, theta2] = xyToLinkageAngles(x(i),y(i));
%    angles(i,1) = theta1
%    angles(i,2) = theta2
%    pwm(i) = a2pwm(angles(i,1), angles(i,2));
%end

