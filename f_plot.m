%----f_plot.m------------------------------------

function ret = f_plot(X,Y)

%

% generating values for plotting 

% 

R = sqrt((X-4).^2 + (Y-4).^2 + 0.1); 

ret = -20*sin(R)./R;

end

