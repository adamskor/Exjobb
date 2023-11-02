function [rho, eta_Gauss] = Gaussian_Copula(data)
    sample_size = 10000;
    z = data.z_EGARCH_t;
    uniform = zeros(size(z));
    eta_Gauss = zeros(sample_size, size(z, 2));
    for asset = 1:size(z, 2)
        uniform(:, asset) = ksdensity(z(:, asset), z(:, asset), 'function', 'cdf');
    end
    [rho] = copulafit('Gaussian',uniform);
    sample = copularnd('Gaussian', rho, 10000);
    for asset = 1:size(z, 2)
        eta_Gauss(:, asset) = ksdensity(z(:, asset), sample(:, asset), 'function', 'icdf');
    end
end

