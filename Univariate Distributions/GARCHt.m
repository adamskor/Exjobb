
function [Data] = GARCHt(returns, eps, Data)
    z = zeros(size(returns,1), size(returns,2), size(returns,3));
    LLV = zeros(1, size(returns,2), size(returns,3));
    params = zeros(6, size(returns,2), size(returns,3));
    N = size(returns, 1);
    for window = 1:size(returns, 3)
        for asset = 1:size(returns, 2)
            mu = mean(returns(:, asset, window));
            Mdl = garch('GARCHLags',1,'ARCHLags',1,'Offset', NaN);
            Mdl.Distribution = struct('Name','t', 'DoF', NaN);
            [EstMdl, ~, logL] = estimate(Mdl,returns(:, asset, window));
            params(:, asset) = [EstMdl.Constant, EstMdl.ARCH{1} , EstMdl.GARCH{1}, 0, EstMdl.Distribution.DoF, mu];
            var = zeros(N,1);
            var(1)= sum(returns(:, asset, window).^2)/N;
            for i=2:N
                var(i) = params(1, asset, window) + params(2, asset, window)*(eps(i-1, asset, window))^2 + params(3, asset, window)*var(i-1);
            end
            z(:, asset, window) = (eps(:, asset, window))./sqrt(var);
            LLV(1, asset, window) = logL;
        end
    end
    Data.Univariate.GARCHt.z = z;
    Data.Univariate.GARCHt.Params = params;
    Data.Univariate.GARCHt.LLV = LLV;

    
    
    
    
end


