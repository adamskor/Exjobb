function [Data] = YearlyPortWealth(Data)
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.YearlyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.MaxSharpe.YearlyWealth(1, :) = 100;
    Data.Results.MaxSharpe.YearlyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.YearlyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.MinCVaR.YearlyWealth(1, :) = 100;
    Data.Results.MinCVaR.YearlyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.YearlyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.MaxSTARR.YearlyWealth(1, :) = 100;
    Data.Results.MaxSTARR.YearlyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.YearlyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.YearlyWealth(1, :) = 100;
    Data.Results.ResMaxSharpe.YearlyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.YearlyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.YearlyWealth(1, :) = 100;
    Data.Results.ResMinCVaR.YearlyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.YearlyWealth = zeros(Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.YearlyWealth(1, :) = 100;
    Data.Results.ResMaxSTARR.YearlyfinalWealth = zeros(1, Data.Info.nStartDays);
    end
    nStartDays = Data.Info.nStartDays;
    for StartDay = 1:nStartDays
    for i = 1:Data.Info.nWindows - Data.Info.nStartDays - 1
        if Data.Info.Optimisations(1)
        Data.Results.MaxSharpe.YearlyWealth(i + 1,StartDay) = Data.Results.MaxSharpe.YearlyWealth(i, StartDay)*Data.Optimisation.MaxSharpe.YearlyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(2)
        Data.Results.MinCVaR.YearlyWealth(i + 1,StartDay) = Data.Results.MinCVaR.YearlyWealth(i, StartDay)*Data.Optimisation.MinCVaR.YearlyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(3)
        Data.Results.MaxSTARR.YearlyWealth(i + 1,StartDay) = Data.Results.MaxSTARR.YearlyWealth(i, StartDay)*Data.Optimisation.MaxSTARR.YearlyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(4)
        Data.Results.ResMaxSharpe.YearlyWealth(i + 1,StartDay) = Data.Results.ResMaxSharpe.YearlyWealth(i, StartDay)*Data.Optimisation.ResMaxSharpe.YearlyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(5)
        Data.Results.ResMinCVaR.YearlyWealth(i + 1,StartDay) = Data.Results.ResMinCVaR.YearlyWealth(i, StartDay)*Data.Optimisation.ResMinCVaR.YearlyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(6)
        Data.Results.ResMaxSTARR.YearlyWealth(i + 1,StartDay) = Data.Results.ResMaxSTARR.YearlyWealth(i, StartDay)*Data.Optimisation.ResMaxSTARR.YearlyWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
    end
    Data.Results.MaxSharpe.YearlyfinalWealth(1, StartDay) = Data.Results.MaxSharpe.YearlyWealth(end, StartDay);
    Data.Results.MinCVaR.YearlyfinalWealth(1, StartDay) = Data.Results.MinCVaR.YearlyWealth(end, StartDay);
    Data.Results.MaxSTARR.YearlyfinalWealth(1, StartDay) = Data.Results.MaxSTARR.YearlyWealth(end, StartDay);
    Data.Results.ResMaxSharpe.YearlyfinalWealth(1, StartDay) = Data.Results.ResMaxSharpe.YearlyWealth(end, StartDay);
    Data.Results.ResMinCVaR.YearlyfinalWealth(1, StartDay) = Data.Results.ResMinCVaR.YearlyWealth(end, StartDay);
    Data.Results.ResMaxSTARR.YearlyfinalWealth(1, StartDay) = Data.Results.ResMaxSTARR.YearlyWealth(end, StartDay);
    end
end

