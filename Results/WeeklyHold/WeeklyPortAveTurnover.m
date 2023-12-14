function [Data] = WeeklyPortAveTurnover(Data)
    Bench_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);    
    Data.Results.Bench.aveTurnover = mean(mean(abs(diff(Bench_temp')), 2))*252;
    nStartDays = Data.Info.nStartDays;
    for StartDay = 1:nStartDays
        if Data.Info.Optimisations(1)
        MaxSharpe_temp = zeros(Data.Info.nAssets, Data.Info.nWindows - nStartDays);
        MaxSharpe_temp(:,:) = Data.Optimisation.MaxSharpe.WeeklyWeights(1,:,:,StartDay);
        Data.Results.MaxSharpe.WeeklyaveTurnover(StartDay) = mean(mean(abs(diff(MaxSharpe_temp')), 2))*252;
        end
        if Data.Info.Optimisations(2)
        MinCVaR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows - nStartDays);
        MinCVaR_temp(:,:) = Data.Optimisation.MinCVaR.WeeklyWeights(1,:,:,StartDay);
        Data.Results.MinCVaR.WeeklyaveTurnover(StartDay) = mean(mean(abs(diff(MinCVaR_temp')), 2))*252;
        end
        if Data.Info.Optimisations(3)
        MaxSTARR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows - nStartDays);
        MaxSTARR_temp(:,:) = Data.Optimisation.MaxSTARR.WeeklyWeights(1,:,:,StartDay);
        Data.Results.MaxSTARR.WeeklyaveTurnover(StartDay) = mean(mean(abs(diff(MaxSTARR_temp')), 2))*252;
        end
        if Data.Info.Optimisations(4)
        ResMaxSharpe_temp = zeros(Data.Info.nAssets, Data.Info.nWindows - nStartDays);
        ResMaxSharpe_temp(:,:) = Data.Optimisation.ResMaxSharpe.WeeklyWeights(1,:,:,StartDay);
        Data.Results.ResMaxSharpe.WeeklyaveTurnover(StartDay) = mean(mean(abs(diff(ResMaxSharpe_temp')), 2))*252;
        end
        if Data.Info.Optimisations(5)
        ResMinCVaR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows - nStartDays);
        ResMinCVaR_temp(:,:) = Data.Optimisation.ResMinCVaR.WeeklyWeights(1,:,:,StartDay);
        Data.Results.ResMinCVaR.WeeklyaveTurnover(StartDay) = mean(mean(abs(diff(ResMinCVaR_temp')), 2))*252;
        end
        if Data.Info.Optimisations(6)
        ResMaxSTARR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows - nStartDays);
        ResMaxSTARR_temp(:,:) = Data.Optimisation.ResMaxSTARR.WeeklyWeights(1,:,:,StartDay);
        Data.Results.ResMaxSTARR.WeeklyaveTurnover(StartDay) = mean(mean(abs(diff(ResMaxSTARR_temp')), 2))*252;
        end
    end
end

