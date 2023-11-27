function Data = RestrictedMaxSTARR(Data)
    Data.Optimisation.ResMaxSTARR.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.ResMaxSTARR.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.ResMaxSTARR.VaR = zeros(1, 1, Data.Info.nWindows);
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
        [w, fval]=linprog(c,A,b,Aeq,beq,lb,ub);
        for asset = 1:Data.Info.nAssets
            ub(asset) = min(w(asset) + Data.Info.turnoverLimit, 1);
            lb(asset) = max(w(asset) - Data.Info.turnoverLimit, 0.01);
           while window < Data.Info.nWindows && ...
               (Data.BL.mu_BL(:, :, window + 1))*ub(1:Data.Info.nAssets) < (mean(Data.BL.mu_BL(: ,:, window + 1)) - mean(Data.TimeSeries.MSCI(:,:,window + 1)))
                for asset2 = 1:Data.Info.nAssets
                    ub(asset2) = max(min(ub(asset2) + Data.Info.minInvest, 1), 0.01);
                end
            end
        end
        Data.Optimisation.ResMaxSTARR.CVaR(1, 1, window) = fval;
        Data.Optimisation.ResMaxSTARR.Weights(1, :, window) = w(1:n)';
        Data.Optimisation.ResMaxSTARR.VaR(1, 1, window) = w(n + 1);
    end
    
    
end
