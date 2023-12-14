function [Data] = QuartpairedtTest(Data)
nStartDays = Data.Info.nStartDays;
for StartDay = 1:nStartDays
    if Data.Info.Optimisations(1)
        diffReturns = Data.Results.MaxSharpe.QuartReturns(:, StartDay) - Data.Results.Bench.Returns(1:size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3)+1, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MaxSharpe.QuartT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MaxSharpe.Quartp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(2)
        diffReturns = Data.Results.MinCVaR.QuartReturns(:, StartDay) - Data.Results.Bench.Returns(1:size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3)+1, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MinCVaR.QuartT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MinCVaR.Quartp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(3)
        diffReturns = Data.Results.MaxSTARR.QuartReturns(:, StartDay) - Data.Results.Bench.Returns(1:size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3)+1, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.MaxSTARR.QuartT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.MaxSTARR.Quartp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(4)
        diffReturns = Data.Results.ResMaxSharpe.QuartReturns(:, StartDay) - Data.Results.Bench.Returns(1:size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3)+1, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMaxSharpe.QuartT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMaxSharpe.Quartp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(5)
        diffReturns = Data.Results.ResMinCVaR.QuartReturns(:, StartDay) - Data.Results.Bench.Returns(1:size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3)+1, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMinCVaR.QuartT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMinCVaR.Quartp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
    if Data.Info.Optimisations(6)
        diffReturns = Data.Results.ResMaxSTARR.QuartReturns(:, StartDay) - Data.Results.Bench.Returns(1:size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3)+1, StartDay);
        s = std(diffReturns);
        z = mean(diffReturns);
        n = Data.Info.nWindows;
        Data.Results.ResMaxSTARR.QuartT(StartDay) = (z)/(s/sqrt(n));
        Data.Results.ResMaxSTARR.Quartp(StartDay) = (1 - tcdf(abs((z)/(s/sqrt(n))), 3752));
    end
end

    
    
    
end

