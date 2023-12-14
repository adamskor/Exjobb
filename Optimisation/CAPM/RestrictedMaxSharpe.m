function [Data] = RestrictedMaxSharpe(Data)
    Data.Optimisation.ResMaxSharpe.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.ResMaxSharpe.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.ResMaxSharpe.VaR = zeros(1, 1, Data.Info.nWindows);
    nAssets = max(size(Data.Info.Assets));
    lb = 0.01*ones(nAssets, 1);
    ub = ones(nAssets, 1);
    Aeq = ones(1, nAssets);
    beq = 1;
    concount = 0;
    prevcount = 0;
    Data.Info.turnoverLimit = 0.001;
    for window = 1:Data.Info.nWindows
        A = -(Data.BL.mu_BL(:, :, window));
        b = -(mean(Data.BL.mu_BL(: ,:, window)) - mean(Data.TimeSeries.MSCI(:,:,window)));
        H = Data.BL.Sigma_CBL(:, :, window);
        disp(window)
        
        if window > 1
            for asset = 1:Data.Info.nAssets
                ub(asset) = min(max(w(asset), 0.01), 1);
                lb(asset) = max(w(asset), 0.01);
            end
        end
        for i =1:10
            for asset = 1:Data.Info.nAssets
                    ub(asset) = min(max(ub(asset) + Data.Info.turnoverLimit, 0.01), 1);
                    lb(asset) = max(lb(asset) - Data.Info.turnoverLimit, 0.01);
            end
            [w, ~, exitflag]  = quadprog(H,[],A,b,Aeq,beq,lb,ub);
            if max(size(w)) < 1
                prevcount = prevcount + 1;
                w = Data.Optimisation.ResMaxSharpe.Weights(1, :, window-1);
                Data.Optimisation.ResMaxSharpe.Weights(1, :, window) = Data.Optimisation.ResMaxSharpe.Weights(1, :, window-1);
                Data.Optimisation.ResMaxSharpe.VaR(1, 1, window) = Data.Optimisation.ResMaxSharpe.VaR(1, 1, window - 1);
                Data.Optimisation.ResMaxSharpe.CVaR(1, 1, window) = Data.Optimisation.ResMaxSharpe.CVaR(1, 1, window - 1);
                w = w';
                disp(prevcount)
            else
                w = w';
                Data.Optimisation.ResMaxSharpe.Weights(1, :, window) = w;
                Data.Optimisation.ResMaxSharpe.VaR(1, 1, window) = ValueatRisk(w, window, Data);
                Data.Optimisation.ResMaxSharpe.CVaR(1, 1, window) = CVaR_mex(w,  Data.Info.sigLevel, Data.BL.r_CBL(:, :, window), Data.Info.Parameters.simSampleSize);
                break
            end
        end
    end
    disp(concount)
    disp(prevcount)
end

