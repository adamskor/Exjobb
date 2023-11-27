function [Data] = RestrictedMaxSharpe(Data)
    Data.Optimisation.ResMaxSharpe.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.ResMaxSharpe.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.ResMaxSharpe.VaR = zeros(1, 1, Data.Info.nWindows);
    Data.Info.turnoverLimit = 0.005;
    nAssets = max(size(Data.Info.Assets));
    x0 = ones(1, nAssets)./nAssets;
    lb = zeros(nAssets, 1);
    ub = ones(nAssets, 1);
    Aeq = ones(1, nAssets);
    beq = 1;
    count = 0;
    for window = 1:Data.Info.nWindows
        disp(window)
        A = -(Data.BL.mu_BL(:, :, window));
        b = -(mean(Data.BL.mu_BL(: ,:, window)) - mean(Data.TimeSeries.MSCI(:,:,window)));
        H = Data.BL.Sigma_CBL(:, :, window);
        w = quadprog(H,[],A,b,Aeq,beq,lb,ub,x0);
        w = w';
        for asset = 1:nAssets
            ub(asset) = min(w(asset) + Data.Info.turnoverLimit, 1);
            lb(asset) = max(w(asset) - Data.Info.turnoverLimit, 0.01);
            if window < Data.Info.nWindows && ...
               (Data.BL.mu_BL(:, :, window + 1))*ub < (mean(Data.BL.mu_BL(: ,:, window + 1)) - mean(Data.TimeSeries.MSCI(:,:,window + 1)))
                count = count + 1;
            end
            while window < Data.Info.nWindows && ...
               (Data.BL.mu_BL(:, :, window + 1))*ub < (mean(Data.BL.mu_BL(: ,:, window + 1)) - mean(Data.TimeSeries.MSCI(:,:,window + 1)))
                for asset2 = 1:nAssets
                    ub(asset2) = max(min(ub(asset2) + Data.Info.minInvest, 1), 0.01);
                end
            end
        end
        Data.Optimisation.ResMaxSharpe.Weights(1, :, window) = w;
        Data.Optimisation.ResMaxSharpe.VaR(1, 1, window) = ValueatRisk(w, window, Data);
        Data.Optimisation.ResMaxSharpe.CVaR(1, 1, window) = CVaR_mex(w,  Data.Info.sigLevel, Data.BL.r_CBL(:, :, window), Data.Info.Parameters.simSampleSize);
    end
    disp(count)
end

