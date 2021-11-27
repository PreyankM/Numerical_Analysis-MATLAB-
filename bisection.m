%BISECTION METHOD
%Author : Preyank Mota - 2019B4A70331G
%Bisection method is a numerical method to find roots of a function. 

format long g; % Setting up format for output screen.

%Initializing the function to find the root. Calling the function to
%calculate the root.
f=@(x)x^3+4*x^2-10;

disp("Change function inside program('.m' file).");
a_val = input("Enter value of approximation of point 'a' : ");%1 for given example
b_val = input("Enter value of approximation of point 'b' : ");%2 for given example
TOL = input("Tolorence/error limit : ");%1e-15 for given example
nmax = input("Enter maximum number of iterations allowed : ");%20 for given example

%Function Parameters consist of 1.function(in the form of @(x)),2. Value of
%a, 3. Value of b, 4. Tolerence limit, 5. Maximum number of iterations(N_0)
root=bisectionMethod(f,a_val,b_val,TOL,nmax);

%Function for calculating root by bisection method.
function c = bisectionMethod(f,a,b,error,max_iter)
disp("BISECTION METHOD");

%Initializing function parameters.
c=(a+b)/2;
ctr = 1;
a_arr = [a];
b_arr = [b];
p_arr = [c];
n_arr = [ctr];
f_arr = [(f(c))];


while (ctr < max_iter)
    comp = c; % Saving p_(n-1) to a new variable
    
    if f(c)<0&&f(a)<0
        a=c;
    else
        b=c;
    end
    
    c = a + (b-a)/2; %Iterative scheme
    
    %Updating parameters
    ctr = ctr + 1;
    a_arr = [a_arr; a];
    b_arr = [b_arr; b];
    p_arr = [p_arr; c];
    n_arr = [n_arr; ctr];
    f_arr = [f_arr; (f(c))];
    
    % VARIOUS STOPPING CRITERIA
    %Uncomment any stoppin criteria and comment all others to try the
    %specific stopping criteria.
    
%     if(f(c) == 0 || (b - a)/2 < error)
    if(abs(f(c)) < error)
%     if((abs(c - comp)/abs(c)) < error)
%     if(abs(comp-c) < error)
        break;
    end
end

if(ctr == max_iter)
    fprintf("Method failed after N_0 iterations, N_0 = %d", max_iter);
end

%Printing final table onto the output screen.
bisectionm = table(n_arr, a_arr, b_arr, p_arr, f_arr);
disp(bisectionm);

end