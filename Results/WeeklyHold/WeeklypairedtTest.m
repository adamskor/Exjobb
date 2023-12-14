function [Data] = WeeklypairedtTest(Data)
nStartDays = Data.Info.nStartDays;
for StartDay = 1:nStartDays
    if Data.Info.Optimisations(1)
        diffReturns = Data.Results.MaxSharpe.WeeklyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MaxSharpe.WeeklyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MaxSharpe.Weeklyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(2)
        diffReturns = Data.Results.MinCVaR.WeeklyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MinCVaR.WeeklyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MinCVaR.Weeklyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(3)
        diffReturns = Data.Results.MaxSTARR.WeeklyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MaxSTARR.WeeklyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MaxSTARR.Weeklyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(4)
        diffReturns = Data.Results.ResMaxSharpe.WeeklyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMaxSharpe.WeeklyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMaxSharpe.Weeklyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(5)
        diffReturns = Data.Results.ResMinCVaR.WeeklyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMinCVaR.WeeklyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMinCVaR.Weeklyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(6)
        diffReturns = Data.Results.ResMaxSTARR.WeeklyReturns(:, StartDay) - Data.Results.Bench.Returns(:, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMaxSTARR.WeeklyT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMaxSTARR.Weeklyp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
end

    
    
    
end

