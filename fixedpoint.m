%FIXED POINT ITERATION
%Author : Preyank Mota - 2019B4A70331G
%Fixed point iteration is a numerical method to find find fixed point of a
%function and rearraging it to find the root of the resulting new function.

%Here, the output contains 'NaN' values. These represent the iteration has
%hit a stopping criteria and thus does not produce any new iterations.
%Output first contains individual values as a list for each function then
%the final table is printed to the output screen.

format long g; % Setting up format for output screen.

%Initializing the function to find the root. Calling the function to
%calculate the root.
g1 = @(x)x-x^3-4*x^2+10;
g2 = @(x)(10/x - 4*x)^0.5;
g3 = @(x)0.5*(10-x^3)^0.5;
g4 = @(x)(10/(4+x))^0.5;
g5 = @(x)x-((x^3+4*x^2-10)/(3*x^2+8*x));

%Function Parameters consist of 1.function(in the form of @(x)),2. Initial approximation(p_0), 
%3. Tolerence limit, 4. Maximum number of iterations(N_0)

disp("Change function inside program('.m' file).");
init = input("Enter initial approximation : ");%1.5 for given example
TOL = input("Tolorence/error limit : ");%1e-5 for given example
nmax = input("Enter maximum number of iterations allowed : ");%20 for given example

% To print separate p_n arrays remove semicolon from the folowing 5 commands.
s1=fixedPoint(g1,init,TOL,nmax);
s2=fixedPoint(g2,init,TOL,nmax);
s3=fixedPoint(g3,init,TOL,nmax);
s4=fixedPoint(g4,init,TOL,nmax);
s5=fixedPoint(g5,init,TOL,nmax);
 
 %Fixing different array sizes to arrange arrays in a table.
 %Comment the following block of code to hide the output as a table.
 %In this table the 'NaN' values are meant to be blank spaces.
 arr_size = max([numel(s1),numel(s2),numel(s3),numel(s4),numel(s5)]);
 s1(end+1:arr_size) = "";
 s2(end+1:arr_size) = "";
 s3(end+1:arr_size) = "";
 s4(end+1:arr_size) = "";
 s5(end+1:arr_size) = "";
 n = [0:20];
 n = transpose(n);
 fixed_point = table(n,s1,s2,s3,s4,s5);
 disp(fixed_point);
 
%Function for calculating root by fixed point iteration method. 
function p = fixedPoint(g,p0,error,max_iters)
disp("FIXED POINT ITERATION METHOD");

%Initializing function parameters
MAX_VALUE = 999999999999999; %Max value parameter, so that iteration values do not go very high.

ctr = 1;
p = [p0];
new_p = 0;
n_arr = [ctr];

while(ctr <= max_iters)
    
    new_p = g(p0); %Iterative scheme
    p = [p; new_p];
    
    %Stopping criteria(Extra criteria used so that values of p_n does not blow up)
    if((abs(new_p-p0) < error) || (abs(new_p) > MAX_VALUE))
        break;
    end
    
    %Updating parameters.
    p0 = new_p;
    ctr = ctr + 1;
    n_arr = [n_arr; ctr];
end

if(ctr-1 == max_iters)
    fprintf("Method failed after N_0 iterations, N_0 = %d\n", max_iters);
end
disp(p);
    
end