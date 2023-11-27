function [Data] = PortVaRCVaR(Data)
    [Data.Results.Bench.VaR, Data.Results.Bench.CVaR] = CVaR(Data.Results.Bench.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    if Data.Info.Optimisations(1)
    [Data.Results.MaxSharpe.VaR, Data.Results.MaxSharpe.CVaR] = CVaR(Data.Results.MaxSharpe.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    end
    if Data.Info.Optimisations(2)
    [Data.Results.MinCVaR.VaR, Data.Results.MinCVaR.CVaR] = CVaR(Data.Results.MinCVaR.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    end
    if Data.Info.Optimisations(3)
    [Data.Results.MaxSTARR.VaR, Data.Results.MaxSTARR.CVaR] = CVaR(Data.Results.MaxSTARR.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    end
    if Data.Info.Optimisations(4)
    [Data.Results.ResMaxSharpe.VaR, Data.Results.ResMaxSharpe.CVaR] = CVaR(Data.Results.ResMaxSharpe.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    end
    if Data.Info.Optimisations(5)
    [Data.Results.ResMinCVaR.VaR, Data.Results.ResMinCVaR.CVaR] = CVaR(Data.Results.ResMinCVaR.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    end
    if Data.Info.Optimisations(6)
    [Data.Results.ResMaxSTARR.VaR, Data.Results.ResMaxSTARR.CVaR] = CVaR(Data.Results.ResMaxSTARR.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    end
    
    function [VaR, val] = CVaR(portReturns, alpha, sampleSize) 
    portReturnsSort = sort(portReturns);
    VaR = -portReturnsSort(1 + floor((1 - alpha)*size(portReturnsSort, 1)));
    CVaR_temp = 0;
    for m = 1:sampleSize
        CVaR_temp = CVaR_temp + max((-portReturns(m,1) - VaR), 0);
    end
    val = VaR + 1/(sampleSize*(1 - alpha))*CVaR_temp;   
    end
end

