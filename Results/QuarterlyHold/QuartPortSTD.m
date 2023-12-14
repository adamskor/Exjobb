function [Data] = QuartPortSTD(Data)
    Data.Results.Bench.STD = std(Data.Results.Bench.Returns)*sqrt(252);
    Data.Results.BenchEQW.STD = std(Data.Results.BenchEQW.Returns)*sqrt(252);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.QuartSTD = std(Data.Results.MaxSharpe.QuartReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.QuartSTD = std(Data.Results.MinCVaR.QuartReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.QuartSTD = std(Data.Results.MaxSTARR.QuartReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.QuartSTD = std(Data.Results.ResMaxSharpe.QuartReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.QuartSTD = std(Data.Results.ResMinCVaR.QuartReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.QuartSTD = std(Data.Results.ResMaxSTARR.QuartReturns)*sqrt(252);
    end
   
end

