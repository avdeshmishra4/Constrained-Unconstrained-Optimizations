function retval = ObjFunction( x )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    retval = x(1)^4- 2*x(1)^2*x(2)+x(1)^2+x(1)*x(2)^2-2*x(1)+4;

end

