function U=vec_interp(u,X)
% interpolate fluid velocity to the body
global Nb h;
global N;
U=zeros(Nb,3);
s=X/h; % Get body position relative to grid
i=floor(s);
r=s-i;
w=vec_phi1(r(:,1)).*vec_phi2(r(:,2)).*vec_phi3(r(:,3)); %Evaluate delta function
w = permute(w, [1,3,4,2]); %Reogranize
for k = 1:Nb
  i1=mod((i(k,1)-1):(i(k,1)+2),N)+1; % Find adjacent fluid cells
  i2=mod((i(k,2)-1):(i(k,2)+2),N)+1;
  i3=mod((i(k,3)-1):(i(k,3)+2),N)+1;
  
  ww = w(:,:,:,k);
  UU = [sum(sum(sum(ww.*u(i1,i2,i3,1)))), sum(sum(sum(ww.*u(i1,i2,i3,2)))),...
      sum(sum(sum(ww.*u(i1,i2,i3,3))))]; %Interpolate
 
  U(k,:,:)= UU(1,:);
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

