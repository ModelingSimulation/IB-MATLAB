%put point for i = 1:numtri
%global v tri X h Nb
ed=edges(tri);
for ei = 1:size(ed,1)
   edi=X(ed(ei,:),:);
   Aind=ed(ei,1);
   Bind=ed(ei,2);
   AA=edi(1,:);
   BB=edi(2,:);
   dis=sqrt(sum((AA-BB).^2));
   
   if dis > h/2
       Nb=Nb+1;
       numtri=numtri+2;
       CC=(AA+BB)/2;
       X(Nb,:)=CC;
       dtri=cell2mat(edgeAttachments(tri,ed(ei,:)));
       %drip=zeros(4,3);
       vtri1=tri(dtri(1),:);
       vtri2=tri(dtri(2),:);
       Cind1=sum(vtri1)-sum(ed(ei,:));
       Cind2=sum(vtri2)-sum(ed(ei,:));
       v(dtri(1),:)=[Aind Nb Cind1];
       v(dtri(2),:)=[Aind Cind2 Nb];
       v(numtri-1,:)=[Bind Nb Cind2];
       v(numtri,:)=[Bind Cind1 Nb];
       tri=triangulation(v,X);
   end
end

trisurf(tri);
axis equal