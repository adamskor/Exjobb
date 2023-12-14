function [Data] = PortMeanVaR(Data)
    Data.Results.Bench.meanVaR = ((1/252)*Data.Results.Bench.AveReturns./Data.Results.Bench.VaR);
    Data.Results.BenchEQW.meanVaR = ((1/252)*Data.Results.BenchEQW.AveReturns./Data.Results.BenchEQW.VaR);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.meanVaR = ((1/252)*Data.Results.MaxSharpe.AveReturns./Data.Results.MaxSharpe.VaR);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.meanVaR = ((1/252)*Data.Results.MinCVaR.AveReturns./Data.Results.MinCVaR.VaR);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.meanVaR = ((1/252)*Data.Results.MaxSTARR.AveReturns./Data.Results.MaxSTARR.VaR);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.meanVaR = ((1/252)*Data.Results.ResMaxSharpe.AveReturns./Data.Results.ResMaxSharpe.VaR);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.meanVaR = ((1/252)*Data.Results.ResMinCVaR.AveReturns./Data.Results.ResMinCVaR.VaR);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.meanVaR = ((1/252)*Data.Results.ResMaxSTARR.AveReturns./Data.Results.ResMaxSTARR.VaR);
    end
end

