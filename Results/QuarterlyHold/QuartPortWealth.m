function [Data] = QuartPortWealth(Data)

    Data.Results.MaxSharpe.QuartWealth = zeros(size(Data.Optimisation.MaxSharpe.QuartWeights, 3), Data.Info.nStartDays);
    Data.Results.MaxSharpe.QuartWealth(1, :) = 100;
    Data.Results.MaxSharpe.QuartfinalWealth = zeros(1, Data.Info.nStartDays);

    Data.Results.MinCVaR.QuartWealth = zeros(size(Data.Optimisation.MinCVaR.QuartWeights, 3), Data.Info.nStartDays);
    Data.Results.MinCVaR.QuartWealth(1, :) = 100;
    Data.Results.MinCVaR.QuartfinalWealth = zeros(1, Data.Info.nStartDays);

    Data.Results.MaxSTARR.QuartWealth = zeros(size(Data.Optimisation.MaxSTARR.QuartWeights, 3), Data.Info.nStartDays);
    Data.Results.MaxSTARR.QuartWealth(1, :) = 100;
    Data.Results.MaxSTARR.QuartfinalWealth = zeros(1, Data.Info.nStartDays);

    Data.Results.ResMaxSharpe.QuartWealth = zeros(size(Data.Optimisation.ResMaxSharpe.QuartWeights, 3), Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.QuartWealth(1, :) = 100;
    Data.Results.ResMaxSharpe.QuartfinalWealth = zeros(1, Data.Info.nStartDays);

    Data.Results.ResMinCVaR.QuartWealth = zeros(size(Data.Optimisation.ResMinCVaR.QuartWeights, 3), Data.Info.nStartDays);
    Data.Results.ResMinCVaR.QuartWealth(1, :) = 100;
    Data.Results.ResMinCVaR.QuartfinalWealth = zeros(1, Data.Info.nStartDays);
 
    Data.Results.ResMaxSTARR.QuartWealth = zeros(size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3), Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.QuartWealth(1, :) = 100;
    Data.Results.ResMaxSTARR.QuartfinalWealth = zeros(1, Data.Info.nStartDays);

    nStartDays = Data.Info.nStartDays;
    for StartDay = 1:nStartDays
    for i = 1:size(Data.Optimisation.ResMaxSharpe.QuartWeights, 3)
        if Data.Info.Optimisations(1)
        Data.Results.MaxSharpe.QuartWealth(i + 1,StartDay) = Data.Results.MaxSharpe.QuartWealth(i, StartDay)*Data.Optimisation.MaxSharpe.QuartWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(2)
        Data.Results.MinCVaR.QuartWealth(i + 1,StartDay) = Data.Results.MinCVaR.QuartWealth(i, StartDay)*Data.Optimisation.MinCVaR.QuartWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(3)
        Data.Results.MaxSTARR.QuartWealth(i + 1,StartDay) = Data.Results.MaxSTARR.QuartWealth(i, StartDay)*Data.Optimisation.MaxSTARR.QuartWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(4)
        Data.Results.ResMaxSharpe.QuartWealth(i + 1,StartDay) = Data.Results.ResMaxSharpe.QuartWealth(i, StartDay)*Data.Optimisation.ResMaxSharpe.QuartWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(5)
        Data.Results.ResMinCVaR.QuartWealth(i + 1,StartDay) = Data.Results.ResMinCVaR.QuartWealth(i, StartDay)*Data.Optimisation.ResMinCVaR.QuartWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
        if Data.Info.Optimisations(6)
        Data.Results.ResMaxSTARR.QuartWealth(i + 1,StartDay) = Data.Results.ResMaxSTARR.QuartWealth(i, StartDay)*Data.Optimisation.ResMaxSTARR.QuartWeights(1,:,i, StartDay)*(1 + Data.TimeSeries.Returns(1, :, i + StartDay))';
        end
    end
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.QuartfinalWealth(1, StartDay) = Data.Results.MaxSharpe.QuartWealth(end-1, StartDay);end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.QuartfinalWealth(1, StartDay) = Data.Results.MinCVaR.QuartWealth(end-1, StartDay);end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.QuartfinalWealth(1, StartDay) = Data.Results.MaxSTARR.QuartWealth(end-1, StartDay);end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.QuartfinalWealth(1, StartDay) = Data.Results.ResMaxSharpe.QuartWealth(end-1, StartDay);end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.QuartfinalWealth(1, StartDay) = Data.Results.ResMinCVaR.QuartWealth(end-1, StartDay);end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.QuartfinalWealth(1, StartDay) = Data.Results.ResMaxSTARR.QuartWealth(end-1, StartDay);end
    end
end

