% ==========  Contour plot of the objective function ======= %%%%%%%

clear;
clc;
x1 = linspace(-2, 5, 40);
x2 =  linspace(-2, 5, 40);

[x1, x2] = meshgrid(x1, x2);
f = 100*(x2-x1.^2).^2+(1-x1).^2;
v = [20; 40; 60; 80; 100];
[c, h] = contour(x1, x2, f, v);

grid on
xlabel('x_{1} values')
ylabel('x_{2} values')
title('Contour plot of constraints and the objective function')
clabel(c,h); % labels the contour
hold on

%%% ======= Conjugate Gradient Method ================== %%%
clear;
clc;
x = [3, 2]';
f=@(x1, x2) 100*(x2-x1.^2).^2+(1-x1).^2; % objective function
f2 = @(x) f(x(1), x(2));
k = 0;
precision = 0.0001;
gnorm = inf;

g = grad(x);
d = -g;

while gnorm >= precision
    f3 = @(L) 100*((x(2)+L*d(2))- (x(1)+L*d(1)).^2).^2+(1-(x(1)+L*d(1))).^2;
    % Generate the alpha value using fminsearch
    alpha = fminsearch(f3, 0);
    
    x = x+(alpha*d)
    plot(x(1), x(2), '*');
    f_val = f2(x);
    
    disp(['value of boj fxn = ' num2str(f_val, '%.6f')]);
    
    g1 = grad(x);
    gnorm = abs(g1);
    
    beta = (g1'*g1)./(g'*g);
    d1 = -g1+beta*d;
    
    d = d1;
    g = g1;
    k = k+1;
end

xopt = x
f_opt = f2(xopt);
disp(['value of boj fxn at minima= ' num2str(f_opt, '%.6f')]);
    
    
    
    
    
    