function [Data] = EGARCHt(returns, eps, Data)
    z = zeros(size(returns,1), size(returns,2), size(returns,3));
    var = zeros(size(returns,1), size(returns,2), size(returns,3));
    LLV = zeros(1, size(returns,2), size(returns,3));
    params = zeros(6, size(returns,2), size(returns,3));
    N = size(returns,1);
    for window = 1:size(returns, 3)
        disp(window)
        for asset = 1:size(returns, 2)
            mu = mean(returns(:,asset,window));
            Mdl = egarch('GARCHLags',1,'ARCHLags',1,'LeverageLags',1,'Offset',NaN);
            Mdl.Distribution = struct('Name','t', 'DoF', NaN);
            %[EstMdl, ~, logL] = estimate(Mdl,returns(:, asset, window),'Display', 'off');
            options = optimoptions(@fmincon,'ConstraintTolerance', 1e-14,'Algorithm', 'interior-point');
            [EstMdl, ~, logL] = estimate(Mdl,returns(:, asset, window), 'Options', options);
            params(:, asset, window) = [EstMdl.Constant, EstMdl.ARCH{1}, EstMdl.GARCH{1}, EstMdl.Leverage{1}, EstMdl.Distribution.DoF, mu];
            var(1, asset, window)= sum(returns(:,asset, window).^2)/N;
            for i=2:N  
                var(i, asset, window) = exp( params(1, asset, window) + params(3, asset, window)*(log(var(i-1))) + ...
                         params(4, asset, window)*((eps(i-1, asset, window)))/sqrt(var(i-1)) + ...
                         params(2, asset, window)*((abs(eps(i-1, asset, window)))/sqrt(var(i-1)) - ...
                         sqrt((params(5, asset, window) - 2)/ pi)*(gamma((params(5, asset, window) - 1)/2)/gamma((params(5, asset, window))/2))));
                z(:, asset, window) = (eps(:, asset, window))./sqrt(var(:,asset, window));
                
            end
        LLV(1, asset, window) = logL;
        end
    end
    Data.Univariate.EGARCHt.z = z;
    Data.Univariate.EGARCHt.var = var;
    Data.Univariate.EGARCHt.Params = params;
    Data.Univariate.EGARCHt.LLV = LLV;
end

