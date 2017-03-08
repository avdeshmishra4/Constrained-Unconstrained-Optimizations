% A computer program to generate the contour plot of the objective function
% and all constraints
x1=linspace(0,10,40);
x2=linspace(0,10,40);
[x1,x2]=meshgrid(x1,x2); % generates the mesh grid
f = (x1-3).^2+(x2-2).^2; % objective function which needs to be minimized
v = [20; 40; 60; 80; 100];
[c, h] = contour(x1, x2, f, v); % contour(...) plots the contour of the 
                                % provided function at provided values
grid on
xlabel('x_{1} values')
ylabel('x_{2} values')
title('Contour plot of constraints and the function f(x_{1}, x_{2}) = (x_{1}-3)^2+(x_{2}-2)^2')
clabel(c,h); % labels the contour
hold on

a = [8 8];
h1 = 2*x1+x2; % constraint h1
[p, q] = contour(x1, x2, h1, a); % 'a' is a vector which tells the function to plot the contour at provided values
clabel(p,q)
text(3.15, 1.7, 'h_{1}') % writes the provided text on the specified location

b = [4 4];
h2 = (x1-1).^2+(x2-4).^2; % constraint h2
[r, s] = contour(x1, x2, h2, b);
clabel(r,s)
text(2.5, 5.35, 'h_{2}')

c = [7 7];
g1 = x1+x2; % constraint g1
[t, u] = contour(x1, x2, g1, c);
clabel(t,u)
text(5.5, 1.55, 'g_{1}')

d = [0 0];
g2 = x1-0.25.*x2.^2; % constraint g2
[v, w] = contour(x1, x2, g2, d);
clabel(v,w)
text(9.2, 6.25, 'g_{2}')
