function out = runningI(choice, wid)
% given an integer-valued vector of choices, calculate some running measure
% of choice variability
% wid is the width of a sliding window of trials to use
% CAVEAT: NOT A NORMATIVE INSTANTANEOUS ENTROPY MEASURE! WILL BE BIASED!

cprev = choice(1:end-1);
cthis = choice(2:end);

out = nan(size(choice));
for ind = 1:length(choice) - 1
    if ind <= wid
        % out(ind + 1) = mutinf(cprev(1:ind), cthis(1:ind));
    else
        out(ind + 1) = mutinf(cprev(ind - wid:ind), cthis(ind - wid:ind));
    end
end

end


