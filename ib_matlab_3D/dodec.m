%dodec.m  constructs the vertices of a dodecahedron on the unit sphere
global sr
theta=2*pi/5
z=cos(theta)/(1-cos(theta))
r=sqrt(1-z^2)

x( 1,:)=[0,0, 1];
x(12,:)=[0,0,-1];
for j=1:5
  k=j-.5;
  x(1+j,:)=[r*cos(j*theta),r*sin(j*theta), z];
  x(6+j,:)=[r*cos(k*theta),r*sin(k*theta),-z];
end

nv=12
x(1:nv,:)

v(1,:)=[1,2,3];
v(2,:)=[1,3,4];
v(3,:)=[1,4,5];
v(4,:)=[1,5,6];
v(5,:)=[1,6,2];

v(6,:)=[2,8,3];
v(7,:)=[3,9,4];
v(8,:)=[4,10,5];
v(9,:)=[5,11,6];
v(10,:)=[6,7,2];

v(11,:)=[8,2,7];
v(12,:)=[9,3,8];
v(13,:)=[10,4,9];
v(14,:)=[11,5,10];
v(15,:)=[7,6,11];

v(16,:)=[7,12,8];
v(17,:)=[8,12,9];
v(18,:)=[9,12,10];
v(19,:)=[10,12,11];
v(20,:)=[11,12,7];

nt=20
v(1:nt,:)

clf
%triplot

