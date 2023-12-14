function [Data] = QuartPortVaRCVaR(Data)
    Data.Results.MaxSharpe.QuartVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSharpe.QuartCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MinCVaR.QuartVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MinCVaR.QuartCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSTARR.QuartVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSTARR.QuartCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.QuartVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.QuartCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.QuartVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.QuartCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.QuartVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.QuartCVaR = zeros(1, Data.Info.nStartDays);
    for StartDay = 1:Data.Info.nStartDays
        if Data.Info.Optimisations(1)
        [Data.Results.MaxSharpe.QuartVaR(StartDay), Data.Results.MaxSharpe.QuartCVaR(StartDay)] = CVaR(Data.Results.MaxSharpe.QuartReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(2)
        [Data.Results.MinCVaR.QuartVaR(StartDay), Data.Results.MinCVaR.QuartCVaR(StartDay)] = CVaR(Data.Results.MinCVaR.QuartReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(3)
        [Data.Results.MaxSTARR.QuartVaR(StartDay), Data.Results.MaxSTARR.QuartCVaR(StartDay)] = CVaR(Data.Results.MaxSTARR.QuartReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(4)
        [Data.Results.ResMaxSharpe.QuartVaR(StartDay), Data.Results.ResMaxSharpe.QuartCVaR(StartDay)] = CVaR(Data.Results.ResMaxSharpe.QuartReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(5)
        [Data.Results.ResMinCVaR.QuartVaR(StartDay), Data.Results.ResMinCVaR.QuartCVaR(StartDay)] = CVaR(Data.Results.ResMinCVaR.QuartReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(6)
        [Data.Results.ResMaxSTARR.QuartVaR(StartDay), Data.Results.ResMaxSTARR.QuartCVaR(StartDay)] = CVaR(Data.Results.ResMaxSTARR.QuartReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
    end
    
    
    function [VaR, val] = CVaR(portReturns, alpha, sampleSize, Data) 
    sampleSize =size(Data.Optimisation.ResMaxSTARR.QuartWeights, 3);
    portReturnsSort = sort(portReturns);
    VaR = -portReturnsSort(1 + floor((1 - alpha)*size(portReturnsSort, 1)));
    CVaR_temp = 0;
    for m = 1:sampleSize
        CVaR_temp = CVaR_temp + max((-portReturns(m,1) - VaR), 0);
    end
    val = VaR + 1/(sampleSize*(1 - alpha))*CVaR_temp;   
    end
end

