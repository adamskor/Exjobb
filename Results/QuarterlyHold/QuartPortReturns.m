function [Data] = QuartPortReturns(Data)
    nStartDays = Data.Info.nStartDays;

    Data.Results.MaxSharpe.QuartReturns = zeros(size(Data.Optimisation.ResMaxSharpe.QuartWeights, 3), nStartDays);


    Data.Results.MinCVaR.QuartReturns = zeros(size(Data.Optimisation.ResMaxSharpe.QuartWeights, 3), nStartDays);


    Data.Results.MaxSTARR.QuartReturns = zeros(size(Data.Optimisation.ResMaxSharpe.QuartWeights, 3), nStartDays);


    Data.Results.ResMaxSharpe.QuartReturns = zeros(size(Data.Optimisation.ResMaxSharpe.QuartWeights, 3), nStartDays);

    Data.Results.ResMinCVaR.QuartReturns = zeros(size(Data.Optimisation.ResMaxSharpe.QuartWeights, 3), nStartDays);

    Data.Results.ResMaxSTARR.QuartReturns = zeros(size(Data.Optimisation.ResMaxSharpe.QuartWeights, 3), nStartDays);
    for StartDay = 1:nStartDays
    for i = 1:size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3)
        if Data.Info.Optimisations(1)
        Data.Results.MaxSharpe.QuartReturns(i + 1, StartDay) = Data.Optimisation.MaxSharpe.QuartWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(2)
        Data.Results.MinCVaR.QuartReturns(i + 1, StartDay) = Data.Optimisation.MinCVaR.QuartWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(3)
        Data.Results.MaxSTARR.QuartReturns(i + 1, StartDay) = Data.Optimisation.MaxSTARR.QuartWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(4)
        Data.Results.ResMaxSharpe.QuartReturns(i + 1, StartDay) = Data.Optimisation.ResMaxSharpe.QuartWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(5)
        Data.Results.ResMinCVaR.QuartReturns(i + 1, StartDay) = Data.Optimisation.ResMinCVaR.QuartWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(6)
        Data.Results.ResMaxSTARR.QuartReturns(i + 1, StartDay) = Data.Optimisation.ResMaxSTARR.QuartWeights(1,:,i, StartDay)*(Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
    end
    end
    Data.Results.Bench.AveReturns = mean(Data.Results.Bench.Returns)*252;
    Data.Results.BenchEQW.AveReturns = mean(Data.Results.BenchEQW.Returns)*252;
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.QuartAveReturns = mean(Data.Results.MaxSharpe.QuartReturns)*252;
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.QuartAveReturns = mean(Data.Results.MinCVaR.QuartReturns)*252;
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.QuartAveReturns = mean(Data.Results.MaxSTARR.QuartReturns)*252;
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.QuartAveReturns = mean(Data.Results.ResMaxSharpe.QuartReturns)*252;
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.QuartAveReturns = mean(Data.Results.ResMinCVaR.QuartReturns)*252;
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.QuartAveReturns = mean(Data.Results.ResMaxSTARR.QuartReturns)*252;
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end

