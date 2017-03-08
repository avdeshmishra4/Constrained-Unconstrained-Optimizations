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

% =============== Random Walk Method =====================%%%
clear;
clc;
f=@(x1, x2) 100*(x2-x1.^2).^2+(1-x1).^2;
x0=[3, 2];
lamda = 1.0; % sufficiently large intitial step length
min_step_len = 0.0001; % minimum allowable step length
N = 100; % maximum permissable number of iterations
f0 = f(x0(1,1), x0(1, 2)); % value of function at initial guess

itr = 1;
it = 0;
while(true)
    it = it+1;
    mag = 2;
    while(mag > 1) % generate a random vector and accept only one for which magnitude of the random vector is <=1
        
        r = 2.*rand(1, 2)-1; % generate a random number between -1 and 1
        
        mag_elem = zeros(1, 2);
        
        for i = 1:length(r)
            mag_elem(1, i) = r(1, i)*r(1, i); % unit vector u
        end
        mag = sum(mag_elem)^0.5; % magnitude of the vector
    end
    u=(1/mag).*r; % unbiased random vector
    x1 = x0+lamda.*u; % comp[ute a new vector
    f1 = f(x1(1,1), x1(1, 2)); % compute function value at x1
    if(f1 < f0)
        x0 = x1
        f0 = f1
        plot(x0(1, 1), x0(1, 2), '*');
        itr = 1;
    else
        if(itr <= N) % if number of iteration is <= N continue by increasing iteration
            itr = itr+1;
        else
            %itr
            lamda = lamda/2; % reduced step length
            itr = 1;
            if(lamda <= min_step_len) % if new step length is smaller than minimum step length then stop
                xopt = x0;
                fopt = f(x0(1,1), x0(1, 2));
                disp(['Value of function at optimal point = ' num2str(fopt, '%.6f')])
                break;
            end
        end
    end
end
        
    
    
    
    
