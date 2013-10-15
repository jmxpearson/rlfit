% example.m
% basic code for fitting a learning model

% load up data
load testdata

% model has only one parameter, the learning rate, between 0 and 1
% in general, there will be one of these for each parameter (excluding the
% softmax parameter)
lb = 0; %lower bounds
ub = 1; %upper bounds

% now optmize to fit model
numiter = 10;
[beta, LL, Q] = rlfit(@Q_model, choice, outcome, lb, ub, numiter);

% plot results
plot(Q)
