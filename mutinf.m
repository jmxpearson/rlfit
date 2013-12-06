function out = mutinf(x, y)
% calculate mutual information between variables x and y
% assumes values are discrete

% first, get entropies of marginal distributions
Hx = entropy(x);
Hy = entropy(y);

% now do joint
% the following gets codes for each unique pair (x, y)
[~, ~, idx] = unique([x(:) y(:)], 'rows');
Hxy = entropy(idx);

out = Hx + Hy - Hxy;