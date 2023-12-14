function [Data] = MaxSharpe(Data)
    Data.Optimisation.MaxSharpe.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.MaxSharpe.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.MaxSharpe.VaR = zeros(1, 1, Data.Info.nWindows);
    nAssets = max(size(Data.Info.Assets));
    lb = ones(nAssets, 1)*0.01;
    ub = ones(nAssets, 1);
    Aeq = ones(1, nAssets);
    beq = 1;
    for window = 1:Data.Info.nWindows
        disp(window)
        A = -(Data.BL.mu_BL(:, :, window));
        b = -(mean(Data.BL.mu_BL(: ,:, window)) - mean(Data.TimeSeries.MSCI(:,:,window)));
        H = Data.BL.Sigma_CBL(:, :, window);
        w = quadprog(H,[],A,b,Aeq,beq,lb,ub);
        w = w';
        Data.Optimisation.MaxSharpe.Weights(1, :, window) = w;
        Data.Optimisation.MaxSharpe.VaR(1, 1, window) = ValueatRisk(w, window, Data);
        Data.Optimisation.MaxSharpe.CVaR(1, 1, window) = CVaR_mex(w,  Data.Info.sigLevel, Data.BL.r_CBL(:, :, window), Data.Info.Parameters.simSampleSize);
    end
end

