% ================ Code for Newton's Method ==============================
% ================ To find minimum of given function =====================

f_der = @(x) (7/x)-8*exp(1-x);          % first derivative of the function
f_double_der = @(x) 8*exp(1-x)-(7/x^2); % second derivative of the function
x = 1.1;                                % initial condition
err = 1;                                % error (difference of (y-x))
newton_prec = 0.0001;                   % precision
newton_itr = 0;                         % number of iteration
xvals = x;                              % array which stores value of y in each iteration

while(err >= newton_prec)               % loop until the error is greater than or equals to the precision
    y = x - (f_der(x)/f_double_der(x)); 
    xvals = [xvals; y];
    err = abs(y-x);
    x = y;
    newton_itr = newton_itr+1;
end

sprintf('number of iterations by Newton Mwthod:= %d', newton_itr)
sprintf('following are the values obtained in each iteration of Newtons Method')
xvals
