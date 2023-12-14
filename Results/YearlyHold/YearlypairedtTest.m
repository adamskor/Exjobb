function [Data] = YearlypairedtTest(Data)
nStartDays = Data.Info.nStartDays;
for StartDay = 1:nStartDays
    if Data.Info.Optimisations(1)
        diffReturns = Data.Results.MaxSharpe.YearlyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MaxSharpe.YearlyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MaxSharpe.Yearlyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(2)
        diffReturns = Data.Results.MinCVaR.YearlyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MinCVaR.YearlyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MinCVaR.Yearlyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(3)
        diffReturns = Data.Results.MaxSTARR.YearlyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MaxSTARR.YearlyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MaxSTARR.Yearlyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(4)
        diffReturns = Data.Results.ResMaxSharpe.YearlyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMaxSharpe.YearlyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMaxSharpe.Yearlyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(5)
        diffReturns = Data.Results.ResMinCVaR.YearlyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMinCVaR.YearlyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMinCVaR.Yearlyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(6)
        diffReturns = Data.Results.ResMaxSTARR.YearlyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMaxSTARR.YearlyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMaxSTARR.Yearlyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
end

    
    
    
end

