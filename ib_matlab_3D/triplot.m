%triplot.m   plots vertices and triangles

figure

hold on
plot3(x(1:nv,1),x(1:nv,2),x(1:nv,3),'ko')

xplot=zeros(4,3);

for t=1:nt
  v1=v(t,1);
  v2=v(t,2);
  v3=v(t,3);
  xplot(1,:)=x(v1,:);
  xplot(2,:)=x(v2,:);
  xplot(3,:)=x(v3,:);
  xplot(4,:)=x(v1,:);
  plot3(xplot(:,1),xplot(:,2),xplot(:,3))
end

view(0,0)

hold off