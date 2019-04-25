function F=Forcesurf(X)
global  Nb v K;
F=zeros(Nb,3);
numtri=size(v,1);
for ti=1:numtri
    A=X(v(ti,1),:);
    B=X(v(ti,2),:);
    C=X(v(ti,3),:);
    F(v(ti,1),:)=F(v(ti,1),:)+grad(A,B,C);
    F(v(ti,2),:)=F(v(ti,2),:)+grad(B,A,C);
    F(v(ti,3),:)=F(v(ti,3),:)+grad(C,A,B);
end
F=-F*K;