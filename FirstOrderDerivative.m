function retval = FirstOrderDerivative( x, lamda, beta )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
retval = 4*x(1)^3-4*x(1)*x(2)+2*x(1)+x(2)^2-2+2*lamda*x(1)+0.5*beta*x(1)+2*x(1)^2+2*x(1)*x(2)+x(2)^2-2+2*lamda*x(2)+1.5*beta*x(2);

end

