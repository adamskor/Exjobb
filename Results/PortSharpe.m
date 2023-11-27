function [Data] = PortSharpe(Data)
    Data.Results.Bench.Sharpe = mean(Data.Results.Bench.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252/Data.Results.Bench.STD;
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.Sharpe = (mean(Data.Results.MaxSharpe.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252)/(Data.Results.MaxSharpe.STD);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.Sharpe = mean(Data.Results.MinCVaR.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252/Data.Results.MinCVaR.STD;
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.Sharpe = mean(Data.Results.MaxSTARR.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252/Data.Results.MaxSTARR.STD;
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.Sharpe = (mean(Data.Results.ResMaxSharpe.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252)/(Data.Results.ResMaxSharpe.STD);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.Sharpe = mean(Data.Results.ResMinCVaR.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252/Data.Results.ResMinCVaR.STD;
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.Sharpe = mean(Data.Results.ResMaxSTARR.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252/Data.Results.ResMaxSTARR.STD;
    end
    
end

