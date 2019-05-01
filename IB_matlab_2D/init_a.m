%init_a.m
%This script initializes the array  a  
%that is used in the fluid solver

global a;
a=zeros(N,N,2,2);
for m1=0:(N-1)
  for m2=0:(N-1)
    a(m1+1,m2+1,1,1)=1;
    a(m1+1,m2+1,2,2)=1;
  end
end

for m1=0:(N-1)
  for m2=0:(N-1)
    if~(((m1==0)|(m1==N/2))&((m2==0)|(m2==N/2)))
      t=(2*pi/N)*[m1;m2];
      s=sin(t);
      ss=(s*s')/(s'*s);
%     a(m1+1,m2+1,:,:)=a(m1+1,m2+1,:,:)-(s*s')/(s'*s);
      a(m1+1,m2+1,1,1)=a(m1+1,m2+1,1,1)-ss(1,1);
      a(m1+1,m2+1,1,2)=a(m1+1,m2+1,1,2)-ss(1,2);
      a(m1+1,m2+1,2,1)=a(m1+1,m2+1,2,1)-ss(2,1);
      a(m1+1,m2+1,2,2)=a(m1+1,m2+1,2,2)-ss(2,2);
    end
  end
end

for m1=0:(N-1)
  for m2=0:(N-1)
    t=(pi/N)*[m1;m2];
    s=sin(t);
    a(m1+1,m2+1,:,:)=a(m1+1,m2+1,:,:)...
                    /(1+(dt/2)*(mu/rho)*(4/(h*h))*(s'*s));
  end
end

