% Plot of f(x) versus x over the interval [1, 2]
x = [1, 2];
f = @(x) 8*exp(1-x)+7*log(x);
fplot(f, x);
xlabel('x');
ylabel('f(x)');
title('Plot of f(x) over the interval [1, 2]');
% Use of matlab function fminbnd to find the minimum of the function over the interval [1, 2] 
[min, fval] = fminsearch(f, 1);
sprintf('minimum found by matlab function fminsearch:=%.4f', min)
sprintf('function value at minimum found by fminsearch:=%.4f', fval)

% ================ Code for Golden Section Method ====================
% ================ To find minimum of given function =================
figure; hold on;
f = @(x) 8*exp(1-x)+7*log(x);
a = 1;							%start of the interval
b = 2;							% end of the interval
golden_prec = 0.0001;					% precision value
gr = double((sqrt(5)-1)/2);		% golden proportion coefficient which is around 0.618
golden_itr = 0;						% number of iteration

c = b-gr*(b-a);                 % compute two new points within the starting and end point
d = a+gr*(b-a);

f_c = f(c);                     % value of function at c and d
f_d = f(d);

plot(c,f_c,'rx')                % plotting c and d
plot(d,f_d,'rx')

while (abs(b-a) > golden_prec)
	golden_itr = golden_itr+1;
	if(f_c < f_d)
		b = d;
		d = c;
		c = b-gr*(b-a);
        f_c = f(c);
        f_d = f(d);
        
        plot(c,f_c,'rx')       

	else
		a = c;
		c = d;
		d = a+gr*(b-a);
        f_c = f(c);
        f_d = f(d);
        plot(d,f_d,'rx')       
    end
end

% chooses minimum point and print values
if(f_c < f_d)
    sprintf('minimum found by Golden Section Method:=%.4f', c)
    sprintf('value of function at minimum:=%.4f', f_c)
    plot(c,f_c,'.g')
else
    sprintf('minimum found by Golden Section Method:=%.4f', d)
    sprintf('value of function at minimum:=%.4f', f_d)
    plot(d,f_d,'.g')
end

title('Plot of minimum value in each iteration of Golden Section, value in green represents lowest minima');

sprintf('number of iterations by Golden Section Method:= %d', golden_itr)


    





