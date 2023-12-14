function [Data] = QuartPortSharpe(Data)
    Data.Results.Bench.Sharpe = mean(Data.Results.Bench.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.Bench.STD;
    Data.Results.BenchEQW.Sharpe = mean(Data.Results.BenchEQW.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.BenchEQW.STD;
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.QuartSharpe = (mean(Data.Results.MaxSharpe.QuartReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252)./(Data.Results.MaxSharpe.QuartSTD);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.QuartSharpe = mean(Data.Results.MinCVaR.QuartReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.MinCVaR.QuartSTD;
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.QuartSharpe = mean(Data.Results.MaxSTARR.QuartReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.MaxSTARR.QuartSTD;
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.QuartSharpe = (mean(Data.Results.ResMaxSharpe.QuartReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252)./(Data.Results.ResMaxSharpe.QuartSTD);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.QuartSharpe = mean(Data.Results.ResMinCVaR.QuartReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.ResMinCVaR.QuartSTD;
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.QuartSharpe = mean(Data.Results.ResMaxSTARR.QuartReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.ResMaxSTARR.QuartSTD;
    end
    
end

