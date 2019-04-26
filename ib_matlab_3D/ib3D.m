% ib3D.m
% This script is the main program.
%Coauthored by Guanhua Sun & Tristan Goodwill,2019.4
%Original Code:
%https://www.math.nyu.edu/faculty/peskin/ib_lecture_notes/index.html

global dt Nb N h rho mu ip im a b tri v K triarea ed;

initialize
init_a
init_b

for clock=1:clockmax
    t=clock*dt
    XX=X+(dt/2)*vec_interp(u,X);
    ff=vec_spread(Forcespr(XX),XX);
    [u,uu,ppp]=fluid(u,ff);
    X=X+dt*vec_interp(uu,XX);
    
    tri=triangulation(v,X);
    trisurf(tri);
  
    hold on 
    quiver3(xgrid,ygrid,zgrid,ff(:,:,:,1),ff(:,:,:,2),ff(:,:,:,3),3);
    %3plot the body force on the fluid
    hold off

     
    axis equal
    axis ([0,L,0,L,0,L])
    title(["t=",t])

    drawnow
    hold off

end

