function w=laplacian(u)
global im ip h;
% Second order centered Laplacian
w=(u(ip,:,:)+u(im,:,:)+u(:,ip,:)+u(:,im,:)-4*u)/(h*h);

% im = [N,1:(N-1)] = circular version of i-1
% ip = [2:N,1]     = circular version of i+1
% N  = number of points in each space direction

