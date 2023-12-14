function [Data] = WeeklyPortSTD(Data)
    Data.Results.Bench.STD = std(Data.Results.Bench.Returns)*sqrt(252);
    Data.Results.BenchEQW.STD = std(Data.Results.BenchEQW.Returns)*sqrt(252);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.WeeklySTD = std(Data.Results.MaxSharpe.WeeklyReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.WeeklySTD = std(Data.Results.MinCVaR.WeeklyReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.WeeklySTD = std(Data.Results.MaxSTARR.WeeklyReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.WeeklySTD = std(Data.Results.ResMaxSharpe.WeeklyReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.WeeklySTD = std(Data.Results.ResMinCVaR.WeeklyReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.WeeklySTD = std(Data.Results.ResMaxSTARR.WeeklyReturns)*sqrt(252);
    end
   
end

