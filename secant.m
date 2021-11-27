%SECANT METHOD
%Author : Preyank Mota - 2019B4A70331G
%Secant method is a numerical method to find approximate root of a
%function.

format long g; % Setting up format for output screen.

%Initializing the function to find the root. Calling the function to
%calculate the root.
f = @(x)cos(x) - x;

disp("Change function inside program('.m' file).");
init = input("Enter first initial approximation : ");%0.5 for given example
init2 = input("Enter second initial approximation : ");%0.7853981635 for given example
TOL = input("Tolorence/error limit : ");%1e-5 for given example
nmax = input("Enter maximum number of iterations allowed : ");%20 for given example

%Function Parameters consist of 1.function(in the form of @(x)),2. Initial approximation(p_0), 
%3. Initial approximation(p_1), 4. Tolerence limit, 5. Maximum number of iterations(N_0)
p_root = secantMethod(f,init,init2,TOL,nmax);

%Function for calculating root by Secant method.
function pn = secantMethod(g,p0,p1,err,n0)
disp("SECANT METHOD");

%Initializing function parameters.
    ctr = 1;
    n = [0;ctr];
    pn = [p0;p1];
    
    q0 = g(p0);
    q1 = g(p1);
    
    while(ctr < n0)
        
        temp = p1 - q1*(p1-p0)/(q1-q0); %Iterative scheme
        
        %Updating parameters
        pn = [pn;temp];
        ctr = ctr + 1;
        n = [n;ctr];
        
        %STOPPING CRITERIA
        if(abs(temp-p1) < err)
            break;
        end
        
        %Updating parameters
        p0 = p1;
        q0 = q1;
        p1 = temp;
        q1 = g(temp);
        
    end
    if(ctr == err)
    fprintf("Method failed after N_0 iterations, N_0 = %d", err);
    end
    
    %Printing final table onto the output screen.
    roots = table(n,pn);
    disp(roots);

end
