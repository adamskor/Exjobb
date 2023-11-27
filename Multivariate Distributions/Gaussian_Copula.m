function [Data] = Gaussian_Copula(z, Data)
    sample_size = Data.Info.Parameters.simSampleSize;
    uniform_g = normcdf(z);
    uniform = zeros(size(z,1), size(z,2), size(z,3));
    rho = zeros(size(z,2), size(z,2), size(z,3));
    sample = zeros(sample_size, size(z,2), size(z,3));
    LLV = zeros(1, size(z,3));
    for window = 1:size(z, 3)
        for asset = 1:size(z, 2)
            %%% Avoid 0 and 1 values from cdf function
            uniform(:, asset, window) = rescale(uniform_g(:, asset, window), 0.00001, 0.99999);
        end
    end
    for window = 1:size(z, 3)
        disp(window)
        rho(:, :, window) = copulafit('Gaussian',uniform(:, : ,window));
        sample(:, :, window) = copularnd('Gaussian', rho(:, :, window), sample_size);
        Data.Copula.Gauss.eta.(strcat('Window ', num2str(window))) = norminv(sample(:, :, window));
        copula_pdf = copulapdf('Gaussian', uniform(:,: ,window), rho(:, :, window));
        LLV(:,window) = sum(log(copula_pdf));
    end
    Data.Copula.Gauss.Rho = rho;
    Data.Copula.Gauss.LLV = LLV;
    
end

