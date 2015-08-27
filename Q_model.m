function out=Q_model(alpha,choice,outcome)
% basic reinforcement learning model
% calculate the action values, given model parameters
% alpha is the learning rate

N=length(outcome); %number of trials
k=length(unique(choice)); %number of options
Q=nan(N,k); %values of each choice each trial
Qthis=nan(N,1); %value of chosen option

Q(1,:) = 0; %initialize guesses

for ind = 1:(N - 1) 
    % copy forward action values to next trial
    Q(ind + 1, :) = Q(ind, :);
    
    % update option chosen on this trial for next trial's choice
    Q(ind + 1,choice(ind)) = Q(ind,choice(ind)) + alpha*(outcome(ind)-Q(ind,choice(ind)));     
end

%return vector of action values for each trial
out=Q;