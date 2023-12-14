function [Data] = QuartPortAveTurnover(Data)
    Bench_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);    
    Data.Results.Bench.aveTurnover = mean(mean(abs(diff(Bench_temp')), 2))*252;
    nStartDays = Data.Info.nStartDays;
    for StartDay = 1:nStartDays
        if Data.Info.Optimisations(1)
        MaxSharpe_temp = zeros(Data.Info.nAssets, size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3));
        MaxSharpe_temp(:,:) = Data.Optimisation.MaxSharpe.QuartWeights(1,:,:,StartDay);
        Data.Results.MaxSharpe.QuartaveTurnover(StartDay) = mean(mean(abs(diff(MaxSharpe_temp')), 2))*252;
        end
        if Data.Info.Optimisations(2)
        MinCVaR_temp = zeros(Data.Info.nAssets, size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3));
        MinCVaR_temp(:,:) = Data.Optimisation.MinCVaR.QuartWeights(1,:,:,StartDay);
        Data.Results.MinCVaR.QuartaveTurnover(StartDay) = mean(mean(abs(diff(MinCVaR_temp')), 2))*252;
        end
        if Data.Info.Optimisations(3)
        MaxSTARR_temp = zeros(Data.Info.nAssets, size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3));
        MaxSTARR_temp(:,:) = Data.Optimisation.MaxSTARR.QuartWeights(1,:,:,StartDay);
        Data.Results.MaxSTARR.QuartaveTurnover(StartDay) = mean(mean(abs(diff(MaxSTARR_temp')), 2))*252;
        end
        if Data.Info.Optimisations(4)
        ResMaxSharpe_temp = zeros(Data.Info.nAssets, size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3));
        ResMaxSharpe_temp(:,:) = Data.Optimisation.ResMaxSharpe.QuartWeights(1,:,:,StartDay);
        Data.Results.ResMaxSharpe.QuartaveTurnover(StartDay) = mean(mean(abs(diff(ResMaxSharpe_temp')), 2))*252;
        end
        if Data.Info.Optimisations(5)
        ResMinCVaR_temp = zeros(Data.Info.nAssets, size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3));
        ResMinCVaR_temp(:,:) = Data.Optimisation.ResMinCVaR.QuartWeights(1,:,:,StartDay);
        Data.Results.ResMinCVaR.QuartaveTurnover(StartDay) = mean(mean(abs(diff(ResMinCVaR_temp')), 2))*252;
        end
        if Data.Info.Optimisations(6)
        ResMaxSTARR_temp = zeros(Data.Info.nAssets, size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3));
        ResMaxSTARR_temp(:,:) = Data.Optimisation.ResMaxSTARR.QuartWeights(1,:,:,StartDay);
        Data.Results.ResMaxSTARR.QuartaveTurnover(StartDay) = mean(mean(abs(diff(ResMaxSTARR_temp')), 2))*252;
        end
    end
end

