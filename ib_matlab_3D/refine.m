%refine.m   script to refine triangulation of the sphere
vnew=zeros(1,3);
next3=[2,3,1];
a=zeros(nv,nv);
for t=1:nt
  for j=1:3
    v1=v(t,next3(j));
    v2=v(t,next3(next3(j)));
    if(a(v1,v2)==0)
      nv=nv+1;
      vnew(j)=nv;
      x(nv,:)=locate(v1,v2,x);
      a(v1,v2)=nv;
      a(v2,v1)=nv;
    else
      vnew(j)=a(v1,v2);
    end
  end
  v(1*nt+t,:)=[v(t,1),vnew(3),vnew(2)];
  v(2*nt+t,:)=[v(t,2),vnew(1),vnew(3)];
  v(3*nt+t,:)=[v(t,3),vnew(2),vnew(1)];
  v(t,:)=vnew;
end
nt=nt*4;