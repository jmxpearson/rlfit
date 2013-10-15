function [beta,fval]=multmin(fhandle,lb,ub,numiter,options)
% runs multiple minimizations, so as not to get trapped in local min
% chooses random starting points uniformly between allowed bounds

for ind=1:numiter
    bthis=lb+rand(1,numel(ub)).*(ub-lb); %seed random starting point
    if exist('options','var')
        [beta(ind,:),fval(ind)]=fmincon(fhandle,bthis,[],[],[],[],lb,ub,[],options);
    else
        [beta(ind,:),fval(ind)]=fmincon(fhandle,bthis,[],[],[],[],lb,ub,[]);
    end
end

[~, best_ind]=min(fval);
beta=beta(best_ind,:);
fval=min(fval);

end