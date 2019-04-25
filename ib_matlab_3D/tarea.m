function [s] = tarea(X,Y,Z)
%calculate the area of a triangle, given three vertices:X Y Z
x1=(Y-X);
x2=(Z-X);
s=1/2*norm(cross(x1,x2));
end

