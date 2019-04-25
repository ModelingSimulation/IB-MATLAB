numtri=size(tri,1);
numdis=zeros(numtri,3);
for i = 1:numtri
    trii=tri(i,:);
    numdis(i,1)=(sum((X(trii(1),:)-X(trii(2),:)).^2))^(1/2);
    numdis(i,2)=(sum((X(trii(1),:)-X(trii(3),:)).^2))^(1/2);
    numdis(i,3)=(sum((X(trii(2),:)-X(trii(3),:)).^2))^(1/2);
end
