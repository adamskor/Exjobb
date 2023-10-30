
function [z, eps, params] = GARCH(data, dist, plotting)
    %%%
    % If dist = t student t is assumed
    %%%
    returns = data.returns;
    z = zeros(size(returns,1), size(returns,2));
    eps = zeros(size(returns,1), size(returns,2));
    if dist == 't'
        params = zeros(4, size(returns,2));
    else
        params = zeros(3, size(returns,2));
    end
    N = max(size(returns));
    for asset = 1:size(returns, 2)
        mu = mean(returns(:,asset));
        Mdl = garch('GARCHLags',1,'ARCHLags',1,'Offset',NaN);
        if dist == 't'
            Mdl.Distribution = struct('Name','t', 'DoF', NaN);
        end
        EstMdl = estimate(Mdl,returns(:,asset));
        if dist == 't'
            params(:, asset) = [EstMdl.Constant, EstMdl.ARCH{1} , EstMdl.GARCH{1}, EstMdl.Distribution.DoF];
        else
            params(:, asset) = [EstMdl.Constant, EstMdl.ARCH{1} , EstMdl.GARCH{1}];
        end
        var = zeros(N,1);
        var(1)= sum(returns(:,asset).^2)/N;

        for i=2:N
            var(i) = params(1, asset) + params(2, asset)*(returns(i-1, asset) - mu)^2 + params(3, asset)*var(i-1)^2;
        end
        eps(:, asset) = returns(:,asset) - mu;
        z(:, asset) = (eps(:, asset))./sqrt(var);
    end
    
    
    
    
    
end


