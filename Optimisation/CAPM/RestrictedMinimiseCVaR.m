function Data = RestrictedMinimiseCVaR(Data)
    Data.Optimisation.ResMinCVaR.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.ResMinCVaR.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.ResMinCVaR.VaR = zeros(1, 1, Data.Info.nWindows);
    n= Data.Info.nAssets;
    S= Data.Info.Parameters.simSampleSize;
    lb=[ones(n,1)*0.01;-100;zeros(S,1)];
    ub = ones(size(lb));
    x = zeros(Data.Info.Parameters.simSampleSize + Data.Info.nAssets +1 ,Data.Info.nWindows);
    fval = zeros(1, Data.Info.nWindows);
    count = 0;
    for window = 1:Data.Info.nWindows
        disp(window)
        rets = Data.BL.r_CBL(:, :, window);
        mu = Data.BL.mu_BL(: ,:, window);
        alpha = Data.Info.sigLevel;
        A= [-mu zeros(1,S+1)];
        b= 1;
        Aeq = [ones(1,n) zeros(1,S+1)];
        beq = 1;
        A=[A;-rets -ones(S,1) -eye(S)];
        b=[b;zeros(S,1)];
        c=[zeros(1,n) 1 ones(1,S)/(S*(1-alpha))];
        if window > 1
                for asset = 1:Data.Info.nAssets
                    ub(asset) = min(max(x(asset, window - 1) + Data.Info.turnoverLimit, 0.01), 1);
                    lb(asset) = max(x(asset, window - 1) - Data.Info.turnoverLimit, 0.01);
                end
        end
        for i = 1:4

           for asset = 1:Data.Info.nAssets
                    ub(asset) = min(max(ub(asset) + Data.Info.turnoverLimit, 0.01), 1);
                    lb(asset) = max(lb(asset) - Data.Info.turnoverLimit, 0.01);
           end
            

            [w, f]=linprog(c,A,b,Aeq,beq,lb,ub);
            if max(size(w)) < 1
                prevcount = prevcount + 1;
                x(1:n, window) = x(1:n, window - 1);
                fval(window) = fval(window - 1);
                Data.Optimisation.ResMinCVaR.CVaR(1, 1, window) = Data.Optimisation.ResMinCVaR.CVaR(1, 1, window - 1);
                Data.Optimisation.ResMinCVaR.Weights(1, :, window) = Data.Optimisation.ResMinCVaR.Weights(1, :, window - 1);
                Data.Optimisation.ResMinCVaR.VaR(1, 1, window) = Data.Optimisation.ResMinCVaR.VaR(1, 1, window - 1);
                disp(prevcount)
            else
                x(1:n, window) = w(1:n);
                fval(window) = f;
                Data.Optimisation.ResMinCVaR.CVaR(1, 1, window) = fval(window);
                Data.Optimisation.ResMinCVaR.Weights(1, :, window) = x(1:n, window)';
                Data.Optimisation.ResMinCVaR.VaR(1, 1, window) = x(n + 1, window);
                break
            end
        end
        disp(Data.Optimisation.ResMinCVaR.Weights(1, :, window))
    end   
end

