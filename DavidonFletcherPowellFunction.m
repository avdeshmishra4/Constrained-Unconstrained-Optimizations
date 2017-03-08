function  retval = DavidonFletcherPowellFunction(fun_name, x, lamda, beta, rh, rg)
% =========== Davidon-Fletcher-Powell Method ========= %%%%

B = [0.55 1; 1 0.55];
iter = 0;

%nvar = length(x);
%B = eye(nvar);

grad_precision = 0.00001;
fx_precision = 0.00001;
DxToler = [0.00001, 0.00001];

begin = true;
g1 = gradfunction(fun_name, x)';
f_begin = feval(fun_name, x);

    while begin
        N = length(x);
        s = -1*B*g1;
        s = s'/norm(s); % column vector is generated
        
        f3 = @(L) ((x(1)+L*s(1))^4- 2*(x(1)+L*s(1))^2*(x(2)+L*s(2))+(x(1)+L*s(1))^2+(x(1)+L*s(1))*(x(2)+L*s(2))^2-2*(x(1)+L*s(1))+4)+lamda*((x(1)+L*s(1))*(x(1)+L*s(1))+(x(2)+L*s(2))*(x(2)+L*s(2))-2)'+rh*(((x(1)+L*s(1))*(x(1)+L*s(1))+(x(2)+L*s(2))*(x(2)+L*s(2))-2)*((x(1)+L*s(1))*(x(1)+L*s(1))+(x(2)+L*s(2))*(x(2)+L*s(2))-2)')+beta*(max((0.25*(x(1)+L*s(1))*(x(1)+L*s(1))+0.75*(x(2)+L*s(2))*(x(2)+L*s(2))-1),-beta/(2*rg)))'+rg*((max((0.25*(x(1)+L*s(1))*(x(1)+L*s(1))+0.75*(x(2)+L*s(2))*(x(2)+L*s(2))-1),-beta/(2*rg)))*(max((0.25*(x(1)+L*s(1))*(x(1)+L*s(1))+0.75*(x(2)+L*s(2))*(x(2)+L*s(2))-1),-beta/(2*rg)))');
        % use fminsearch(f, starting_guess) to compute alpha
               
        alpha = fminsearch(f3, 0);
        d = alpha*s;        
        x = x+d;
        
        f_val = feval(fun_name, x);
        %disp(['value of boj fxn = ' num2str(f_val, '%.6f')]);

        g2 = gradfunction(fun_name, x)';
        g = g2 - g1;
        g1 = g2;
        
        %test for convergence
       
        for i = 1:N
            if abs(d(i)) > DxToler(i)
             break
            end
        end
        
        
        fxdiff = abs(f_val - f_begin);
        if(fxdiff < fx_precision)
            break;
        end
        
        if(norm(g1) < grad_precision)
            break;
        end
             
        m1 = (s*s');

        m2 = (s*g);
        
        if(m2 == 0)
            break;
        end
        
        B= B+alpha*m1*1/m2;
        m3 = B*g;
        m4 = B'*g;
        m5 = g'*B*g;
        B = B-m3*m4'/m5;

        iter = iter+1;
        f_begin = f_val;

    end
    
    retval = x;

end


