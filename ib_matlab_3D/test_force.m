%test_force.m
global v Nb X K

initialize

tri=triangulation(v,X);


result=zeros(5,5);
%the original area
earea=0;

for vnum = 1:size(v,1)
    earea=earea+tarea(X(v(vnum,1),:),X(v(vnum,2),:),X(v(vnum,3),:));
end

F=Force(X);
hm=zeros(Nb,3);
for jj=1:Nb
    hm(jj,:)=[rand rand rand];
    hm(jj,:)=hm(jj,:)/norm(hm(jj,:));
end

XX=X;
for expn=1:16
    tor=0;
    harea=0;
    epsn=10^(-expn);
    result(expn,1)=epsn;
    result(expn,2)=earea;
    
    X=XX+hm.*epsn;

    for vnum = 1:size(v)
        harea=harea+tarea(X(v(vnum,1),:),X(v(vnum,2),:),X(v(vnum,3),:));
    end
    for ii =1:Nb
        
        tor=tor-dot(F(ii,:)/K,hm(ii,:)*epsn);
    end
    result(expn,3)=tor;
    result(expn,4)=harea;
    result(expn,5)=harea-(tor+earea);
end