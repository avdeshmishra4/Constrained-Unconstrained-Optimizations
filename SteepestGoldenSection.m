% ============ Code for Golden Section Method ================
% ============= To find minimum of given function within range a to b ====
function gs_value = SteepestGoldenSection(f, a, b)
    golden_prec = 0.0001; % precision value
    gr = double((sqrt(5)-1)/2); % golden proportion coefficient which is around 0.618
    golden_itr = 0;
    
    c = b-gr*(b-a); % compute two new points within the starting and end point
    d = a+gr*(b-a);
    
    f_c = f(c); % value of function at c and d
    f_d = f(d);
    
    gs_value = Inf;
    while (abs(b-a) > golden_prec)
        golden_itr = golden_itr+1;
        if(f_c < f_d)
            b = d;
            d = c;
            c = b-gr*(b-a);
            f_c = f(c);
            f_d = f(d);     
        else
            a = c;
            c = d;
            d = a+gr*(b-a);
            f_c = f(c);
            f_d = f(d);       
        end
    end

    % chooses minimum point and print values
    if(f_c < f_d)
        % sprintf('minimum found by Golden Section Method:=%.4f', c)
        % sprintf('value of function at minimum:=%.4f', f_c)
        % plot(c,f_c,'.g')
        gs_value = c;
    else
        % sprintf('minimum found by Golden Section Method:=%.4f', d)
        % sprintf('value of function at minimum:=%.4f', f_d)
        % plot(d,f_d,'.g')
        gs_value = c;
    end
    gs_value;

    % title('Plot of minimum value in each iteration of Golden Section, value in green represents lowest minima');

    % sprintf('number of iterations by Golden Section Method:= %d', golden_itr)
end