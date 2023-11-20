function Data = MaxSTARR(Data)
    Data.Optimisation.MaxSTARR.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.MaxSTARR.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.MaxSTARR.VaR = zeros(1, 1, Data.Info.nWindows);
    for window = 1:Data.Info.nWindows
        disp(window)
        S= Data.Info.Parameters.simSampleSize;
        n= Data.Info.nAssets;
        rets = Data.Simulate.t.EGARCHt.r_hat(:, :, window);
        mu = Data.BL.mu_BL(: ,:, window);
        alpha = Data.Info.sigLevel;
        %first 50 vars are x, next one is gamma, last 210 are z
        lb = [zeros(n,1);-100;zeros(S,1)];

        %add the expected return constraint, no restriction, find min risk
        A = [-mu zeros(1,S+1)];
        b = -Data.TimeSeries.RFrate(window);

        %constrain weights to sum to 1
        Aeq = [ones(1,n) zeros(1,S+1)];
        beq = 1;
        
        %the objective
        c = [zeros(1,n) 1 ones(1,S)/(S*(1-alpha))];
        
        %add the Z constraints
        A = [A;-rets -ones(S,1) -eye(S)];
        b = [b; zeros(S,1)];
        %b=[b;0.1*ones(S,1)];

        

        %solve, pass empty matrices for f, A, b, and ub
        [x, fval]=linprog(c,A,b,Aeq,beq,lb,[]);
        Data.Optimisation.MaxSTARR.CVaR(1, 1, window) = fval;
        Data.Optimisation.MaxSTARR.Weights(1, :, window) = x(1:20)';
        Data.Optimisation.MaxSTARR.VaR(1, 1, window) = x(21);
    end
    
    
end
