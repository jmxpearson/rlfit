function out=Q_model(alpha,choice,outcome)
% basic reinforcement learning model
% calculate the action values, given model parameters
% alpha is the learning rate

N=length(outcome); %number of trials
k=length(unique(choice)); %number of options
Q=nan(N,k); %values of each choice each trial
Qthis=nan(N,1); %value of chosen option

Q(1,:) = 0; %initialize guesses
Qthis(1) = 0;
for ind = 2:N
    %old business: bring forward action values from last trial
    Q(ind,:) = Q(ind-1,:); %all values set to those for last trial
    Qthis(ind) = Q(ind,choice(ind)); %value we based our decision this trial on
    
    %now do learning update for chosen value
    Q(ind,choice(ind)) = Q(ind,choice(ind)) + alpha*(outcome(ind)-Q(ind,choice(ind))); 
    
end

%return vector of action values for each trial
out=Q;