function Data = MinimiseCVaR(Data)
    Data.Optimisation.MinCVaR.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.MinCVaR.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.MinCVaR.VaR = zeros(1, 1, Data.Info.nWindows);
    for window = 1:Data.Info.nWindows
        disp(window)
        S= Data.Info.Parameters.simSampleSize;
        n= Data.Info.nAssets;
        rets = Data.Simulate.t.EGARCHt.r_hat(:, :, window);
        mu = Data.BL.mu_BL(: ,:, window);
        alpha = Data.Info.sigLevel;
        
        lb=[zeros(n,1);-100;zeros(S,1)];

        %add the expected return constraint, no restriction, find min risk
        A=[-mu zeros(1,S+1)];
        b=100;

        %constrain weights to sum to 1
        Aeq=[ones(1,n) zeros(1,S+1)];
        beq=1;

        %add the Z constraints
        A=[A;-rets -ones(S,1) -eye(S)];
        b=[b;zeros(S,1)];

        %the objective
        c=[zeros(1,n) 1 ones(1,S)/(S*(1-alpha))];

        %solve, pass empty matrices for f, A, b, and ub
        [x, fval]=linprog(c,A,b,Aeq,beq,lb,[]);
        Data.Optimisation.MinCVaR.CVaR(1, 1, window) = fval;
        Data.Optimisation.MinCVaR.Weights(1, :, window) = x(1:20)';
        Data.Optimisation.MinCVaR.VaR(1, 1, window) = x(21);
    end
    
    
end

