function x=rsphere(n)     % find n random points on the unit sphere
x=zeros(n,3);
x(:,3)=2*(rand(n,1)-0.5);
alpha=sqrt(1-x(:,3).^2);
theta=2*pi*rand(n,1);
x(:,1)=alpha.*cos(theta);
x(:,2)=alpha.*sin(theta);
plot3(x(:,1),x(:,2),x(:,3),'.')

