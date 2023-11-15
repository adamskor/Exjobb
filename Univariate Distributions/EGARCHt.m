function [Data] = EGARCHt(returns, eps, Data)
    z = zeros(size(returns,1), size(returns,2), size(returns,3));
    var = zeros(size(returns,1), size(returns,2), size(returns,3));
    LLV = zeros(1, size(returns,2), size(returns,3));
    params = zeros(6, size(returns,2), size(returns,3));
    N = size(returns,1);
    for window = 1:size(returns, 3)
        disp(window)
        for asset = 1:size(returns, 2)
            %mu = mean(returns(:,asset,window));
            %options  =  optimset('fmincon');
            %options  =  optimset(options , 'Display'     , 'off');
            %[parameters, LL] = egarch_mfe(returns(:,asset,window), 1, 1, 1, 'STUDENTST', [], options);
            %params(:, asset, window) = [parameters(1), parameters(2), parameters(4), parameters(3), parameters(5), mu];
            params(:, asset, window) = Data.Univariate.EGARCHt.Params(:, asset, window);
            var(1, asset, window)= sum(returns(:,asset, window).^2)/N;
            for i=2:N  
                var(i, asset, window) = exp( params(1, asset, window) + params(3, asset, window)*(log(var(i-1))) + ...
                         params(4, asset, window)*((eps(i-1, asset, window)))/sqrt(var(i-1)) + ...
                         params(2, asset, window)*((abs(eps(i-1, asset, window)))/sqrt(var(i-1)) - ...
                         sqrt((params(5, asset, window) - 2)/ pi)*(gamma((params(5, asset, window) - 1)/2)/gamma((params(5, asset, window))/2))));
                z(:, asset, window) = (eps(:, asset, window))./sqrt(var(:,asset, window));
                %var(i, asset, window)
            end
            %LLV(1, asset, window) = LL;
        end
    end
    Data.Univariate.EGARCHt.z = z;
    Data.Univariate.EGARCHt.var = var;
    %Data.Univariate.EGARCHt.Params = params;
    %Data.Univariate.EGARCHt.LLV = LLV;
end

