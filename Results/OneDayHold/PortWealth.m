function [Data] = PortWealth(Data)
    Data.Results.Bench.Wealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.Bench.Wealth(1, :) = 100;
    Data.Results.Bench.finalWealth = zeros(1, Data.Info.nStartDays);
    Data.Results.BenchEQW.Wealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.BenchEQW.Wealth(1, :) = 100;
    Data.Results.BenchEQW.finalWealth = zeros(1, Data.Info.nStartDays);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.Wealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.MaxSharpe.Wealth(1, :) = 100;
    Data.Results.MaxSharpe.finalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.Wealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.MinCVaR.Wealth(1, :) = 100;
    Data.Results.MinCVaR.finalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.Wealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.MaxSTARR.Wealth(1, :) = 100;
    Data.Results.MaxSTARR.finalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.Wealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.Wealth(1, :) = 100;
    Data.Results.ResMaxSharpe.finalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.Wealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.Wealth(1, :) = 100;
    Data.Results.ResMinCVaR.finalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.Wealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.Wealth(1, :) = 100;
    Data.Results.ResMaxSTARR.finalWealth = zeros(1, Data.Info.nStartDays);
    end
    nStartDays = Data.Info.nStartDays;
    for StartDay = 1:nStartDays
    for i = 1:Data.Info.nWindows - Data.Info.nStartDays - 1
        Data.Results.Bench.Wealth(i + 1, StartDay) = Data.Results.Bench.Wealth(i, StartDay)*Data.Info.Bench.Weights*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        Data.Results.BenchEQW.Wealth(i + 1,StartDay) = Data.Results.BenchEQW.Wealth(i, StartDay)*(ones(1, Data.Info.nAssets)/Data.Info.nAssets)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        if Data.Info.Optimisations(1)
        Data.Results.MaxSharpe.Wealth(i + 1,StartDay) = Data.Results.MaxSharpe.Wealth(i, StartDay)*Data.Optimisation.MaxSharpe.oneDayWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(2)
        Data.Results.MinCVaR.Wealth(i + 1,StartDay) = Data.Results.MinCVaR.Wealth(i, StartDay)*Data.Optimisation.MinCVaR.oneDayWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(3)
        Data.Results.MaxSTARR.Wealth(i + 1,StartDay) = Data.Results.MaxSTARR.Wealth(i, StartDay)*Data.Optimisation.MaxSTARR.oneDayWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(4)
        Data.Results.ResMaxSharpe.Wealth(i + 1,StartDay) = Data.Results.ResMaxSharpe.Wealth(i, StartDay)*Data.Optimisation.ResMaxSharpe.oneDayWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(5)
        Data.Results.ResMinCVaR.Wealth(i + 1,StartDay) = Data.Results.ResMinCVaR.Wealth(i, StartDay)*Data.Optimisation.ResMinCVaR.oneDayWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(6)
        Data.Results.ResMaxSTARR.Wealth(i + 1,StartDay) = Data.Results.ResMaxSTARR.Wealth(i, StartDay)*Data.Optimisation.ResMaxSTARR.oneDayWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
    end
    Data.Results.Bench.finalWealth(1, StartDay) = Data.Results.Bench.Wealth(end, StartDay);
    Data.Results.BenchEQW.finalWealth(1, StartDay) = Data.Results.BenchEQW.Wealth(end, StartDay);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.finalWealth(1, StartDay) = Data.Results.MaxSharpe.Wealth(end, StartDay); end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.finalWealth(1, StartDay) = Data.Results.MinCVaR.Wealth(end, StartDay); end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.finalWealth(1, StartDay) = Data.Results.MaxSTARR.Wealth(end, StartDay); end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.finalWealth(1, StartDay) = Data.Results.ResMaxSharpe.Wealth(end, StartDay); end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.finalWealth(1, StartDay) = Data.Results.ResMinCVaR.Wealth(end, StartDay); end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.finalWealth(1, StartDay) = Data.Results.ResMaxSTARR.Wealth(end, StartDay); end
    end
end

