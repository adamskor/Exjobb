function [Data] = QuartPortSTARR(Data)
    Data.Results.Bench.STARR = ((1/252)*Data.Results.Bench.AveReturns./Data.Results.Bench.CVaR);
    Data.Results.BenchEQW.STARR = ((1/252)*Data.Results.BenchEQW.AveReturns./Data.Results.BenchEQW.CVaR);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.QuartSTARR = ((1/252)*Data.Results.MaxSharpe.QuartAveReturns./Data.Results.MaxSharpe.QuartCVaR);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.QuartSTARR = ((1/252)*Data.Results.MinCVaR.QuartAveReturns./Data.Results.MinCVaR.QuartCVaR);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.QuartSTARR = ((1/252)*Data.Results.MaxSTARR.QuartAveReturns./Data.Results.MaxSTARR.QuartCVaR);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.QuartSTARR = ((1/252)*Data.Results.ResMaxSharpe.QuartAveReturns./Data.Results.ResMaxSharpe.QuartCVaR);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.QuartSTARR = ((1/252)*Data.Results.ResMinCVaR.QuartAveReturns./Data.Results.ResMinCVaR.QuartCVaR);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.QuartSTARR = ((1/252)*Data.Results.ResMaxSTARR.QuartAveReturns./Data.Results.ResMaxSTARR.QuartCVaR);
    end
end

