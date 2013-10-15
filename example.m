% example.m
% basic code for fitting a learning model

%let's assume we have variables choice and outcome for each trial

%define a function to minimize (-log likelihood for observed data)
fitfun=@(beta)(-1)*sum(LL_model(beta,choice,outcome));

%now set bounds for shift, softmax parameter, and learining rate
%see LL_model for more details
lb=[-50 1e-5 0]; %lower bounds
ub=[50 100 1]; %upper bounds

%now optmize to fit model
numiter = 10;
[beta,fval]=multmin(fitfun,lb,ub,numiter,options);

LL=-fval;

