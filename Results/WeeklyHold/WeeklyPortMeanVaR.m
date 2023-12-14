function [Data] = WeeklyPortMeanVaR(Data)
    Data.Results.Bench.meanVaR = ((1/252)*Data.Results.Bench.AveReturns./Data.Results.Bench.VaR);
    Data.Results.BenchEQW.meanVaR = ((1/252)*Data.Results.BenchEQW.AveReturns./Data.Results.BenchEQW.VaR);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.WeeklymeanVaR = ((1/252)*Data.Results.MaxSharpe.WeeklyAveReturns./Data.Results.MaxSharpe.WeeklyVaR);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.WeeklymeanVaR = ((1/252)*Data.Results.MinCVaR.WeeklyAveReturns./Data.Results.MinCVaR.WeeklyVaR);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.WeeklymeanVaR = ((1/252)*Data.Results.MaxSTARR.WeeklyAveReturns./Data.Results.MaxSTARR.WeeklyVaR);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.WeeklymeanVaR = ((1/252)*Data.Results.ResMaxSharpe.WeeklyAveReturns./Data.Results.ResMaxSharpe.WeeklyVaR);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.WeeklymeanVaR = ((1/252)*Data.Results.ResMinCVaR.WeeklyAveReturns./Data.Results.ResMinCVaR.WeeklyVaR);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.WeeklymeanVaR = ((1/252)*Data.Results.ResMaxSTARR.WeeklyAveReturns./Data.Results.ResMaxSTARR.WeeklyVaR);
    end
end

