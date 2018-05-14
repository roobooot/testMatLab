%% Pass Extra Parameters to ODE Function
% |ode113| only works with functions that use two input arguments, |t| and
% |y|. However, you can pass in extra parameters by defining them outside
% the function and passing them in when you specify the function handle.
%
% Solve the ODE
%
% $$y'' = \frac{A}{B} t y.$$
%
% Rewriting the equation as a first-order system yields
%
% $$\begin{array}{cl} y'_1 &= y_2\\ y'_2 &= \frac{A}{B} t y_1.
% \end{array}$$
%
% |odefcn.m| represents this system of equations as a function that accepts
% four input arguments: |t|, |y|, |A|, and |B|.
%
% <include>odefcn.m</include>
%

%%
% Solve the ODE using |ode113|. Specify the function handle such that it
% passes in the predefined values for |A| and |B| to |odefcn|.
% A = 1;
% B = 2;
% Paras = [L A w m g d v0];   
Subs = [1.5,0.04,4*pi,70,9.8,0.6,1];
L = Subs(1);
A = Subs(2);
w = Subs(3);
g = Subs(5);
d = Subs(6);
v0 = Subs(7);
x0 = 0;
tspan = [0 0.25];
y0 = [x0 v0];
[t,y] = ode113(@(t,y) odefcn(t,y,A,L,w,g,d), tspan, y0);

%%
% Plot the results.
plot(t,y(:,1),'-o',t,y(:,2),'-.')
yaxis([0,3])