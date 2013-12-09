function out = choice_entropy(x)
% calculate entropy in x 

px = accumarray(x, 1);  % counts of each unique value in x
px = px ./ sum(px);
bad = px == 0;
H = -sum(px(~bad) .* log2(px(~bad)));

out = H;