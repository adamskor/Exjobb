function [Data] = pairedtTest(Data)
nStartDays = Data.Info.nStartDays;
for StartDay = 1:nStartDays
    if Data.Info.Optimisations(1)
        diffReturns = Data.Results.MaxSharpe.Returns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MaxSharpe.T(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MaxSharpe.p(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(2)
        diffReturns = Data.Results.MinCVaR.Returns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MinCVaR.T(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MinCVaR.p(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(3)
        diffReturns = Data.Results.MaxSTARR.Returns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MaxSTARR.T(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MaxSTARR.p(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(4)
        diffReturns = Data.Results.ResMaxSharpe.Returns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMaxSharpe.T(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMaxSharpe.p(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(5)
        diffReturns = Data.Results.ResMinCVaR.Returns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMinCVaR.T(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMinCVaR.p(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(6)
        diffReturns = Data.Results.ResMaxSTARR.Returns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMaxSTARR.T(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMaxSTARR.p(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
end

    
    
    
end

