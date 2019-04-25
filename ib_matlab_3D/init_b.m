%init_b.m
%This script initializes the array  b 
%that is used in the fluid solver to extract pressure output
global b

b=zeros(N,N,N,3);

for m1=0:(N-1)
  for m2=0:(N-1)
    for m3=0:(N-1)
        if~(((m1==0)||(m1==N/2))&&((m2==0)||(m2==N/2))&&((m3==0)||(m3==N/2)))
          t=2*pi/N*[m1;m2;m3];
          s=sin(t);
          c = - (1i*rho*h/dt)/(s(1)^2+s(2)^2+s(3)^2);
          b(m1+1,m2+1,m3+1,1) = c*s(1);
          b(m1+1,m2+1,m3+1,2) = c*s(2);
          b(m1+1,m2+1,m3+1,3) = c*s(3);
        end
    end
  end
end