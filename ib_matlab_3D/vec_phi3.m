function w=vec_phi3(r)
% 4 point delta function in x, vectorizing makes this 15x faster for
% Nb=100
w=zeros(4,size(r,1),4,4);
q=sqrt(1+4*r.*(1-r));
w(:,:,:,4)=repmat((1+2*r-q)'/8,[4,1,4]);
w(:,:,:,3)=repmat((1+2*r+q)'/8,[4,1,4]);
w(:,:,:,2)=repmat((3-2*r+q)'/8,[4,1,4]);
w(:,:,:,1)=repmat((3-2*r-q)'/8,[4,1,4]);
end