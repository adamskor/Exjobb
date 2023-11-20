function [Data] = ReturnsCBL(Data)
mu_CBL = Data.BL.mu_BL;
Sigma_CBL = Data.Simulate.t.EGARCHt.Sigma;
r_CBL = zeros(Data.Info.Parameters.simSampleSize, Data.Info.nAssets, Data.Info.nWindows);
for window = 1:size(Data.BL.mu_BL, 3)
    eta = Data.Copula.t.eta.(strcat('Window ', num2str(window)));
    for asset = 1:size(Data.BL.mu_BL, 2)
        r_CBL(:, asset, window) = mu_CBL(:, asset, window) + sqrt((Sigma_CBL(asset, asset, window)))*eta(:, asset);
    end
end
Data.BL.r_CBL = r_CBL;
end

