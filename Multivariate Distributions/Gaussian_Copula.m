function [rho, eta_Gauss] = Gaussian_Copula(data)
    count = 1;
    sample_size = 10000;
    z = data.z_GARCH_G;
    uniform = normcdf(z);
    for row = 1:size(z,1)
        for col = 1:size(z,2)
            if uniform(row, col) == 1
                uniform(row, col) = 0.9999999999999999;
                count = count + 1;
            end
        end
    end
    [rho] = copulafit('Gaussian',uniform);
    sample = copularnd('Gaussian', rho, sample_size);
    eta_Gauss = norminv(sample);
    disp(count)
end

