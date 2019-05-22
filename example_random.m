% Example code for fitting a reinforcement learning model to 
% a multi-option choice paradigm with choice options present on each trial 
% drawn from a larger set and randomly assigned to position

% Load up some made up data
load randomdata

% Paradigm settings
nset = 3; % number of options in the set
nopt = 2; % number of options presented on each trial

% Select model
Qfun = @Q_two_outcome; % two outcomes per choice

% Model has three parameters (excluding the softmax parameter):
% beta(1) is a learning rate for outcome1
% beta(2) is a learning rate for outcome2
% beta(3) is the alpha of how much one is adjusting 
% between outcome1 and outcome2
% (1 = entirely outcome1; 0 = entirely outcome2)
lb = [0, 0, 0]; % lower bounds
ub = [1, 1, 1]; % upper bounds

% Create a vector for each trial to indicate options present
% Q values will be multiplied by this vector
% before computing softmax probability 
% so that it will sum to 1 only on the options present
ispresentx = false(size(options, 1), nset);
for idx = 1:size(options, 1)
    ispresentx(idx, options(idx, 1:nopt)) = true;
    % options contains the numerical index of the option 
    % presented in each position on each trial
end

if isequal(size(choice, 1), size(ispresentx, 1)) == false
    error('ispresentx and data are different length!')
end

% Optmize to fit model
numiter = 10;
[beta, LL, Q] = rlfit(Qfun, choice, outcome, lb, ub, numiter, ...
    ispresentx);

% Plot results
plot(Q)