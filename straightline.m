x0 = 100; y0 = 100; x1 = 200; y1 = 200;
N = 50; % number of points line is made from
dx = (x1-x0)/N; % x increment
dy = (y1-y0)/N; % y increment
x = x0:dx:x1;
y = y0:dy:y1;

commands = zeros(N,2);

% pen down


% Add desired command for each point to commands
for i=1:1:N
    %str = ['x:',x(i),' y:',y(i)];
    [theta1, theta2] = xyToLinkageAngles(x(i),y(i));
    commands(i,1) = theta1;
    commands(i,2) = theta2;
end

dlmwrite('straightline', commands);
