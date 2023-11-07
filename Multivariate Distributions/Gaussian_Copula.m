function [Data] = Gaussian_Copula(z, Data)
    count = 1;
    sample_size = Data.Info.Parameters.simSampleSize;
    uniform = normcdf(z);
    rho = zeros(size(z,2), size(z,2), size(z,3));
    sample = zeros(sample_size, size(z,2), size(z,3));
    for window = 1:size(z, 3)
        for row = 1:size(z,1)
            for col = 1:size(z,2)
                if uniform(row, col, window) == 1
                    uniform(row, col, window) = 0.9999999999999999;
                    count = count + 1;
                end
            end
        end
    end
    for window = 1:size(z, 3)
        rho(:, :, window) = copulafit('Gaussian',uniform(:, : ,window));
        sample(:, :, window) = copularnd('Gaussian', rho(:, :, window), sample_size);
    end
    Data.Copula.Gauss.Rho = rho;
    Data.Copula.Gauss.eta = norminv(sample);
end

