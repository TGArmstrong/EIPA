% Tyler Armstrong
% 101009324

nx = 50;
ny = 50;

n = 0;
nxp = 0;
nxm = 0;
nyp = 0;
nym = 0;
G = spalloc(nx*ny,nx*ny,5000);
%G = sparse(nx,ny);
%g = zeros(1,nx*ny);
for i = 1:nx
   for j = 1:ny
      n = j+(i-1)*ny;
      
      nxp = j + i*ny;
      nxm = j + (i-2)*ny;
      nyp = (j+1) + (i-1)*ny;
      nym = (j-1) + (i-1)*ny;
      
      if (i == 1 || i == nx || j == 1 || j ==ny)
         G(n,n) = 1;
         %g(n) = 1;
      else
         G(n,n) = -4;
         G(n,nxp) = 1;
         G(n,nxm) = 1;
         G(n,nyp) = 1;
         G(n,nym) = 1;
         
         %g(n) = -4;
         %g(nxm) = 1;
         %g(nym) = 1;
         %g(nxp) = 1;
         %g(nyp) = 1;
      end
       
   end
end

%spy(G);
[E, D] = eigs(G, 9, 'SM');
Eplot = zeros(nx,ny);
figure(1);
for k = 1:9
    for i = 1:nx
        for j = 1:ny
            n = j + (i-1)*ny;
            Eplot(i,j) = E(n,k);
        end
    end
    subplot(3,3,k);
    surf(Eplot);
end

