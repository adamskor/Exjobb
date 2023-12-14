function [Data] = QuartPortMeanVaR(Data)
    Data.Results.Bench.meanVaR = ((1/252)*Data.Results.Bench.AveReturns./Data.Results.Bench.VaR);
    Data.Results.BenchEQW.meanVaR = ((1/252)*Data.Results.BenchEQW.AveReturns./Data.Results.BenchEQW.VaR);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.QuartmeanVaR = ((1/252)*Data.Results.MaxSharpe.QuartAveReturns./Data.Results.MaxSharpe.QuartVaR);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.QuartmeanVaR = ((1/252)*Data.Results.MinCVaR.QuartAveReturns./Data.Results.MinCVaR.QuartVaR);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.QuartmeanVaR = ((1/252)*Data.Results.MaxSTARR.QuartAveReturns./Data.Results.MaxSTARR.QuartVaR);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.QuartmeanVaR = ((1/252)*Data.Results.ResMaxSharpe.QuartAveReturns./Data.Results.ResMaxSharpe.QuartVaR);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.QuartmeanVaR = ((1/252)*Data.Results.ResMinCVaR.QuartAveReturns./Data.Results.ResMinCVaR.QuartVaR);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.QuartmeanVaR = ((1/252)*Data.Results.ResMaxSTARR.QuartAveReturns./Data.Results.ResMaxSTARR.QuartVaR);
    end
end

