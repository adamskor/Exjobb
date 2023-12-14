function [Data] = WeeklyPortWealth(Data)
    Data.Results.Bench.WeeklyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.Bench.WeeklyWealth(1, :) = 100;
    Data.Results.Bench.WeeklyfinalWealth = zeros(1, Data.Info.nStartDays);
    Data.Results.BenchEQW.WeeklyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.BenchEQW.WeeklyWealth(1, :) = 100;
    Data.Results.BenchEQW.WeeklyfinalWealth = zeros(1, Data.Info.nStartDays);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.WeeklyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.MaxSharpe.WeeklyWealth(1, :) = 100;
    Data.Results.MaxSharpe.WeeklyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.WeeklyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.MinCVaR.WeeklyWealth(1, :) = 100;
    Data.Results.MinCVaR.WeeklyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.WeeklyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.MaxSTARR.WeeklyWealth(1, :) = 100;
    Data.Results.MaxSTARR.WeeklyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.WeeklyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.WeeklyWealth(1, :) = 100;
    Data.Results.ResMaxSharpe.WeeklyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.WeeklyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.WeeklyWealth(1, :) = 100;
    Data.Results.ResMinCVaR.WeeklyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.WeeklyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.WeeklyWealth(1, :) = 100;
    Data.Results.ResMaxSTARR.WeeklyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    nStartDays = Data.Info.nStartDays;
    for StartDay = 1:nStartDays
    for i = 1:Data.Info.nWindows - Data.Info.nStartDays - 1
        Data.Results.Bench.WeeklyWealth(i + 1, StartDay) = Data.Results.Bench.WeeklyWealth(i, StartDay)*Data.Info.Bench.Weights*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        Data.Results.BenchEQW.WeeklyWealth(i + 1,StartDay) = Data.Results.BenchEQW.WeeklyWealth(i, StartDay)*(ones(1, Data.Info.nAssets)/Data.Info.nAssets)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        if Data.Info.Optimisations(1)
        Data.Results.MaxSharpe.WeeklyWealth(i + 1,StartDay) = Data.Results.MaxSharpe.WeeklyWealth(i, StartDay)*Data.Optimisation.MaxSharpe.WeeklyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(2)
        Data.Results.MinCVaR.WeeklyWealth(i + 1,StartDay) = Data.Results.MinCVaR.WeeklyWealth(i, StartDay)*Data.Optimisation.MinCVaR.WeeklyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(3)
        Data.Results.MaxSTARR.WeeklyWealth(i + 1,StartDay) = Data.Results.MaxSTARR.WeeklyWealth(i, StartDay)*Data.Optimisation.MaxSTARR.WeeklyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(4)
        Data.Results.ResMaxSharpe.WeeklyWealth(i + 1,StartDay) = Data.Results.ResMaxSharpe.WeeklyWealth(i, StartDay)*Data.Optimisation.ResMaxSharpe.WeeklyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(5)
        Data.Results.ResMinCVaR.WeeklyWealth(i + 1,StartDay) = Data.Results.ResMinCVaR.WeeklyWealth(i, StartDay)*Data.Optimisation.ResMinCVaR.WeeklyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(6)
        Data.Results.ResMaxSTARR.WeeklyWealth(i + 1,StartDay) = Data.Results.ResMaxSTARR.WeeklyWealth(i, StartDay)*Data.Optimisation.ResMaxSTARR.WeeklyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
    end
    Data.Results.Bench.WeeklyfinalWealth(1, StartDay) = Data.Results.Bench.WeeklyWealth(end, StartDay);
    Data.Results.BenchEQW.WeeklyfinalWealth(1, StartDay) = Data.Results.BenchEQW.WeeklyWealth(end, StartDay);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.WeeklyfinalWealth(1, StartDay) = Data.Results.MaxSharpe.WeeklyWealth(end, StartDay); end;
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.WeeklyfinalWealth(1, StartDay) = Data.Results.MinCVaR.WeeklyWealth(end, StartDay); end;
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.WeeklyfinalWealth(1, StartDay) = Data.Results.MaxSTARR.WeeklyWealth(end, StartDay); end;
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.WeeklyfinalWealth(1, StartDay) = Data.Results.ResMaxSharpe.WeeklyWealth(end, StartDay); end;
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.WeeklyfinalWealth(1, StartDay) = Data.Results.ResMinCVaR.WeeklyWealth(end, StartDay); end;
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.WeeklyfinalWealth(1, StartDay) = Data.Results.ResMaxSTARR.WeeklyWealth(end, StartDay); end;
    end
end

