function [ c, ceq ] = nonlincons( x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
c = 0.25*x(1)^2+0.75*x(2)^2-1;
ceq = x(1)^2+x(2)^2-2;

end

