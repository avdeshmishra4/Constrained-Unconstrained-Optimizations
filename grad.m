function y = grad( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y = [400*x(1)^3-400*x(1)*x(2)+2*x(1)-2;
    200*x(2)-200*x(1)^2];

end

