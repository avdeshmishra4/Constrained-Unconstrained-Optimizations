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

% =========== Davidon-Fletcher-Powell Method ========= %%%%
clear;
clc;
x = [3 2]';
B = [1 0.55; 0.55 1];
iter = 0;
f=@(x1, x2) 100*(x2-x1.^2).^2+(1-x1).^2; % objective function
f2 = @(x) f(x(1), x(2));

precision = 0.0001;
gnorm = inf;

g1 = grad(x);

while(gnorm >= precision)
    d = -1*B*g1;
    s = d/norm(d)
    f3 = @(L) 100*((x(2)+L*s(2))- (x(1)+L*s(1)).^2).^2+(1-(x(1)+L*s(1))).^2;
    % use fminsearch(f, starting_guess) to compute alpha
    alpha = fminsearch(f3, 0);
    
    x = x+(alpha*s)
    plot(x(1), x(2), '*');
    f_val = f2(x);
    disp(['value of boj fxn = ' num2str(f_val, '%.6f')]);
    g2 = grad(x);
    
    g = g2 - g1
    gnorm = norm(g); % stopping condition is computed here
    g1 = g2;
    
    m1 = (s*s')
    
    m2 = (s'*g)
    B= B+alpha*m1*1/m2;
    m3 = B*g;
    m4 = B'*g;
    m5 = g'*B*g;
    B = B-m3*m4'/m5;
    
    iter = iter+1;
    
end
    