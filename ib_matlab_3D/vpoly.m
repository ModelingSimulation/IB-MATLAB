function vsph=vpoly(X)
%this function calculates the volume of a triangulted polyhedron whose points on every triangle is counterclockwise oriented.
global v
vsph=0;
numtri=size(v,1);
%vnorm=[0 0 1];
for ti =1:numtri
    A=X(v(ti,1),:);
    B=X(v(ti,2),:);
    C=X(v(ti,3),:);
    vol=1/6*dot(cross(A,B),C);
    vsph=vsph+vol;
end

