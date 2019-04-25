function F=Forcespr(X)
%this force calculation uses the sum of the square of every edge's length as the energy function.
global  Nb K ed;
F=zeros(Nb,3);
numed=size(ed,1);
for ei=1:numed
    A=X(ed(ei,1),:);
    B=X(ed(ei,2),:);
    F(ed(ei,1),:)=F(ed(ei,1),:)-K*(B-A);
    F(ed(ei,2),:)=F(ed(ei,2),:)-K*(A-B);
end
F=-F;
