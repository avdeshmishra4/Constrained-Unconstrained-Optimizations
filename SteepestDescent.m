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


% ============== Steepest Descent Method ================ %%%
clear;
clc;
x = [3 2]';
f=@(x1, x2) 100*(x2-x1.^2).^2+(1-x1).^2; % objective function

precision = 0.0001;
f2 = @(x) f(x(1), x(2));
niter = 0;
gnorm = inf;

while gnorm >= precision
    % calculatre gradient
    g = grad(x)
    gnorm = norm(g);
    f3 = @(L) 100*((x(2)-L*g(2))- (x(1)-L*g(1)).^2).^2+(1-(x(1)-L*g(1))).^2;
    % use the golden section search to obtain the minimum to obtain the
    % minimum alpha value between 0 and 0.5
    gs_value = SteepestGoldenSection(f3, 0, 0.5);
    % [alpha_val, fval] = fminsearch(f3, 0.01);
    x_new = x-gs_value*g
    plot(x_new(1), x_new(2), '*');
    obj_fxn_val = f2(x_new);
    disp(['value of boj fxn = ' num2str(obj_fxn_val, '%.6f')]);
    % check step
    if ~isfinite(x_new)
        disp(['Number of iterations: ' num2str(niter)])
        error('x is inf or NaN')
    end
    niter = niter+1
    x = x_new;
end

xopt = x
fopt = f2(xopt)
disp(['Value of obj fxn at minima = ' num2str(fopt, '%.6f')]);


    


