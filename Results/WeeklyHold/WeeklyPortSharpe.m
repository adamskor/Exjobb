function [Data] = WeeklyPortSharpe(Data)
    Data.Results.Bench.Sharpe = mean(Data.Results.Bench.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.Bench.STD;
    Data.Results.BenchEQW.Sharpe = mean(Data.Results.BenchEQW.Returns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.BenchEQW.STD;
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.WeeklySharpe = (mean(Data.Results.MaxSharpe.WeeklyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252)./(Data.Results.MaxSharpe.WeeklySTD);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.WeeklySharpe = mean(Data.Results.MinCVaR.WeeklyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.MinCVaR.WeeklySTD;
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.WeeklySharpe = mean(Data.Results.MaxSTARR.WeeklyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.MaxSTARR.WeeklySTD;
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.WeeklySharpe = (mean(Data.Results.ResMaxSharpe.WeeklyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252)./(Data.Results.ResMaxSharpe.WeeklySTD);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.WeeklySharpe = mean(Data.Results.ResMinCVaR.WeeklyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.ResMinCVaR.WeeklySTD;
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.WeeklySharpe = mean(Data.Results.ResMaxSTARR.WeeklyReturns - squeeze(Data.TimeSeries.RFrate(end,1,end)))*252./Data.Results.ResMaxSTARR.WeeklySTD;
    end
    
end

