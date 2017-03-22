
l1 = 0.01;
r = 0.5;
num = pi * r / l1;
A = 0.05 * r;

if (0)
% P4:
for i =1:num
 dtheta = pi / num;
 theta = i * dtheta - pi/2;
 z = cos( theta );
 P4 = ( 35 * z^4 - 30 * z*z + 3 ) / 8;
 localR = r + A * P4;
 x = localR * cos( theta );
 y = localR * sin( theta );
 plot(x, y)
 hold on
end
end

% pert=P2 Vs pert=cos( 2 theta )
for i =1:num
 dtheta = pi / num;
 theta = i * dtheta - pi/2;
 localR = r + A * cos( 2.0 * theta );
 x = localR * cos( theta );
 y = localR * sin( theta );
 plot(x, y)
 hold on

 z = cos( theta );
 P2 = ( 3 * z*z - 1 ) / 2;
 localR = r + A * P2;
 x = localR * cos( theta );
 y = localR * sin( theta );
 plot(x, y, 'r')
end
legend('cos(2\theta)','P_2(\theta)')

