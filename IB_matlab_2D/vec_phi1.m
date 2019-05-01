function w=vec_phi1(r)
% 4 point delta function in y, vectorizing makes this 10x faster for Nb =
% 100
w=zeros(4,size(r,1),4);
q=sqrt(1+4*r.*(1-r));
w(4,:,:)=repmat((1+2*r-q)/8,[1,1,4]);
w(3,:,:)=repmat((1+2*r+q)/8,[1,1,4]);
w(2,:,:)=repmat((3-2*r+q)/8,[1,1,4]);
w(1,:,:)=repmat((3-2*r-q)/8,[1,1,4]);
end

%% The following are alternatives that are twice as slow
% function w=vec_phi1(r)
% % 4 point delta function in y
% w=zeros(4,4,size(r,1));
% q=sqrt(1+4*r.*(1-r));
% for i = 1:4
% w(4,i,:)=(1+2*r-q)/8;
% w(3,i,:)=(1+2*r+q)/8;
% w(2,i,:)=(3-2*r+q)/8;
% w(1,i,:)=(3-2*r-q)/8;
% end
% 
% function w=vec_phi1(r)
% % 4 point delta function in y
% w=zeros(4,size(r,1),4);
% q=sqrt(1+4*r.*(1-r));
% for i = 1:4
% w(4,:,i)=(1+2*r-q)/8;
% w(3,:,i)=(1+2*r+q)/8;
% w(2,:,i)=(3-2*r+q)/8;
% w(1,:,i)=(3-2*r-q)/8;
% end