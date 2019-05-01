%initialize.m
%% Initialize Parameters and special indices

L=1.0 % Box size
N=64 % Number of grid cells
h=L/N % Grid spacing
ip=[(2:N),1] % Grid index shifted left
im=[N,(1:(N-1))] % Grid index shifted right
Nb=ceil(pi*(L/2)/(h/2)) % Number of IB points
dtheta=2*pi/Nb % IB point spacing
kp=[(2:Nb),1] % IB index shifted left
km=[Nb,(1:(Nb-1))] % IB index shifted right
K=1 % Elastic stiffness
rho=1 % Fluid density
mu=0.01 % viscosity
tmax=1 % Run until time
dt=0.01 % Time step
clockmax=ceil(tmax/dt)

%% Initialize boundary and velocity
k=0:(Nb-1);
theta = k'*dtheta;
X = (L/2) + (L/4)*[cos(theta), sin(theta)];

u=zeros(N,N,2);
j1=0:(N-1); % Initialize fluid velocity as (0,sin(2*pi*x/L))
x=j1'*h;
u(j1+1,:,2)=sin(2*pi*x/L)*ones(1,N);

%% Initialize animation
vorticity=(u(ip,:,2)-u(im,:,2)-u(:,ip,1)+u(:,im,1))/(2*h);
dvorticity=(max(max(vorticity))-min(min(vorticity)))/5;
values= (-10*dvorticity):dvorticity:(10*dvorticity); % Get vorticity contours
valminmax=[min(values),max(values)];
xgrid=zeros(N,N);
ygrid=zeros(N,N);
for j=0:(N-1)
  xgrid(j+1,:)=j*h;
  ygrid(:,j+1)=j*h;
end

set(gcf,'double','on')
contour(xgrid,ygrid,vorticity,values)
hold on
plot(X(:,1),X(:,2),'ko')
axis([0,L,0,L])
caxis(valminmax)
axis equal
axis manual
drawnow
hold off

