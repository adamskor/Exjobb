function [Data] = WeeklyPortReturns(Data)
    nStartDays = Data.Info.nStartDays;
    Data.Results.Bench.Returns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    Data.Results.BenchEQW.Returns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    Data.Optimisation.Bench.Weights = Data.Info.Bench.Weights;
    Data.Optimisation.BenchEQW.Weights = (ones(1, Data.Info.nAssets)/Data.Info.nAssets);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.WeeklyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.WeeklyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.WeeklyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.WeeklyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.WeeklyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.WeeklyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    for StartDay = 1:nStartDays
    for i = 1:Data.Info.nWindows - Data.Info.nStartDays - 1
        Data.Results.Bench.Returns(i + 1, StartDay) = Data.Optimisation.Bench.Weights*(Data.TimeSeries.Returns(1, :, i + StartDay))';   
        Data.Results.BenchEQW.Returns(i + 1, StartDay) = Data.Optimisation.BenchEQW.Weights*(Data.TimeSeries.Returns(1, :, i + StartDay))';   
        if Data.Info.Optimisations(1)
        Data.Results.MaxSharpe.WeeklyReturns(i + 1, StartDay) = Data.Optimisation.MaxSharpe.WeeklyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(2)
        Data.Results.MinCVaR.WeeklyReturns(i + 1, StartDay) = Data.Optimisation.MinCVaR.WeeklyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(3)
        Data.Results.MaxSTARR.WeeklyReturns(i + 1, StartDay) = Data.Optimisation.MaxSTARR.WeeklyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(4)
        Data.Results.ResMaxSharpe.WeeklyReturns(i + 1, StartDay) = Data.Optimisation.ResMaxSharpe.WeeklyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(5)
        Data.Results.ResMinCVaR.WeeklyReturns(i + 1, StartDay) = Data.Optimisation.ResMinCVaR.WeeklyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(6)
        Data.Results.ResMaxSTARR.WeeklyReturns(i + 1, StartDay) = Data.Optimisation.ResMaxSTARR.WeeklyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
    end
    end
    Data.Results.Bench.AveReturns = mean(Data.Results.Bench.Returns)*252;
    Data.Results.BenchEQW.AveReturns = mean(Data.Results.BenchEQW.Returns)*252;
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.WeeklyAveReturns = mean(Data.Results.MaxSharpe.WeeklyReturns)*252;
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.WeeklyAveReturns = mean(Data.Results.MinCVaR.WeeklyReturns)*252;
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.WeeklyAveReturns = mean(Data.Results.MaxSTARR.WeeklyReturns)*252;
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.WeeklyAveReturns = mean(Data.Results.ResMaxSharpe.WeeklyReturns)*252;
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.WeeklyAveReturns = mean(Data.Results.ResMinCVaR.WeeklyReturns)*252;
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.WeeklyAveReturns = mean(Data.Results.ResMaxSTARR.WeeklyReturns)*252;
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end

