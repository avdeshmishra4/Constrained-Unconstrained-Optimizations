%%%%%%%% Computer Assignment 4 -- Constrained and Unconstrained Optimization %%%%%%%%%%%%%
x1 = linspace(0,5,40);
x2 = linspace(0,5,40);
[x1,x2]=meshgrid(x1,x2); % generates the mesh grid
f = x1.^4-(2*x1.^2.*x2)+(x1.^2)+(x1.*x2.^2)-(2*x1)+4; % objective function which needs to be optimized
v = [3; 4; 5; 10; 15; 20; 25; 30; 40; 50; 60; 70; 80; 90; 100];
[c, h] = contour(x1, x2, f, v); % contour(...) plots the contour of the 
                                % provided function at provided values
grid on
xlabel('x_{1} values')
ylabel('x_{2} values')
title('Contour plot of constraints and the objective function')
clabel(c,h); % labels the contour
hold on

a = [2 2];
h = x1.^2+x2.^2; % constraint h1
[p, q] = contour(x1, x2, h, a); % 'a' is a vector which tells the function to plot the contour at provided values
clabel(p,q);
text(0.5, 1.37, 'h'); % writes the provided text on the specified location

b = [1 1];
g = 0.25*x1.^2+0.75*x2.^2; % constraint h2
[r, s] = contour(x1, x2, g, b);
clabel(r,s);
text(0.5, 1.17, 'g');


%% ======== Optimization using fminCon =============%%%
clear;
clc;
fun = @(x) x(1)^4- 2*x(1)^2*x(2)+x(1)^2+x(1)*x(2)^2-2*x(1)+4;
lb = [0, 0];
ub = [5,5];
A = [];
b = [];
Aeq = [];
beq = [];
x0 = [3,2];

options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');
nonlcon = @nonlincons;
[x, fval] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlcon, options)











