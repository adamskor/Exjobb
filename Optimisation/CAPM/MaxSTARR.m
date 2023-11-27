function Data = MaxSTARR(Data)
    Data.Optimisation.MaxSTARR.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.MaxSTARR.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.MaxSTARR.VaR = zeros(1, 1, Data.Info.nWindows);
    for window = 1:Data.Info.nWindows
        disp(window)
        S= Data.Info.Parameters.simSampleSize;
        n= Data.Info.nAssets;
        rets = Data.BL.r_CBL(:, :, window);
        mu = Data.BL.mu_BL(: ,:, window);
        alpha = Data.Info.sigLevel;
        lb = [ones(n,1)*0.01;-100;zeros(S,1)];
        ub = ones(size(lb));
        A = [-mu zeros(1,S+1)];
        b = -(mean(mu) - mean(Data.TimeSeries.MSCI(:,:,window)));
        Aeq = [ones(1,n) zeros(1,S+1)];
        beq = 1;
        c = [zeros(1,n) 1 ones(1,S)/(S*(1-alpha))];
        A = [A;-rets -ones(S,1) -eye(S)];
        b = [b; zeros(S,1)];
        [x, fval]=linprog(c,A,b,Aeq,beq,lb,ub);
        Data.Optimisation.MaxSTARR.CVaR(1, 1, window) = fval;
        Data.Optimisation.MaxSTARR.Weights(1, :, window) = x(1:n)';
        Data.Optimisation.MaxSTARR.VaR(1, 1, window) = x(n + 1);
    end
    
    
end
