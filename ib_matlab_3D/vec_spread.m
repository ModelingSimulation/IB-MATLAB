function f=vec_spread(F,X)
% spread F to grid
global h N  Nb;

c=1/(h*h*h);
f=zeros(N,N,N,3);

s=X/h; % Get body position relative to grid
i=floor(s);
r=s-i;
w=vec_phi1(r(:,1)).*vec_phi2(r(:,2)).*vec_phi3(r(:,3));%Evaluate delta function
w = permute(w, [1,3,4,2]);


for k=1:Nb
  i1=mod((i(k,1)-1):(i(k,1)+2),N)+1; %Find affected cells
  i2=mod((i(k,2)-1):(i(k,2)+2),N)+1;
  i3=mod((i(k,3)-1):(i(k,3)+2),N)+1;
  ww = w(:,:,:,k);
  f(i1,i2,i3,1)=f(i1,i2,i3,1)+(c*F(k,1))*ww; %Spread force to fluid
  f(i1,i2,i3,2)=f(i1,i2,i3,2)+(c*F(k,2))*ww;
  f(i1,i2,i3,3)=f(i1,i2,i3,3)+(c*F(k,3))*ww;
end

