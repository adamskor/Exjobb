function [Data] = EGARCHGauss(returns, eps, Data)
    z = zeros(size(returns,1), size(returns,2), size(returns,3));
    LLV = zeros(1, size(returns,2), size(returns,3));
    params = zeros(6, size(returns,2), size(returns,3));
    N = size(returns,1);
    for window = 1:size(returns, 3)
        for asset = 1:size(returns, 2)
            mu = mean(returns(:,asset,window));
            Mdl = egarch('GARCHLags',1,'ARCHLags',1,'LeverageLags',1,'Offset',NaN);
            [EstMdl, ~, logL] = estimate(Mdl,returns(:, asset, window));
            params(:, asset, window) = [EstMdl.Constant, EstMdl.ARCH{1}, EstMdl.GARCH{1}, EstMdl.Leverage{1}, 0, mu];
            var = zeros(N,1);
            var(1)= sum(returns(:,asset, window).^2)/N;
            for i=2:N
                var(i) = exp( params(1, asset, window) + params(3, asset, window)*(log(var(i-1))) + ...
                         params(4, asset, window)*((eps(i-1, asset, window)))/sqrt(var(i-1)) + ...
                         params(2, asset, window)*((abs(eps(i-1, asset, window)))/sqrt(var(i-1)) - sqrt(2/pi)));
            end
            z(:, asset, window) = (eps(:, asset, window))./sqrt(var);
            LLV(1, asset, window) = logL;
        end
    end
    Data.Univariate.EGARCHGauss.z = z;
    Data.Univariate.EGARCHGauss.Params = params;
    Data.Univariate.EGARCHGauss.LLV = LLV;

end

