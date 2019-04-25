function xout=locate(v1,v2,x)
%locate the perpendicular bisector of the great circle joining
%the points whose indices are stored in rows v1 and v2 of x
xout=(x(v1,:)+x(v2,:))/2;
r=sqrt(xout(1)^2+xout(2)^2+xout(3)^2);
xout=xout/r;

