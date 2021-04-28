function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%inputs:
%func: the function that is being evaluated
%xl, xu: the upper and lower bounds
%es: the acceptable error(default .0001)
%maxit: maximum number of iterations(default 200)
%varargin: any other parameters used by function
%outputs:
%root: estimated root value
%fx: function evaluated at root
%ea: approximate relative error
%iter: number of iterations
if nargin<3
    error('Please specify function, lower bound, and upper bound')
elseif nargin<4
    es=.0001
else nargin<5
    maxit=200
end
if func(xl)*func(xu)>0
    error('No root between specified perameters.  Please choose different bounds')
end
it=0, xr=xu, ea=100
while ea>es
    xrold=xr;
    xr=xu-((func(xu))*(xl-xu))/(func(xl)-func(xu));
    if xr ~=0
        ea=abs((xr-xrold)/xr)*100;
    end
    it=it+1
end
root=xr
fx=func(xr)
ea=ea
iter=it
end