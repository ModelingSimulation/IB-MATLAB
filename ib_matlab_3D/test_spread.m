%test_spread.m
global h N dtheta Nb kp km dp dm K
%initialize
 L=1;
 N=32;
 h=L/N;
  Nb=2;
 dtheta=2*pi/Nb;


 X=[rand rand rand;rand rand rand];
 F=[rand rand rand;rand rand rand];
%F=Force(X);
f=spread(F,X);
sum(sum(sum(f*(h^3))))
sum(F)
% tor=cross(X,F);
% tor2=zeros(3,1);
% for i = 0:N-1
%     for j = 0:N-1
%         for k = 0:N-1
%             tor2=tor2+X()

