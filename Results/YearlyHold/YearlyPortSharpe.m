function [Data] = YearlyPortSharpe(Data)
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.YearlySharpe = (mean(Data.Results.MaxSharpe.YearlyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252)./(Data.Results.MaxSharpe.YearlySTD);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.YearlySharpe = mean(Data.Results.MinCVaR.YearlyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.MinCVaR.YearlySTD;
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.YearlySharpe = mean(Data.Results.MaxSTARR.YearlyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.MaxSTARR.YearlySTD;
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.YearlySharpe = (mean(Data.Results.ResMaxSharpe.YearlyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252)./(Data.Results.ResMaxSharpe.YearlySTD);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.YearlySharpe = mean(Data.Results.ResMinCVaR.YearlyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.ResMinCVaR.YearlySTD;
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.YearlySharpe = mean(Data.Results.ResMaxSTARR.YearlyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.ResMaxSTARR.YearlySTD;
    end
    
end

