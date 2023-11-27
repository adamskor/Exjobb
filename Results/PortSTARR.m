function [Data] = PortSTARR(Data)
    Data.Results.Bench.STARR = ((1/252)*Data.Results.Bench.AveReturns/Data.Results.Bench.CVaR);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.STARR = ((1/252)*Data.Results.MaxSharpe.AveReturns/Data.Results.MaxSharpe.CVaR);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.STARR = ((1/252)*Data.Results.MinCVaR.AveReturns/Data.Results.MinCVaR.CVaR);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.STARR = ((1/252)*Data.Results.MaxSTARR.AveReturns/Data.Results.MaxSTARR.CVaR);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.STARR = ((1/252)*Data.Results.ResMaxSharpe.AveReturns/Data.Results.ResMaxSharpe.CVaR);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.STARR = ((1/252)*Data.Results.ResMinCVaR.AveReturns/Data.Results.ResMinCVaR.CVaR);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.STARR = ((1/252)*Data.Results.ResMaxSTARR.AveReturns/Data.Results.ResMaxSTARR.CVaR);
    end
end

