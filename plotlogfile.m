logfile=dlmread('angles.txt');
time = logfile(:,1);
vm1 = logfile(:,2);
vm2 = logfile(:,3);
vm3 = logfile(:,4);
theta1 = logfile(:,5);
theta2 = logfile(:,6);

plot(time, theta1, time, theta2);