% Tyler Armstrong
% 101009324

nx = 50;
ny = 50;

n = 0;
nxp = 0;
nxm = 0;
nyp = 0;
nym = 0;
G = spalloc(nx,ny,200);
%G = sparse(nx,ny);
Evec = zeros(1,nx*ny);
for i = 1:nx
   for j = 1:ny
      n = j+(i-1)*ny;
      nxp = j + i*ny;
      nxm = j + (i-2)*ny;
      nyp = (j+1) + (i-1)*ny;
      nym = (j-1) + (i-1)*ny;
      if (i == j & (i == 1 | i == nx ))
         G(i,j) = 1; 
      elseif (i == 1 | i == nx | j == 1 | j == ny)
         G(i,j) = 0; 
      elseif (i == j)
         G(i,j) = -4;
         G(i-1,j) = -1;
         G(i+1,j) = -1;
         G(i,j-1) = -1;
         G(i,j+1) = -1;
      end
       
      Evec(n) = G(i,j);
   end
end

