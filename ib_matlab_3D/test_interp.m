global N Nb h kp km dp dm dtheta K
initialize
%test_interp.m
a=[1 0 0];
b=[0 1 0];
c=[0 0 1];
d=[1 1 0];

utest=zeros(N,N,N,3);
for p = 1:N
    x=p/N;
    for q = 1:N
        y=q/N;
        for n = 1:N
            z=n/N;
            
            utest(p+1,q+1,n+1,:)=a*x+b*y+c*z+d;
        end
    end
end
Utest=interp(utest,X);
Ureal=zeros(Nb,3);
for r=1:Nb
    xr=X(r,1);
    yr=X(r,2);
    zr=X(r,3);
    Ureal(r,:)=a*xr+b*yr+c*zr+d;
end
difference=Ureal./Utest;