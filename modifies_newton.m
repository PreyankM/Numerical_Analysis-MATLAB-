%MODIFIED NEWTON'S METHOD
%Author : Preyank Mota - 2019B4A70331G
%Modified Newton's method is a numerical method to find an approximate root
%of the given function. It is an extension of the Newton's method.

format long g;  % Setting up format for output screen.

%Initializing the function to find the root. Calling the function to
%calculate the root.
f = @(x)exp(x)-x-1;

disp("Change function inside program('.m' file).");
init = input("Enter initial approximation : ");%-0.23421061 for given example
TOL = input("Tolorence/error limit : ");%1e-15 for given example
nmax = input("Enter maximum number of iterations allowed : ");%20 for given example

%Function Parameters consist of 1.function(in the form of @(x)),2. Initial approximation(p_0), 
%3. Tolerence limit, 4. Maximum number of iterations(N_0)
s = newton(f,init,TOL,nmax);

%Function for calculating root by Modified Newton's method.
function p = newton(g,p0,err,n0)
disp("MODIFIED NEWTON'S METHOD");

    syms x;
    g1 = diff(sym(g)); %Calculating f'(x)
    g2 = diff(sym(g1)); %Calculating f''(x)
    
    %Initializing function parameters.
    ctr = 1;
    n_arr = [ctr]; 
    p = [p0];
    
    while(n0 >= ctr)
        q0 = double(vpa(subs(g1,x,p0),10)); %Calculating q0 = f'(p0)
        r0 = double(vpa(subs(g2,x,p0),10)); %Calculating r0 = f''(p0)
        
        pn = p0 - ((g(p0)*q0)/((q0*q0) - (g(p0)*r0))); %Iterative scheme
        
        %Output array updation
        p = [p;pn];
        ctr = ctr + 1;
        n_arr = [n_arr;ctr];
        
        %STOPPING CRITERIA 
        if(abs(p0-pn) < err)
            break;
        end
        
        %Updating parameters
        p0 = pn;
        
    end
    if(ctr == err)
    fprintf("Method failed after N_0 iterations, N_0 = %d", err);
    end
    
    %Printing final table onto the output screen.
    newtonMethod = table(n_arr,p);
    disp(newtonMethod);
end