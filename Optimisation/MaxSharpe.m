function [Data] = MaxSharpe(Data)
    Data.Optimisation.MaxSharpe.Weights = zeros(1, Data.Info.nAssets, Data.Info.nWindows);
    Data.Optimisation.MaxSharpe.CVaR = zeros(1, 1, Data.Info.nWindows);
    Data.Optimisation.MaxSharpe.VaR = zeros(1, 1, Data.Info.nWindows);
    options = optimoptions('fmincon');
    options.MaxFunctionEvaluations = 30000;
    nAssets = max(size(Data.Info.Assets));
    x0 = ones(1, nAssets)./20;
    lb = zeros(nAssets, 1);
    ub = ones(nAssets, 1);
    Aeq = ones(1, nAssets);
    beq = 1;
    for window = 1:Data.Info.nWindows
        disp(window)
        A = -(Data.BL.mu_BL(:, :, window));
        b = -Data.TimeSeries.RFrate(window);
        H = Data.Simulate.t.EGARCHt.Sigma(:,:, window);
        %fun = @(x)f(x, window, Data);
        %w = fmincon(fun,x0,A,b,Aeq,beq,lb,ub, [], options);
        w = quadprog(H,[],A,b,Aeq,beq,lb,ub,x0);
        w = w';
        x0 = w;
        Data.Optimisation.MaxSharpe.Weights(1, :, window) = w;
        Data.Optimisation.MaxSharpe.VaR(1, 1, window) = ValueatRisk(w, window, Data);
        Data.Optimisation.MaxSharpe.CVaR(1, 1, window) = CVaR_mex(w,  Data.Info.sigLevel, Data.Simulate.t.EGARCHt.r_hat(:, :, window), Data.Info.Parameters.simSampleSize);
    end
    
    function Val = f(x, window, Data)
        Val = x*Data.Simulate.t.EGARCHt.Sigma(:,:, window)*x';  
    end  
end

