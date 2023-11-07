
function [Data] = GARCHGauss(returns, eps, Data)
    z = zeros(size(returns,1), size(returns,2), size(returns,3));
    LLV = zeros(1, size(returns,2), size(returns,3));
    params = zeros(4, size(returns,2), size(returns,3));
    N = size(returns,1);
    for window = 1:size(returns,3)
        for asset = 1:size(returns, 2)
            mu = mean(returns(:,asset,window));
            Mdl = garch('GARCHLags',1,'ARCHLags',1,'Offset', NaN);
            [EstMdl, ~, logL] = estimate(Mdl,returns(:,asset,window));
            params(:, asset, window) = [EstMdl.Constant, EstMdl.ARCH{1} , EstMdl.GARCH{1}, mu];
            var = zeros(N,1);
            var(1)= sum(returns(:,asset,window).^2)/N;
            for i=2:N
                var(i) = params(1, asset, window) + params(2, asset, window)*(eps(i-1, asset, window))^2 + params(3, asset, window)*var(i-1);
            end

            z(:, asset, window) = (eps(:, asset, window))./sqrt(var);

            LLV(1, asset, window) = logL;
        end
    end
    Data.GARCHGauss.z = z;
    Data.GARCHGauss.Params = params;
    Data.GARCHGauss.LLV = LLV;
end


