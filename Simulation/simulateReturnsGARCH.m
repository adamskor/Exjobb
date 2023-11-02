function [returns_sim_GARCH_G_C_t] = simulateReturnsGARCH(Data)
    sample_size = 10000;
    eta = Data.eta_Gauss;
    params = Data.params_GARCH_G;
    returns_sim_GARCH_G_C_t = zeros(size(eta));
    var = zeros(1, sample_size);
    eps = zeros(1, sample_size);
    for asset = 1:size(eta, 2)
        var(1) = 0.004;
        eps(1) = sqrt(var(1))*eta(1,asset);
        r(1) = params(5) + eps(1);
        for i = 2:sample_size
            var(i) = params(1, asset) + params(2, asset)*(eps(i-1))^2 + params(3, asset)*var(i-1);
            eps(i) = sqrt(var(i))*eta(i, asset);
            r(i) = params(4) + eps(i);
        end
        returns_sim_GARCH_G_C_t(:, asset) = r;
    end
end

