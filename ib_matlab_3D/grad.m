%grad2
function [grad] =grad(A,B,C)
base=sqrt(sum((B-C).^2));
n=cross(B-A,C-A);
un=n/norm(n);
dir=cross(B-C,un);
dir=dir/norm(dir);
grad=dir*base/2;
end