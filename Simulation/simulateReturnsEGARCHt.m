function [r, Sigma] = simulateReturnsEGARCHt(eta, params, Data)
    sample_size = Data.Info.Parameters.simSampleSize;
    sample_size = 4752;
    r = zeros(sample_size, size(eta, 2), size(eta, 3));
    for window = 1:size(eta, 3)
        var = zeros(1, sample_size);
        eps = zeros(1, sample_size);
        for asset = 1:size(eta, 2)
            var(1) = 0.05;
            eps(1) = sqrt(var(1))*eta(1, asset, window);
            r(1, asset, window) = params(6, asset, window) + eps(1);
            for i = 2:sample_size
                var(i) = exp( params(1, asset, window) + params(3, asset, window)*(log(var(i-1))) + ...
                         params(4, asset, window)*((eps(i-1)))/sqrt(var(i-1)) + ...
                         params(2, asset, window)*((abs(eps(i-1)))/sqrt(var(i-1)) - ...
                         sqrt((params(5, asset, window) - 2)/ pi)*(gamma((params(5, asset, window) - 1)/2)/gamma((params(5, asset, window))/2))));
                eps(i) = sqrt(var(i))*eta(i, asset, window);
                r(i, asset, window) = params(6, asset, window) + eps(i);
                params(6, asset, window) + eps(i);
            end
        end
    end
    Sigma = cov(r);
end

