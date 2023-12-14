function [Data] = YearlyPortWeights(Data)
    BenchWeights = zeros(1, Data.Info.nAssets, Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Optimisation.Bench.Weights = ones(1,Data.Info.nAssets)/Data.Info.nAssets;
    EQWBenchWeights = zeros(size(BenchWeights));
    YearlyMaxSharpeWeights = zeros(size(BenchWeights));
    YearlyMinCVaRWeights = zeros(size(BenchWeights));
    YearlyMaxSTARRWeights = zeros(size(BenchWeights));
    YearlyResMaxSharpeWeights = zeros(size(BenchWeights));
    YearlyResMinCVaRWeights = zeros(size(BenchWeights));
    YearlyResMaxSTARRWeights = zeros(size(BenchWeights));

    for startDay = 1:Data.Info.nStartDays + 1
        for hold = 252:252:Data.Info.nWindows - Data.Info.nStartDays
            disp(hold)
        BenchWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Optimisation.Bench.Weights.*ones(1,Data.Info.nAssets,Data.Info.nWindows - Data.Info.nStartDays);
        EQWBenchWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Info.Bench.Weights.*ones(1,Data.Info.nAssets,Data.Info.nWindows - Data.Info.nStartDays);
        if Data.Info.Optimisations(1)
        YearlyMaxSharpeWeights(1, :, 1 + hold - 252:hold , startDay) = Data.Optimisation.MaxSharpe.Weights(1, :, startDay + hold - 252).*ones(1,1,252);
        end
        if Data.Info.Optimisations(2)
        YearlyMinCVaRWeights(1, :, 1 + hold - 252:hold , startDay) = Data.Optimisation.MinCVaR.Weights(1, :, startDay + hold - 252).*ones(1,1,252);
        end
        if Data.Info.Optimisations(3)
        YearlyMaxSTARRWeights(1, :, 1 + hold - 252:hold , startDay) = Data.Optimisation.MaxSTARR.Weights(1, :, startDay + hold - 252).*ones(1,1,252);
        end
        if Data.Info.Optimisations(4)
        YearlyResMaxSharpeWeights(1, :, 1 + hold - 252:hold , startDay) = Data.Optimisation.ResMaxSharpe.Weights(1, :, startDay + hold - 252).*ones(1,1,252);
        end
        if Data.Info.Optimisations(5)
        YearlyResMinCVaRWeights(1, :, 1 + hold - 252:hold , startDay) = Data.Optimisation.ResMinCVaR.Weights(1, :, startDay + hold - 252).*ones(1,1,252);
        end
        if Data.Info.Optimisations(6)
        YearlyResMaxSTARRWeights(1, :, 1 + hold - 252:hold , startDay) = Data.Optimisation.ResMaxSTARR.Weights(1, :, startDay + hold - 252).*ones(1,1,252);
        end
        end
        YearlyMaxSharpeWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.MaxSharpe.Weights(1, :, startDay + hold - 252 + 1).*ones(1,1,224);
        YearlyMinCVaRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.MinCVaR.Weights(1, :, startDay + hold - 252 + 1).*ones(1,1,224);
        YearlyMaxSTARRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.MaxSTARR.Weights(1, :, startDay + hold - 252 + 1).*ones(1,1,224);
        YearlyResMaxSharpeWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.ResMaxSharpe.Weights(1, :, startDay + hold - 252 + 1).*ones(1,1,224);
        YearlyResMinCVaRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.ResMinCVaR.Weights(1, :, startDay + hold - 252 + 1).*ones(1,1,224);
        YearlyResMaxSTARRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.ResMaxSTARR.Weights(1, :, startDay + hold - 252 + 1).*ones(1,1,224);
    end
    Data.Optimisation.BenchEQW.QuartWeights = EQWBenchWeights;
    Data.Optimisation.Bench.QuartWeights = BenchWeights;
    if Data.Info.Optimisations(1)
    Data.Optimisation.MaxSharpe.YearlyWeights = YearlyMaxSharpeWeights; end
    if Data.Info.Optimisations(2)
    Data.Optimisation.MinCVaR.YearlyWeights = YearlyMinCVaRWeights; end
    if Data.Info.Optimisations(3)
    Data.Optimisation.MaxSTARR.YearlyWeights = YearlyMaxSTARRWeights; end
    if Data.Info.Optimisations(4)
    Data.Optimisation.ResMaxSharpe.YearlyWeights = YearlyResMaxSharpeWeights; end
    if Data.Info.Optimisations(5)
    Data.Optimisation.ResMinCVaR.YearlyWeights = YearlyResMinCVaRWeights; end
    if Data.Info.Optimisations(6)
    Data.Optimisation.ResMaxSTARR.YearlyWeights = YearlyResMaxSTARRWeights; end

    
    
    





end

