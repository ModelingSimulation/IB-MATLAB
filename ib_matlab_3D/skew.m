function w=skew(u)
w=u; %note that this is done only to make w the same size as u
w(:,:,:,1)=sk(u,u(:,:,:,1));
w(:,:,:,2)=sk(u,u(:,:,:,2));
w(:,:,:,3)=sk(u,u(:,:,:,3));
