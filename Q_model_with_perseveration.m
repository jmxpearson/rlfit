function out=Q_model_with_perseveration(alpha,choice,outcome)
% basic reinforcement learning model
% calculate the action values, given model parameters
% alpha(1) is the learning rate
% alpha(2) is the perseveration bonus

N=length(outcome); %number of trials
k=length(unique(choice)); %number of options
Q=nan(N,k); %values of each choice each trial

Q(1,:) = 0; %initialize guesses

for ind = 2:N
    %old business: bring forward action values from last trial
    Q(ind,:) = Q(ind-1,:); %all values set to those for last trial
    
    %now do learning update for chosen value
    Q(ind,choice(ind)) = Q(ind,choice(ind)) + alpha(1)*(outcome(ind)-Q(ind,choice(ind)));  
end

% now go through and bump the value of perseverative options 
for ind = 2:N
    % increment Q-value of last trial's choice by alpha(2)
    Q(ind, choice(ind - 1)) = Q(ind, choice(ind - 1)) + alpha(2);
end

%return vector of action values for each trial
out=Q;