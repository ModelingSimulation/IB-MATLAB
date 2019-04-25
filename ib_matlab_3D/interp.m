function U=interp(u,X)
global Nb h;
global N;
U=zeros(Nb,3);
for k=1:Nb
  s=X(k,:,:)/h;
  i=floor(s);
  %i1=floor(s1);
  %i2=floor(s2);
  %i3=floor(s3);
  %r1=s1-i1;
  %r2=s2-i2;
  %r3=s3-i3;
  r=s-i;
  i1=mod((i(1)-1):(i(1)+2),N)+1;
  i2=mod((i(2)-1):(i(2)+2),N)+1;
  i3=mod((i(3)-1):(i(3)+2),N)+1;
  w=phi1(r(1)).*phi2(r(2)).*phi3(r(3));
  U(k,1)=sum(sum(sum(w.*u(i1,i2,i3,1))));
  U(k,2)=sum(sum(sum(w.*u(i1,i2,i3,2))));
  U(k,3)=sum(sum(sum(w.*u(i1,i2,i3,3))));
end

