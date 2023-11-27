function [Data] = PortAveTurnover(Data)
    Bench_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);    
    Data.Results.Bench.aveTurnover = mean(mean(abs(diff(Bench_temp')), 2))*252;
    
    if Data.Info.Optimisations(1)
    MaxSharpe_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    MaxSharpe_temp(:,:) = Data.Optimisation.MaxSharpe.Weights(1,:,:);
    Data.Results.MaxSharpe.aveTurnover = mean(mean(abs(diff(MaxSharpe_temp')), 2))*252;
    end
    if Data.Info.Optimisations(2)
    MinCVaR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    MinCVaR_temp(:,:) = Data.Optimisation.MinCVaR.Weights(1,:,:);
    Data.Results.MinCVaR.aveTurnover = mean(mean(abs(diff(MinCVaR_temp')), 2))*252;
    end
    if Data.Info.Optimisations(3)
    MaxSTARR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    MaxSTARR_temp(:,:) = Data.Optimisation.MaxSTARR.Weights(1,:,:);
    Data.Results.MaxSTARR.aveTurnover = mean(mean(abs(diff(MaxSTARR_temp')), 2))*252;
    end
    if Data.Info.Optimisations(4)
    ResMaxSharpe_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    ResMaxSharpe_temp(:,:) = Data.Optimisation.ResMaxSharpe.Weights(1,:,:);
    Data.Results.ResMaxSharpe.aveTurnover = mean(mean(abs(diff(ResMaxSharpe_temp')), 2))*252;
    end
    if Data.Info.Optimisations(5)
    ResMinCVaR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    ResMinCVaR_temp(:,:) = Data.Optimisation.ResMinCVaR.Weights(1,:,:);
    Data.Results.ResMinCVaR.aveTurnover = mean(mean(abs(diff(ResMinCVaR_temp')), 2))*252;
    end
    if Data.Info.Optimisations(6)
    ResMaxSTARR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    ResMaxSTARR_temp(:,:) = Data.Optimisation.ResMaxSTARR.Weights(1,:,:);
    Data.Results.ResMaxSTARR.aveTurnover = mean(mean(abs(diff(ResMaxSTARR_temp')), 2))*252;
    end
    
end

