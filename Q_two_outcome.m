function [Q, Q_mon, Q_soc] = Q_two_outcome(beta, choice, outcome)
%calculate the log likelihood of observed choices, given model parameters
%beta, choices, and outcomes
%beta(1) is a learning rate for monetary
%beta(2) is a learning rate for social
%beta(3) is the alpha of how much one is adjusting between monetary and
%social outcomes

N = size(outcome, 1); %number of trials
k = max(unique(choice)); %number of options
Q_mon = nan(N,k); %values of each choice each trial
Q_soc = nan(N,k);
Qthis_mon = nan(N,1); %value of chosen option
Qthis_soc = nan(N,1);

outcome_mon = outcome(:,1);
outcome_soc = outcome(:,2);

Q_mon(1,:) = 0;%initialize guesses
Q_soc(1,:) = 0;
Qthis_mon(1) = 0;
Qthis_soc(1) = 0;

for ind=2:N
    %old business: bring forward action values from last trial
    Q_mon(ind,:) = Q_mon(ind-1,:); %all values set to those for last trial
    Qthis_mon(ind) = Q_mon(ind,choice(ind)); %value we based our decision this trial on
    
    Q_soc(ind,:) = Q_soc(ind-1,:); %all values set to those for last trial
    Qthis_soc(ind) = Q_soc(ind,choice(ind)); %value we based our decision this trial on
    
    %now do learning update for chosen value
    Q_mon(ind,choice(ind)) = Q_mon(ind,choice(ind)) + beta(1)*(outcome_mon(ind)-Q_mon(ind,choice(ind))); 
    Q_soc(ind,choice(ind)) = Q_soc(ind,choice(ind)) + beta(2)*(outcome_soc(ind)-Q_soc(ind,choice(ind)));
    
end

%now that we have Q's, transform to decision variables
Q = beta(3)*Q_mon + (1-beta(3))*Q_soc;

end