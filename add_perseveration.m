function outfun = add_perseveration(Qfun)
% this is a decorator function to add a perseveration bonus to any model.
% given a function, Qfun, that calculates action values, returns a new
% function handle, outfun, that takes one additional parameter (in first
% position) that is a perseveration bonus

outfun = @(alpha, choice, outcome) calculate_Q_bonuses(...
    Qfun(alpha(2:end), choice, outcome), alpha(1), choice);