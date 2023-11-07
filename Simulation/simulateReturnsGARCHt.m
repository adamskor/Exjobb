function [r] = simulateReturnsGARCHt(eta, params, Data)
    sample_size = Data.Info.Parameters.simSampleSize;
    r = zeros(sample_size, size(eta, 2), size(eta, 3));
    for window = 1:size(eta, 3)
        var = zeros(1, sample_size);
        eps = zeros(1, sample_size);
        for asset = 1:size(eta, 2)
            var(1) = 0.004;
            eps(1) = sqrt(var(1))*eta(1, asset, window);
            r(1, asset, window) = params(6, asset, window) + eps(1);
            for i = 2:sample_size
                var(i) = params(1, asset, window) + params(2, asset, window)*(eps(i-1))^2 + params(3, asset, window)*var(i-1);
                eps(i) = sqrt(var(i))*eta(i, asset, window);
                r(i, asset, window) = params(6) + eps(i);
            end
        end
    end
    %Data.Simulate.r = r;
end

