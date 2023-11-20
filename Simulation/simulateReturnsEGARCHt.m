function [r, Sigma] = simulateReturnsEGARCHt(eta, params, Data)
    sample_size = Data.Info.Parameters.simSampleSize;
    r = zeros(sample_size, Data.Info.nAssets, Data.Info.nWindows);
    Sigma = zeros(Data.Info.nAssets, Data.Info.nAssets, Data.Info.nWindows);
    for window = 1:Data.Info.nWindows
        disp(window)
        eta = Data.Copula.t.eta.(strcat('Window ', num2str(window)));
        var = Data.Univariate.EGARCHt.var(end, :, window);
        eps = Data.TimeSeries.eps(end, :, window);
        var_next = zeros(1, size(eta, 2));
        for asset = 1:size(eta, 2)
            var_next(asset) = exp( params(1, asset, window) + params(3, asset, window)*(log(var(asset))) + ...
                     params(4, asset, window)*((eps(asset)))/sqrt(var(asset)) + ...
                     params(2, asset, window)*((abs(eps(asset)))/sqrt(var(asset)) - ...
                     sqrt((params(5, asset, window) - 2)/ pi)*(gamma((params(5, asset, window) - 1)/2)/gamma((params(5, asset, window))/2))));
            eps_next = sqrt(var_next(asset))*eta(:, asset);
            r(:, asset, window) = params(6, asset, window) + eps_next;
            
        end
        Sigma(:, :, window) = cov(r(:, :, window));
    end
    
end

