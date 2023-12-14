function [Data] = WeeklyPortSTARR(Data)
    Data.Results.Bench.STARR = ((1/252)*Data.Results.Bench.AveReturns./Data.Results.Bench.CVaR);
    Data.Results.BenchEQW.STARR = ((1/252)*Data.Results.BenchEQW.AveReturns./Data.Results.BenchEQW.CVaR);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.WeeklySTARR = ((1/252)*Data.Results.MaxSharpe.WeeklyAveReturns./Data.Results.MaxSharpe.WeeklyCVaR);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.WeeklySTARR = ((1/252)*Data.Results.MinCVaR.WeeklyAveReturns./Data.Results.MinCVaR.WeeklyCVaR);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.WeeklySTARR = ((1/252)*Data.Results.MaxSTARR.WeeklyAveReturns./Data.Results.MaxSTARR.WeeklyCVaR);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.WeeklySTARR = ((1/252)*Data.Results.ResMaxSharpe.WeeklyAveReturns./Data.Results.ResMaxSharpe.WeeklyCVaR);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.WeeklySTARR = ((1/252)*Data.Results.ResMinCVaR.WeeklyAveReturns./Data.Results.ResMinCVaR.WeeklyCVaR);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.WeeklySTARR = ((1/252)*Data.Results.ResMaxSTARR.WeeklyAveReturns./Data.Results.ResMaxSTARR.WeeklyCVaR);
    end
end

