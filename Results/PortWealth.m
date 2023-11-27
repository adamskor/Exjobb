function [Data] = PortWealth(Data)
    Data.Results.Bench.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.Bench.Wealth(1) = 100;
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.MaxSharpe.Wealth(1) = 100;
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.MinCVaR.Wealth(1) = 100;
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.MaxSTARR.Wealth(1) = 100;
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.ResMaxSharpe.Wealth(1) = 100;
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.ResMinCVaR.Wealth(1) = 100;
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.ResMaxSTARR.Wealth(1) = 100;
    end
    
    
    for i = 1:Data.Info.nWindows-1
        Data.Results.Bench.Wealth(i + 1) = Data.Results.Bench.Wealth(i)*Data.Info.Bench.Weights*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        if Data.Info.Optimisations(1)
        Data.Results.MaxSharpe.Wealth(i + 1) = Data.Results.MaxSharpe.Wealth(i)*Data.Optimisation.MaxSharpe.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        end
        if Data.Info.Optimisations(2)
        Data.Results.MinCVaR.Wealth(i + 1) = Data.Results.MinCVaR.Wealth(i)*Data.Optimisation.MinCVaR.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        end
        if Data.Info.Optimisations(3)
        Data.Results.MaxSTARR.Wealth(i + 1) = Data.Results.MaxSTARR.Wealth(i)*Data.Optimisation.MaxSTARR.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        end
        if Data.Info.Optimisations(4)
        Data.Results.ResMaxSharpe.Wealth(i + 1) = Data.Results.ResMaxSharpe.Wealth(i)*Data.Optimisation.ResMaxSharpe.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        end
        if Data.Info.Optimisations(5)
        Data.Results.ResMinCVaR.Wealth(i + 1) = Data.Results.ResMinCVaR.Wealth(i)*Data.Optimisation.ResMinCVaR.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        end
        if Data.Info.Optimisations(6)
        Data.Results.ResMaxSTARR.Wealth(i + 1) = Data.Results.ResMaxSTARR.Wealth(i)*Data.Optimisation.ResMaxSTARR.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        end
    end
end

