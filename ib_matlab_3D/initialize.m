%initialize.m

L=1.0
N=32
h=L/N
ip=[(2:N),1]
im=[N,(1:(N-1))]


K=0.1
rho=1
mu=0.01
tmax=4
dt=0.01
clockmax=ceil(tmax/dt)


[X v]=trisph(1/3,1/2,4);
tri=triangulation(v,X);

numtri=size(tri,1);

Nb=size(X,1);%this is the right number of boundary points

%reference area for each triangle
triarea=zeros(numtri,1);
for i=1:numtri
    triarea(i,1)=tarea(X(v(i,1),:),X(v(i,2),:),X(v(i,3),:));
end

ed=edges(tri);
numed=size(ed,1);
elength=0;
for ei=1:numed
    A=X(ed(ei,1),:);
    B=X(ed(ei,2),:);
    el=(sum((A-B).^2));
    elength=elength+el;
end
u=zeros(N,N,N,3);
% initial perturbation
au1=[0 0 1];
ku1=[0 1 0];
au2=[1 0 0];
ku2=[0 0 1];


for j1=0:(N-1)
    for j2=0:(N-1)
        for j3=0:(N-1)
  xu=[j1 j2 j3]*h;
  u(j1+1,j2+1,j3+1,:)=au1*sin(2*pi/L*xu(2))+au2*sin(2*pi/L*xu(3));
        end
    end
end

vorticity=(u(:,ip,:,3)-u(:,im,:,3)-u(:,ip,:,2)+u(:,im,:,2)...
    -(u(ip,:,:,3)-u(im,:,:,3)-u(:,:,ip,1)+u(:,:,im,1))...
    +(u(ip,:,:,2)-u(im,:,:,2)-u(:,ip,:,1)+u(:,im,:,1)))/(2*h);



xgrid=zeros(N,N,N);
ygrid=zeros(N,N,N);
zgrid=zeros(N,N,N);
for j=0:(N-1)
  xgrid(j+1,:,:)=j*h;
  ygrid(:,j+1,:)=j*h;
  zgrid(:,:,j+1)=j*h;
end

trisurf(tri);
axis equal
axis([0,L,0,L,0,L])
drawnow

