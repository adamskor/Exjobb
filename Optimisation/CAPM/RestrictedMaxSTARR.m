function Data = RestrictedMaxSTARR(Data)
    Data.Optimisation.ResMaxSTARR.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.ResMaxSTARR.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.ResMaxSTARR.VaR = zeros(1, 1, Data.Info.nWindows);
    x = zeros(Data.Info.Parameters.simSampleSize + Data.Info.nAssets +1 ,Data.Info.nWindows);
    fval = zeros(1, Data.Info.nWindows);
    S= Data.Info.Parameters.simSampleSize;
    n= Data.Info.nAssets;
    lb = [ones(n,1)*0.01;-100;zeros(S,1)];
    ub = ones(size(lb));
    Data.Info.turnoverLimit = 0.005;
    %%Data.Info.turnoverLimit = 0.01; Kom ihåg Adam
    prevcount = 0;
    succount = 0;
    for window = 1:Data.Info.nWindows
        disp(window)
        rets = Data.BL.r_CBL(:, :, window);
        mu = Data.BL.mu_BL(: ,:, window);
        alpha = Data.Info.sigLevel;
        A = [-mu zeros(1,S+1)];
        b = -(mean(mu) - mean(Data.TimeSeries.MSCI(:,:,window)));
        Aeq = [ones(1,n) zeros(1,S+1)];
        beq = 1;
        c = [zeros(1,n) 1 ones(1,S)/(S*(1-alpha))];
        A = [A;-rets -ones(S,1) -eye(S)];
        b = [b; zeros(S,1)];
        if window > 1
                for asset = 1:Data.Info.nAssets
                    ub(asset) = min(max(x(asset, window - 1), 0.01), 1);
                    lb(asset) = max(x(asset, window - 1), 0.01);
                end
        end
        for i = 1:10

           for asset = 1:Data.Info.nAssets
                    ub(asset) = min(max(ub(asset) + Data.Info.turnoverLimit, 0.01), 1);
                    lb(asset) = max(lb(asset) - Data.Info.turnoverLimit, 0.01);
           end

            [w, f]=linprog(c,A,b,Aeq,beq,lb,ub);
            if max(size(w)) < 1
                prevcount = prevcount + 1;
                x(1:n, window) = x(1:n, window - 1);
                fval(window) = fval(window - 1);
                Data.Optimisation.ResMaxSTARR.CVaR(1, 1, window) = Data.Optimisation.ResMaxSTARR.CVaR(1, 1, window - 1);
                Data.Optimisation.ResMaxSTARR.Weights(1, :, window) = Data.Optimisation.ResMaxSTARR.Weights(1, :, window - 1);
                Data.Optimisation.ResMaxSTARR.VaR(1, 1, window) = Data.Optimisation.ResMaxSTARR.VaR(1, 1, window - 1);
            else
                x(1:n, window) = w(1:n);
                fval(window) = f;
                Data.Optimisation.ResMaxSTARR.CVaR(1, 1, window) = fval(window);
                Data.Optimisation.ResMaxSTARR.Weights(1, :, window) = x(1:n, window)';
                Data.Optimisation.ResMaxSTARR.VaR(1, 1, window) = x(n + 1, window);
                succount = succount + 1;
                disp(succount)
                break
            end 
        end
        disp(Data.Optimisation.ResMaxSTARR.Weights(1, :, window))
    end
    disp(succount)
end
