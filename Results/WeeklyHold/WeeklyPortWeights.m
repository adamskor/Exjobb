function [Data] = WeeklyPortWeights(Data)
    BenchWeights = zeros(1, Data.Info.nAssets, Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Optimisation.Bench.Weights = ones(1,Data.Info.nAssets)/Data.Info.nAssets;
    EQWBenchWeights = zeros(size(BenchWeights));
    WeeklyMaxSharpeWeights = zeros(size(BenchWeights));
    WeeklyMinCVaRWeights = zeros(size(BenchWeights));
    WeeklyMaxSTARRWeights = zeros(size(BenchWeights));
    WeeklyResMaxSharpeWeights = zeros(size(BenchWeights));
    WeeklyResMinCVaRWeights = zeros(size(BenchWeights));
    WeeklyResMaxSTARRWeights = zeros(size(BenchWeights));

    for startDay = 1:Data.Info.nStartDays + 1
        for hold = 5:5:Data.Info.nWindows - Data.Info.nStartDays
            disp(hold)
        BenchWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Optimisation.Bench.Weights.*ones(1,Data.Info.nAssets,Data.Info.nWindows - Data.Info.nStartDays);
        EQWBenchWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Info.Bench.Weights.*ones(1,Data.Info.nAssets,Data.Info.nWindows - Data.Info.nStartDays);
        if Data.Info.Optimisations(1)
        WeeklyMaxSharpeWeights(1, :, 1 + hold - 5:hold , startDay) = Data.Optimisation.MaxSharpe.Weights(1, :, startDay + hold - 5).*ones(1,1,5);
        end
        if Data.Info.Optimisations(2)
        WeeklyMinCVaRWeights(1, :, 1 + hold - 5:hold , startDay) = Data.Optimisation.MinCVaR.Weights(1, :, startDay + hold - 5).*ones(1,1,5);
        end
        if Data.Info.Optimisations(3)
        WeeklyMaxSTARRWeights(1, :, 1 + hold - 5:hold , startDay) = Data.Optimisation.MaxSTARR.Weights(1, :, startDay + hold - 5).*ones(1,1,5);
        end
        if Data.Info.Optimisations(4)
        WeeklyResMaxSharpeWeights(1, :, 1 + hold - 5:hold , startDay) = Data.Optimisation.ResMaxSharpe.Weights(1, :, startDay + hold - 5).*ones(1,1,5);
        end
        if Data.Info.Optimisations(5)
        WeeklyResMinCVaRWeights(1, :, 1 + hold - 5:hold , startDay) = Data.Optimisation.ResMinCVaR.Weights(1, :, startDay + hold - 5).*ones(1,1,5);
        end
        if Data.Info.Optimisations(6)
        WeeklyResMaxSTARRWeights(1, :, 1 + hold - 5:hold , startDay) = Data.Optimisation.ResMaxSTARR.Weights(1, :, startDay + hold - 5).*ones(1,1,5);
        end
        end
%         WeeklyMaxSharpeWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.MaxSharpe.Weights(1, :, startDay + hold - 5 + 1).*ones(1,1,35);
%         WeeklyMinCVaRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.MinCVaR.Weights(1, :, startDay + hold - 5 + 1).*ones(1,1,35);
%         WeeklyMaxSTARRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.MaxSTARR.Weights(1, :, startDay + hold - 5 + 1).*ones(1,1,35);
%         WeeklyMaxSharpeWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.ResMaxSharpe.Weights(1, :, startDay + hold - 5 + 1).*ones(1,1,35);
%         WeeklyMinCVaRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.ResMinCVaR.Weights(1, :, startDay + hold - 5 + 1).*ones(1,1,35);
%         WeeklyMaxSTARRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.ResMaxSTARR.Weights(1, :, startDay + hold - 5 + 1).*ones(1,1,35);
    end
    Data.Optimisation.BenchEQW.WeeklyWeights = EQWBenchWeights;
    Data.Optimisation.Bench.WeeklyWeights = BenchWeights;
    if Data.Info.Optimisations(1)
    Data.Optimisation.MaxSharpe.WeeklyWeights = WeeklyMaxSharpeWeights; end
    if Data.Info.Optimisations(2)
    Data.Optimisation.MinCVaR.WeeklyWeights = WeeklyMinCVaRWeights; end
    if Data.Info.Optimisations(3)
    Data.Optimisation.MaxSTARR.WeeklyWeights = WeeklyMaxSTARRWeights; end
    if Data.Info.Optimisations(4)
    Data.Optimisation.ResMaxSharpe.WeeklyWeights = WeeklyResMaxSharpeWeights; end
    if Data.Info.Optimisations(5)
    Data.Optimisation.ResMinCVaR.WeeklyWeights = WeeklyResMinCVaRWeights; end
    if Data.Info.Optimisations(6)
    Data.Optimisation.ResMaxSTARR.WeeklyWeights = WeeklyResMaxSTARRWeights; end

    
    
    





end

