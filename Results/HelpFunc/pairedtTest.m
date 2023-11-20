function [Data] = pairedtTest(Data)
    diffReturns = Data.Results.MaxSTARR.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.MaxSTARR.T = (z)/(s/sqrt(n));
    Data.Results.MaxSTARR.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    
    diffReturns = Data.Results.MaxSharpe.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.MaxSharpe.T = (z)/(s/sqrt(n));
    Data.Results.MaxSharpe.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    
    diffReturns = Data.Results.ConMaxSTARR.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.ConMaxSTARR.T = (z)/(s/sqrt(n));
    Data.Results.ConMaxSTARR.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    
    diffReturns = Data.Results.ConMaxSharpe.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.ConMaxSharpe.T = (z)/(s/sqrt(n));
    Data.Results.ConMaxSharpe.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    
    diffReturns = Data.Results.MinCVaR.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.MinCVaR.T = (z)/(s/sqrt(n));
    Data.Results.MinCVaR.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    
end

