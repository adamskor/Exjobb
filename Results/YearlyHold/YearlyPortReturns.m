function [Data] = YearlyPortReturns(Data)
    nStartDays = Data.Info.nStartDays;
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.YearlyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.YearlyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.YearlyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.YearlyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.YearlyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.YearlyReturns = zeros(Data.Info.nWindows - nStartDays, nStartDays);
    end
    for StartDay = 1:nStartDays
    for i = 1:Data.Info.nWindows - Data.Info.nStartDays - 1
        if Data.Info.Optimisations(1)
        Data.Results.MaxSharpe.YearlyReturns(i + 1, StartDay) = Data.Optimisation.MaxSharpe.YearlyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(2)
        Data.Results.MinCVaR.YearlyReturns(i + 1, StartDay) = Data.Optimisation.MinCVaR.YearlyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(3)
        Data.Results.MaxSTARR.YearlyReturns(i + 1, StartDay) = Data.Optimisation.MaxSTARR.YearlyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(4)
        Data.Results.ResMaxSharpe.YearlyReturns(i + 1, StartDay) = Data.Optimisation.ResMaxSharpe.YearlyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(5)
        Data.Results.ResMinCVaR.YearlyReturns(i + 1, StartDay) = Data.Optimisation.ResMinCVaR.YearlyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(6)
        Data.Results.ResMaxSTARR.YearlyReturns(i + 1, StartDay) = Data.Optimisation.ResMaxSTARR.YearlyWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
    end
    end
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.YearlyAveReturns = mean(Data.Results.MaxSharpe.YearlyReturns)*252;
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.YearlyAveReturns = mean(Data.Results.MinCVaR.YearlyReturns)*252;
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.YearlyAveReturns = mean(Data.Results.MaxSTARR.YearlyReturns)*252;
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.YearlyAveReturns = mean(Data.Results.ResMaxSharpe.YearlyReturns)*252;
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.YearlyAveReturns = mean(Data.Results.ResMinCVaR.YearlyReturns)*252;
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.YearlyAveReturns = mean(Data.Results.ResMaxSTARR.YearlyReturns)*252;
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end

