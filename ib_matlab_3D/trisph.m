%sphere.m   main program

function [x v]=trisph(rad,ctr,numr)

nref=numr;
nvmax=12*4^nref;
ntmax=20*4^nref;
x=zeros(nvmax,3);
v=zeros(ntmax,3);
dodec
for nr=1:nref
  refine
end
x=x*rad+ctr;
x=x(1:nv,:);

%axis equal
