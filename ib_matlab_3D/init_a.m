%init_a.m
%This script initializes the array  a  
%that is used in the fluid solver

global a;
a=zeros(N,N,N,3,3);
for m1=0:(N-1)
  for m2=0:(N-1)
      for m3=0:(N-1)
    a(m1+1,m2+1,m3+1,1,1)=1;
    a(m1+1,m2+1,m3+1,2,2)=1;
    a(m1+1,m2+1,m3+1,3,3)=1;
      end
  end
end

for m1=0:(N-1)
  for m2=0:(N-1)
    for m3=0:(N-1)
        if~(((m1==0)|(m1==N/2))&((m2==0)|(m2==N/2))&((m3==0)|(m3==N/2)))
          t=(2*pi/N)*[m1;m2;m3];
          s=sin(t);
          ss=(s*s')/(s'*s);
    %     a(m1+1,m2+1,:,:)=a(m1+1,m2+1,:,:)-(s*s')/(s'*s);
          a(m1+1,m2+1,m3+1,1,1)=a(m1+1,m2+1,m3+1,1,1)-ss(1,1);
          a(m1+1,m2+1,m3+1,1,2)=a(m1+1,m2+1,m3+1,1,2)-ss(1,2);
          a(m1+1,m2+1,m3+1,1,3)=a(m1+1,m2+1,m3+1,1,3)-ss(1,3); 
          
          a(m1+1,m2+1,m3+1,2,1)=a(m1+1,m2+1,m3+1,2,1)-ss(2,1);
          a(m1+1,m2+1,m3+1,2,2)=a(m1+1,m2+1,m3+1,2,2)-ss(2,2);
          a(m1+1,m2+1,m3+1,2,3)=a(m1+1,m2+1,m3+1,2,3)-ss(2,3); 
          
          a(m1+1,m2+1,m3+1,3,1)=a(m1+1,m2+1,m3+1,3,1)-ss(3,1);
          a(m1+1,m2+1,m3+1,3,2)=a(m1+1,m2+1,m3+1,3,2)-ss(3,2);
          a(m1+1,m2+1,m3+1,3,3)=a(m1+1,m2+1,m3+1,3,3)-ss(3,3); 
    
        end
    end
  end
end

for m1=0:(N-1)
  for m2=0:(N-1)
      for m3=0:(N-1)
    t=(pi/N)*[m1;m2;m3];
    s=sin(t);
    a(m1+1,m2+1,m3+1,:,:)=a(m1+1,m2+1,m3+1,:,:)...
                    /(1+(dt/2)*(mu/rho)*(4/(h*h))*(s'*s));
  
      end
  end
end

