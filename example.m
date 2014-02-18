% example.m
% basic code for fitting a learning model

% load up data
load testdata

% model has only one parameter, the learning rate, between 0 and 1
% in general, there will be one of these for each parameter (excluding the
% softmax parameter)
lb = 0; %lower bounds
ub = 1; %upper bounds

% however, we can also use a decorator to add perseveration behavior 
% to the model:
% the following are limits for a perseveration bonus
lb = [-1, lb];
ub = [1, ub];
Qfun = add_perseveration(@Q_model);

% now optmize to fit model
numiter = 10;
[beta, LL, Q] = rlfit(Qfun, choice, outcome, lb, ub, numiter);

% plot results
plot(Q)
