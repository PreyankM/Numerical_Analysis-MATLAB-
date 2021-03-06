%NEWTON'S METHOD
%Newton's method is a numerical method to find approximate root of a
%function.

format long g; % Setting up format for output screen.

%Initializing the function to find the root. Calling the function to
%calculate the root.
f = @(x)cos(x)-x;

disp("Change function inside program('.m' file).");
init = input("Enter initial approximation : ");%0.7853981635 for given example
TOL = input("Tolorence/error limit : ");%1e-15 for given example
nmax = input("Enter maximum number of iterations allowed : ");%20 for given example

%Function Parameters consist of 1.function(in the form of @(x)),2. Initial approximation(p_0), 
%3. Tolerence limit, 4. Maximum number of iterations(N_0)
s = newton(f,init,TOL,nmax);

%Function for calculating root by Newton's method.
function p = newton(g,p0,err,n0)
disp("NEWTON'S METHOD");

%Initializing function parameters.
    syms x;
    g1 = diff(sym(g)); %Calculating g'(x)
    ctr = 0;
    n_arr = [ctr];
    p = [p0];
    
    while(n0 >= ctr)
        
        q0 = double(vpa(subs(g1,x,p0),10)); %Calculating q0 = g'(p0)
        pn = p0-(g(p0)/q0); %Iterative scheme
        
        %VARIOUS STOPPING CRITERIA
        %Uncomment any stoppin criteria and comment all others to try the
        %specific stopping criteria.
        
        if(abs(pn-p0) < err)
%         if(abs(pn-p0)/abs(pn) < err)
%         if(abs(g(pn)) < err)
            break;
        end
        
        %Updating parameters
        p = [p;pn];
        p0 = pn;
        ctr = ctr + 1;
        n_arr = [n_arr;ctr];
    end
    
    if(ctr == err)
    fprintf("Method failed after N_0 iterations, N_0 = %d\n", err);
    end
    
    %Printing final table onto the output screen.
    newtonMethod = table(n_arr,p);
    disp(newtonMethod);
end
