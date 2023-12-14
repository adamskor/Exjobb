function [Data] = PortReturns(Data)
    nStartDays = Data.Info.nStartDays;
    Data.Results.Bench.Returns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    Data.Results.BenchEQW.Returns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    Data.Optimisation.Bench.Weights = Data.Info.Bench.Weights;
    Data.Optimisation.BenchEQW.Weights = (ones(1, Data.Info.nAssets)/Data.Info.nAssets);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.Returns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.Returns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.Returns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.Returns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.Returns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.Returns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    for StartDay = 1:nStartDays
    for i = 1:Data.Info.nWindows - Data.Info.nStartDays - 1
        Data.Results.Bench.Returns(i + 1, StartDay) = Data.Optimisation.Bench.Weights*(Data.TimeSeries.Returns(1, :, i + StartDay))';   
        Data.Results.BenchEQW.Returns(i + 1, StartDay) = Data.Optimisation.BenchEQW.Weights*(Data.TimeSeries.Returns(1, :, i + StartDay))';   
        if Data.Info.Optimisations(1)
        Data.Results.MaxSharpe.Returns(i + 1, StartDay) = Data.Optimisation.MaxSharpe.oneDayWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(2)
        Data.Results.MinCVaR.Returns(i + 1, StartDay) = Data.Optimisation.MinCVaR.oneDayWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(3)
        Data.Results.MaxSTARR.Returns(i + 1, StartDay) = Data.Optimisation.MaxSTARR.oneDayWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(4)
        Data.Results.ResMaxSharpe.Returns(i + 1, StartDay) = Data.Optimisation.ResMaxSharpe.oneDayWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(5)
        Data.Results.ResMinCVaR.Returns(i + 1, StartDay) = Data.Optimisation.ResMinCVaR.oneDayWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(6)
        Data.Results.ResMaxSTARR.Returns(i + 1, StartDay) = Data.Optimisation.ResMaxSTARR.oneDayWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
    end
    end
    Data.Results.Bench.AveReturns = mean(Data.Results.Bench.Returns)*252;
    Data.Results.BenchEQW.AveReturns = mean(Data.Results.BenchEQW.Returns)*252;
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.AveReturns = mean(Data.Results.MaxSharpe.Returns)*252;
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.AveReturns = mean(Data.Results.MinCVaR.Returns)*252;
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.AveReturns = mean(Data.Results.MaxSTARR.Returns)*252;
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.AveReturns = mean(Data.Results.ResMaxSharpe.Returns)*252;
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.AveReturns = mean(Data.Results.ResMinCVaR.Returns)*252;
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.AveReturns = mean(Data.Results.ResMaxSTARR.Returns)*252;
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end

