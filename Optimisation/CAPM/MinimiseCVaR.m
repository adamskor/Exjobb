function Data = MinimiseCVaR(Data)
    Data.Optimisation.MinCVaR.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.MinCVaR.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.MinCVaR.VaR = zeros(1, 1, Data.Info.nWindows);
    for window = 1:Data.Info.nWindows
        disp(window)
        S= Data.Info.Parameters.simSampleSize;
        n= Data.Info.nAssets;
        rets = Data.BL.r_CBL(:, :, window);
        mu = Data.BL.mu_BL(: ,:, window);
        alpha = Data.Info.sigLevel;
        lb = [ones(n,1)*0.01;-100;zeros(S,1)];
        ub = ones(size(lb));
        A= [-mu zeros(1,S+1)];
        b= 1;
        Aeq = [ones(1,n) zeros(1,S+1)];
        beq = 1;
        A=[A;-rets -ones(S,1) -eye(S)];
        b=[b;zeros(S,1)];
        c=[zeros(1,n) 1 ones(1,S)/(S*(1-alpha))];
        [x, fval]=linprog(c,A,b,Aeq,beq,lb,ub);
        Data.Optimisation.MinCVaR.CVaR(1, 1, window) = fval;
        Data.Optimisation.MinCVaR.Weights(1, :, window) = x(1:n)';
        Data.Optimisation.MinCVaR.VaR(1, 1, window) = x(n + 1);
    end
    
    
end

