function vsph=vpoly(X)
global v
vsph=0;
numtri=size(v,1);
%vnorm=[0 0 1];
for ti =1:numtri
    A=X(v(ti,1),:);
    B=X(v(ti,2),:);
    C=X(v(ti,3),:);
    vol=1/6*dot(cross(A,B),C);
    %if dot(cross((B-A),(C-B)),vnorm)>0
        vsph=vsph+vol;
    %else
    %    vsph=vsph-vol;
    %end
end

