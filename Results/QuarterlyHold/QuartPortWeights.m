 function [Data] = QuartPortWeights(Data)
    BenchWeights = zeros(1, Data.Info.nAssets, Data.Info.nWindows - Data.Info.nStartDays, Data.Info.nStartDays);
    Data.Optimisation.Bench.Weights = ones(1,Data.Info.nAssets)/Data.Info.nAssets;
    EQWBenchWeights = zeros(size(BenchWeights));
    QuartMaxSharpeWeights = zeros(size(BenchWeights));
    QuartMinCVaRWeights = zeros(size(BenchWeights));
    QuartMaxSTARRWeights = zeros(size(BenchWeights));
    QuartResMaxSharpeWeights = zeros(size(BenchWeights));
    QuartResMinCVaRWeights = zeros(size(BenchWeights));
    QuartResMaxSTARRWeights = zeros(size(BenchWeights));

    for startDay = 1:Data.Info.nStartDays + 1
        for hold = 63:63:Data.Info.nWindows - Data.Info.nStartDays
            disp(hold)
        BenchWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Optimisation.Bench.Weights.*ones(1,Data.Info.nAssets,Data.Info.nWindows - Data.Info.nStartDays);
        EQWBenchWeights(1, :, 1:Data.Info.nWindows - Data.Info.nStartDays, startDay) = Data.Info.Bench.Weights.*ones(1,Data.Info.nAssets,Data.Info.nWindows - Data.Info.nStartDays);
        if Data.Info.Optimisations(1)
        QuartMaxSharpeWeights(1, :, 1 + hold - 63:hold , startDay) = Data.Optimisation.MaxSharpe.Weights(1, :, startDay + hold - 63).*ones(1,1,63);
        end
        if Data.Info.Optimisations(2)
        QuartMinCVaRWeights(1, :, 1 + hold - 63:hold , startDay) = Data.Optimisation.MinCVaR.Weights(1, :, startDay + hold - 63).*ones(1,1,63);
        end
        if Data.Info.Optimisations(3)
        QuartMaxSTARRWeights(1, :, 1 + hold - 63:hold , startDay) = Data.Optimisation.MaxSTARR.Weights(1, :, startDay + hold - 63).*ones(1,1,63);
        end
        if Data.Info.Optimisations(4)
        QuartResMaxSharpeWeights(1, :, 1 + hold - 63:hold , startDay) = Data.Optimisation.ResMaxSharpe.Weights(1, :, startDay + hold - 63).*ones(1,1,63);
        end
        if Data.Info.Optimisations(5)
        QuartResMinCVaRWeights(1, :, 1 + hold - 63:hold , startDay) = Data.Optimisation.ResMinCVaR.Weights(1, :, startDay + hold - 63).*ones(1,1,63);
        end
        if Data.Info.Optimisations(6)
        QuartResMaxSTARRWeights(1, :, 1 + hold - 63:hold , startDay) = Data.Optimisation.ResMaxSTARR.Weights(1, :, startDay + hold - 63).*ones(1,1,63);
        end
        end
        if Data.Info.Optimisations(1)
        QuartMaxSharpeWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.MaxSharpe.Weights(1, :, startDay + hold - 63 + 1).*ones(1,1,35); end;
        if Data.Info.Optimisations(2)
        QuartMinCVaRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.MinCVaR.Weights(1, :, startDay + hold - 63 + 1).*ones(1,1,35); end;
        if Data.Info.Optimisations(3)
        QuartMaxSTARRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.MaxSTARR.Weights(1, :, startDay + hold - 63 + 1).*ones(1,1,35); end;
        if Data.Info.Optimisations(4)
        QuartMaxSharpeWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.ResMaxSharpe.Weights(1, :, startDay + hold - 63 + 1).*ones(1,1,35); end;
        if Data.Info.Optimisations(5)
        QuartMinCVaRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.ResMinCVaR.Weights(1, :, startDay + hold - 63 + 1).*ones(1,1,35); end;
        if Data.Info.Optimisations(6)
        QuartMaxSTARRWeights(1, :, 1 + hold:end , startDay) = Data.Optimisation.ResMaxSTARR.Weights(1, :, startDay + hold - 63 + 1).*ones(1,1,35); end;
    end
    Data.Optimisation.BenchEQW.QuartWeights = EQWBenchWeights;
    Data.Optimisation.Bench.QuartWeights = BenchWeights;
    Data.Optimisation.MaxSharpe.QuartWeights = QuartMaxSharpeWeights(:, :, 1:3466, :);
    Data.Optimisation.MinCVaR.QuartWeights = QuartMinCVaRWeights(:, :, 1:3466, :);
    Data.Optimisation.MaxSTARR.QuartWeights = QuartMaxSTARRWeights(:, :, 1:3466, :);
    Data.Optimisation.ResMaxSharpe.QuartWeights = QuartResMaxSharpeWeights(:, :, 1:3466, :);
    Data.Optimisation.ResMinCVaR.QuartWeights = QuartResMinCVaRWeights(:, :, 1:3466, :);
    Data.Optimisation.ResMaxSTARR.QuartWeights = QuartResMaxSTARRWeights(:, :, 1:3466, :);

    
    
    





end

