function [Data] = PortDailyWeights(Data)
    BenchWeights = zeros(1, Data.Info.nAssets, Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Optimisation.Bench.Weights = ones(1,Data.Info.nAssets)/Data.Info.nAssets;
    EQWBenchWeights = zeros(size(BenchWeights));
    MaxSharpeWeights = zeros(size(BenchWeights));
    MinCVaRWeights = zeros(size(BenchWeights));
    MaxSTARRWeights = zeros(size(BenchWeights));
    ResMaxSharpeWeights = zeros(size(BenchWeights));
    ResMinCVaRWeights = zeros(size(BenchWeights));
    ResMaxSTARRWeights = zeros(size(BenchWeights));
    for startDay = 1:Data.Info.nStartDays + 1
        BenchWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Optimisation.Bench.Weights.*ones(1,Data.Info.nAssets,Data.Info.nWindows - Data.Info.nStartDays);
        EQWBenchWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Info.Bench.Weights.*ones(1,Data.Info.nAssets,Data.Info.nWindows - Data.Info.nStartDays);
        if Data.Info.Optimisations(1)
        MaxSharpeWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Optimisation.MaxSharpe.Weights(1, :, startDay:Data.Info.nWindows - Data.Info.nStartDays + startDay - 1);
        end
        if Data.Info.Optimisations(2)
        MinCVaRWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Optimisation.MinCVaR.Weights(1, :, startDay:Data.Info.nWindows - Data.Info.nStartDays + startDay - 1);
        end
        if Data.Info.Optimisations(3)
        MaxSTARRWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Optimisation.MaxSTARR.Weights(1, :, startDay:Data.Info.nWindows - Data.Info.nStartDays + startDay - 1);
        end
        if Data.Info.Optimisations(4)
        ResMaxSharpeWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Optimisation.ResMaxSharpe.Weights(1, :, startDay:Data.Info.nWindows - Data.Info.nStartDays + startDay - 1);
        end
        if Data.Info.Optimisations(5)
        ResMinCVaRWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Optimisation.ResMinCVaR.Weights(1, :, startDay:Data.Info.nWindows - Data.Info.nStartDays + startDay - 1);
        end
        if Data.Info.Optimisations(6)
        ResMaxSTARRWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Optimisation.ResMaxSTARR.Weights(1, :, startDay:Data.Info.nWindows - Data.Info.nStartDays + startDay - 1);
        end
    end
    Data.Optimisation.BenchEQW.oneDayWeights = EQWBenchWeights;
    Data.Optimisation.Bench.oneDayWeights = BenchWeights;
    if Data.Info.Optimisations(1)
    Data.Optimisation.MaxSharpe.oneDayWeights = MaxSharpeWeights; end
    if Data.Info.Optimisations(2)
    Data.Optimisation.MinCVaR.oneDayWeights = MinCVaRWeights; end
    if Data.Info.Optimisations(3)
    Data.Optimisation.MaxSTARR.oneDayWeights = MaxSTARRWeights; end
    if Data.Info.Optimisations(4)
    Data.Optimisation.ResMaxSharpe.oneDayWeights = ResMaxSharpeWeights; end
    if Data.Info.Optimisations(5)
    Data.Optimisation.ResMinCVaR.oneDayWeights = ResMinCVaRWeights; end
    if Data.Info.Optimisations(6)
    Data.Optimisation.ResMaxSTARR.oneDayWeights = ResMaxSTARRWeights; end

    
    
    





end

