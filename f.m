%-----f.m---------------------------------------
function retval = f(x)

R = sqrt((x(1)-4)^2 + (x(2)-4)^2 + 0.1);  

retval = -20*sin(R)/R;

end

