function U=vec_interp(u,X)
% interpolate fluid velocity to the body
global Nb h;
global N;
U=zeros(Nb,2);
s=X/h; % Get body position relative to grid
i=floor(s);
r=s-i;
w=vec_phi1(r(:,1)).*vec_phi2(r(:,2)); %Evaluate delta function
w = permute(w, [1,3,2]); %Reogranize, this is quite fast
for k = 1:Nb
  i1=mod((i(k,1)-1):(i(k,1)+2),N)+1; % Find adjacent fluid cells
  i2=mod((i(k,2)-1):(i(k,2)+2),N)+1;
  
  %Interpolate fluid velocity, this is the costly part (65% of the time for
  %N=100)
  ww = w(:,:,k);
  UU = [sum(sum(ww.*u(i1,i2,1))), sum(sum(ww.*u(i1,i2,2)))]; %Interpolate
  U(k,:)= UU;
end
% for k=1:Nb
%   s=X(k,:)/h;
%   i=floor(s);
%   r=s-i;
%   i1=mod((i(1)-1):(i(1)+2),N)+1;
%   i2=mod((i(2)-1):(i(2)+2),N)+1;
%   w=phi1(r(1)).*phi2(r(2));
%   UU = [sum(sum(w.*u(i1,i2,1))), sum(sum(w.*u(i1,i2,2)))];
%   U(k,:)= UU;
% end

