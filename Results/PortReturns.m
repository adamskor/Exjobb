function [Data] = PortReturns(Data)
    Data.Results.Bench.Returns = zeros(Data.Info.nWindows, 1);
    Data.Optimisation.Bench.Weights = Data.Info.Bench.Weights;
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.Returns = zeros(Data.Info.nWindows, 1);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.Returns = zeros(Data.Info.nWindows, 1);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.Returns = zeros(Data.Info.nWindows, 1);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.Returns = zeros(Data.Info.nWindows, 1);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.Returns = zeros(Data.Info.nWindows, 1);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.Returns = zeros(Data.Info.nWindows, 1);
    end
    
    for i = 1:Data.Info.nWindows-1
        Data.Results.Bench.Returns(i + 1) = Data.Optimisation.Bench.Weights*(Data.TimeSeries.Returns(1, :, i + 1))';     
        if Data.Info.Optimisations(1)
        Data.Results.MaxSharpe.Returns(i + 1) = Data.Optimisation.MaxSharpe.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        end
        if Data.Info.Optimisations(2)
        Data.Results.MinCVaR.Returns(i + 1) = Data.Optimisation.MinCVaR.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        end
        if Data.Info.Optimisations(3)
        Data.Results.MaxSTARR.Returns(i + 1) = Data.Optimisation.MaxSTARR.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        end
        if Data.Info.Optimisations(4)
        Data.Results.ResMaxSharpe.Returns(i + 1) = Data.Optimisation.ResMaxSharpe.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        end
        if Data.Info.Optimisations(5)
        Data.Results.ResMinCVaR.Returns(i + 1) = Data.Optimisation.ResMinCVaR.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        end
        if Data.Info.Optimisations(6)
        Data.Results.ResMaxSTARR.Returns(i + 1) = Data.Optimisation.ResMaxSTARR.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        end
    end
    Data.Results.Bench.AveReturns = mean(Data.Results.Bench.Returns)*252;
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

