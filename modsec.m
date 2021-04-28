function [root, fx, ea, iter]=modsec(func,xi,delta,es,maxit)
%This is a function that will use the Modified Secant method to find the
%root of a function
%Inputs:
%func: the function that you are evaluating
%xi: the initial guess of the root
%delta: how to find the second guess(Can be entered as a decimal or a
%percent
%es: the maximum error desired
%maxit: the maximum number of iterations
%Outputs:
%root: the root of the function
%fx: the function evaluated at the root
%ea: the approximate error at the root
%iter: the number of iterations required to get to the root
percent=input('Is the delta inputed as a percent? 1-yes, 0-no: ');
if percent==1;
    delta=(delta/100)*xi;
end
if nargin<4
    es=.001;
end
if nargin<5
    maxit=300;
end
iter=0; xr=xi; ea=100;
while ea>=es && iter<=maxit
    xrold=xr;
    xr=xrold-((delta*xrold*func(xrold))/((func(xrold+(delta*xrold)))-(func(xrold))));
    if xr~=0
        ea=abs((xr-xrold)/xr)*100;
    else
        ea=0;
    end
    iter=iter+1;
    fx=func(xr);
end
fprintf('The root of the function is %d \n',xr)
fprintf('The function value at the root is %d \n',fx)
fprintf('The approximate error is %d \n',ea)
fprintf('There were %d iterations \n',iter)
