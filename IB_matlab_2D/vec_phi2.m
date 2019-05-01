function w=vec_phi2(r)
% 4 point delta function in x, vectorizing makes this 15x faster for
% Nb=100
w=zeros(4,size(r,1),4);
q=sqrt(1+4*r.*(1-r));
w(:,:,4)=repmat((1+2*r-q)'/8,[4,1]);
w(:,:,3)=repmat((1+2*r+q)'/8,[4,1]);
w(:,:,2)=repmat((3-2*r+q)'/8,[4,1]);
w(:,:,1)=repmat((3-2*r-q)'/8,[4,1]);
end
%% The following is 50% slower
% function w=vec_phi2(r)
% % 4 point delta function in x
% w=zeros(4,size(r,1),4);
% q=sqrt(1+4*r.*(1-r));
% for i =1:4
% w(i,:,4)=(1+2*r-q)'/8;
% w(i,:,3)=(1+2*r+q)'/8;
% w(i,:,2)=(3-2*r+q)'/8;
% w(i,:,1)=(3-2*r-q)'/8;
% end
% end