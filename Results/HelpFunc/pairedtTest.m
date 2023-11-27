function [Data] = pairedtTest(Data)
if Data.Info.Optimisations(1)
    diffReturns = Data.Results.MaxSharpe.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.MaxSharpe.T = (z)/(s/sqrt(n));
    Data.Results.MaxSharpe.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
end
if Data.Info.Optimisations(2)
    diffReturns = Data.Results.MinCVaR.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.MinCVaR.T = (z)/(s/sqrt(n));
    Data.Results.MinCVaR.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
end
if Data.Info.Optimisations(3)
    diffReturns = Data.Results.MaxSTARR.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.MaxSTARR.T = (z)/(s/sqrt(n));
    Data.Results.MaxSTARR.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
end
if Data.Info.Optimisations(4)
    diffReturns = Data.Results.ResMaxSharpe.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.ResMaxSharpe.T = (z)/(s/sqrt(n));
    Data.Results.ResMaxSharpe.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
end
if Data.Info.Optimisations(5)
    diffReturns = Data.Results.ResMinCVaR.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.ResMinCVaR.T = (z)/(s/sqrt(n));
    Data.Results.ResMinCVaR.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
end
if Data.Info.Optimisations(6)
    diffReturns = Data.Results.ResMaxSTARR.Returns - Data.Results.Bench.Returns;
    s = std(diffReturns);
    z = mean(diffReturns);
    n = Data.Info.nWindows;
    Data.Results.ResMaxSTARR.T = (z)/(s/sqrt(n));
    Data.Results.ResMaxSTARR.p = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
end


    
    
    
end

