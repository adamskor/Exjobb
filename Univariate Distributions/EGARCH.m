function [z, eps, params] = GARCH(data, dist, plotting)
    %%%
    % If dist = t student t is assumed
    %%%
    returns = data.returns;
    z = zeros(size(returns,1), size(returns,2));
    eps = zeros(size(returns,1), size(returns,2));
    if dist == 't'
        params = zeros(5, size(returns,2));
    else
        params = zeros(4, size(returns,2));
    end
    N = max(size(returns));
    for asset = 1:size(returns, 2)
        mu = mean(returns(:,asset));
        Mdl = egarch('GARCHLags',1,'ARCHLags',1,'LeverageLags',1,'Offset',NaN);
        if dist == 't'
            Mdl.Distribution = struct('Name','t', 'DoF', NaN);
        end
        EstMdl = estimate(Mdl,returns(:,asset));
        if dist == 't'
            
            params(:, asset) = [EstMdl.Constant, EstMdl.ARCH{1} , EstMdl.GARCH{1}, EstMdl.Leverage{1}, EstMdl.Distribution.DoF];
        else
            
            params(:, asset) = [EstMdl.Constant, EstMdl.ARCH{1} , EstMdl.GARCH{1}, EstMdl.Leverage{1}];
        end
        var = zeros(N,1);
        var(1)= sum(returns(:,asset).^2)/N;
        eps(:, asset) = returns(:,asset) - mu;
        for i=2:N
            if dist == 't'
                var(i) = exp( params(1) + params(2)*(log(var(i-1))) + ...
                         params(3)*(abs(eps(i-1)))/var(i-1) + ...
                         params(4)*((abs(eps(i-1)))/var(i-1) - ...
                         sqrt((EstMdl.Distribution.DoF - 2)/ pi)*(gamma((EstMdl.Distribution.DoF - 1)/2)/gamma((EstMdl.Distribution.DoF)/2))));
        
            else
                var(i) = exp( params(1) + params(2)*(log(var(i-1))) + ...
                         params(3)*(abs(eps(i-1)))/var(i-1) + ...
                         params(4)*((abs(eps(i-1)))/var(i-1) - sqrt(2/pi)));
            end
            
        
        z(:, asset) = (eps(:, asset))./sqrt(var);
        end
        
    end
    z = z(2:end,:);
end

