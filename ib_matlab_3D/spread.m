function f=spread(F,X)
global h N Nb;

c=1/(h*h*h);
f=zeros(N,N,N,3);

for k=1:Nb
  s=X(k,:,:)/h;
  i=floor(s);
  r=s-i;
  i1=mod((i(1)-1):(i(1)+2),N)+1;
  i2=mod((i(2)-1):(i(2)+2),N)+1;
  i3=mod((i(3)-1):(i(3)+2),N)+1;

  w=phi1(r(1)).*phi2(r(2)).*phi3(r(3));
  f(i1,i2,i3,1)=f(i1,i2,i3,1)+(c*F(k,1))*w;
  f(i1,i2,i3,2)=f(i1,i2,i3,2)+(c*F(k,2))*w;
  f(i1,i2,i3,3)=f(i1,i2,i3,3)+(c*F(k,3))*w;

end

