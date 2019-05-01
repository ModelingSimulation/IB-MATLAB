function F=Force(X)
global kp km dtheta K;
% elastic stretching force
F=K*(X(kp,:)+X(km,:)-2*X)/(dtheta*dtheta);