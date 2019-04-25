function [uuu,uu,ppp]=fluid(u,ff)
%uuu outputs the final velocity, where uu is the output in between. 
%See notes on https://www.math.nyu.edu/faculty/peskin/ib_lecture_notes/index.html 
%ppp outputs the final pressure.
global a dt rho mu b;
w=u-(dt/2)*skew(u)+(dt/(2*rho))*ff;
w=fft(w,[],1);
w=fft(w,[],2);
w=fft(w,[],3);

uu(:,:,:,1)=a(:,:,:,1,1).*w(:,:,:,1)+a(:,:,:,1,2).*w(:,:,:,2)+a(:,:,:,1,3).*w(:,:,:,3);
uu(:,:,:,2)=a(:,:,:,2,1).*w(:,:,:,1)+a(:,:,:,2,2).*w(:,:,:,2)+a(:,:,:,2,3).*w(:,:,:,3);
uu(:,:,:,3)=a(:,:,:,3,1).*w(:,:,:,1)+a(:,:,:,3,2).*w(:,:,:,2)+a(:,:,:,3,3).*w(:,:,:,3);


uu=ifft(uu,[],3);
uu=ifft(uu,[],2);
uu=real(ifft(uu,[],1));
w=u-dt*skew(uu)+(dt/rho)*ff+(dt/2)*(mu/rho)*laplacian(u);
w=fft(w,[],1);
w=fft(w,[],2);
w=fft(w,[],3);


uuu(:,:,:,1)=a(:,:,:,1,1).*w(:,:,:,1)+a(:,:,:,1,2).*w(:,:,:,2)+a(:,:,:,1,3).*w(:,:,:,3);
uuu(:,:,:,2)=a(:,:,:,2,1).*w(:,:,:,1)+a(:,:,:,2,2).*w(:,:,:,2)+a(:,:,:,2,3).*w(:,:,:,3);
uuu(:,:,:,3)=a(:,:,:,3,1).*w(:,:,:,1)+a(:,:,:,3,2).*w(:,:,:,2)+a(:,:,:,3,3).*w(:,:,:,3);

ppp=b(:,:,:,1).*w(:,:,:,1)+b(:,:,:,2).*w(:,:,:,2)+b(:,:,:,3).*w(:,:,:,3);
ppp=ifft(ppp,[],3);
ppp=ifft(ppp,[],2);
ppp=real(ifft(ppp,[],1));
%ppp is the pressure output
uuu=ifft(uuu,[],3);
uuu=ifft(uuu,[],2);
uuu=real(ifft(uuu,[],1));
