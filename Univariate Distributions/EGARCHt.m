function [Data] = EGARCHt(returns, eps, Data)
    z = zeros(size(returns,1), size(returns,2), size(returns,3));
    LLV = zeros(1, size(returns,2), size(returns,3));
    params = zeros(5, size(returns,2), size(returns,3));
    N = size(returns,1);
    for window = 1:size(returns, 3)
        for asset = 1:size(returns, 2)
            mu = mean(returns(:,asset,window));
            Mdl = egarch('GARCHLags',1,'ARCHLags',1,'LeverageLags',1,'Offset',NaN);
            Mdl.Distribution = struct('Name','t', 'DoF', NaN);
            [EstMdl, ~, logL] = estimate(Mdl,returns(:, asset, window));
            params(:, asset, window) = [EstMdl.Constant, EstMdl.GARCH{1} , EstMdl.Leverage{1}, EstMdl.ARCH{1}, EstMdl.Distribution.DoF];
            var = zeros(N,1);
            var(1)= sum(returns(:,asset, window).^2)/N;
            for i=2:N  
                var(i) = exp( params(1, asset, window) + params(2, asset, window)*(log(var(i-1))) + ...
                         params(3, asset, window)*((eps(i-1, asset, window)))/sqrt(var(i-1)) + ...
                         params(4, asset, window)*((abs(eps(i-1, asset, window)))/sqrt(var(i-1)) - ...
                         sqrt((params(5, asset, window) - 2)/ pi)*(gamma((params(5, asset, window) - 1)/2)/gamma((params(5, asset, window))/2))));
            z(:, asset, window) = (eps(:, asset, window))./sqrt(var);
            end
        LLV(1, asset, window) = logL;
        end
    end
    Data.EGARCHt.z = z;
    Data.EGARCHt.Params = params;
    Data.EGARCHt.LLV = LLV;

end

