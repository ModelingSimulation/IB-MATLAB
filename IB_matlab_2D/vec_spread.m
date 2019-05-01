function f=vec_spread(F,X)
% spread F to grid
global h N dtheta Nb;

c=dtheta/(h*h);
f=zeros(N,N,2);

s=X/h; % Get body position relative to grid
i=floor(s);
r=s-i;
w=vec_phi1(r(:,1)).*vec_phi2(r(:,2));%Evaluate delta function
w = permute(w, [1,3,2]); %Reogranize, this is quite fast


for k=1:Nb
  i1=mod((i(k,1)-1):(i(k,1)+2),N)+1; %Find affected cells
  i2=mod((i(k,2)-1):(i(k,2)+2),N)+1;
  
  %Spread force to fluid, this is the costly part (75% of the time for
  %N=100)
  ww = w(:,:,k);
  f(i1,i2,1)=f(i1,i2,1)+(c*F(k,1))*ww; 
  f(i1,i2,2)=f(i1,i2,2)+(c*F(k,2))*ww;
end

