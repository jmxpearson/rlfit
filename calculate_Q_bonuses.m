function Qout = calculate_Q_bonuses(Qin, bonus, choice)
% given a set of action values Q, adds a perseveration bonus to the
% previous trial's choice

Qout = Qin;

for ind = 2:size(Qout, 1)
    Qout(ind, choice(ind - 1)) = Qout(ind, choice(ind - 1)) + bonus;
end