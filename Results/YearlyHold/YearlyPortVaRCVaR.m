function [Data] = YearlyPortVaRCVaR(Data)
    Data.Results.MaxSharpe.YearlyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSharpe.YearlyCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MinCVaR.YearlyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MinCVaR.YearlyCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSTARR.YearlyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSTARR.YearlyCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.YearlyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.YearlyCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.YearlyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.YearlyCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.YearlyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.YearlyCVaR = zeros(1, Data.Info.nStartDays);
    for StartDay = 1:Data.Info.nStartDays
  
        if Data.Info.Optimisations(1)
        [Data.Results.MaxSharpe.YearlyVaR(StartDay), Data.Results.MaxSharpe.YearlyCVaR(StartDay)] = CVaR(Data.Results.MaxSharpe.YearlyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(2)
        [Data.Results.MinCVaR.YearlyVaR(StartDay), Data.Results.MinCVaR.YearlyCVaR(StartDay)] = CVaR(Data.Results.MinCVaR.YearlyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(3)
        [Data.Results.MaxSTARR.YearlyVaR(StartDay), Data.Results.MaxSTARR.YearlyCVaR(StartDay)] = CVaR(Data.Results.MaxSTARR.YearlyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(4)
        [Data.Results.ResMaxSharpe.YearlyVaR(StartDay), Data.Results.ResMaxSharpe.YearlyCVaR(StartDay)] = CVaR(Data.Results.ResMaxSharpe.YearlyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(5)
        [Data.Results.ResMinCVaR.YearlyVaR(StartDay), Data.Results.ResMinCVaR.YearlyCVaR(StartDay)] = CVaR(Data.Results.ResMinCVaR.YearlyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(6)
        [Data.Results.ResMaxSTARR.YearlyVaR(StartDay), Data.Results.ResMaxSTARR.YearlyCVaR(StartDay)] = CVaR(Data.Results.ResMaxSTARR.YearlyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
    end
    
    
    function [VaR, val] = CVaR(portReturns, alpha, sampleSize, Data) 
    sampleSize = sampleSize - Data.Info.nStartDays;
    portReturnsSort = sort(portReturns);
    VaR = -portReturnsSort(1 + floor((1 - alpha)*size(portReturnsSort, 1)));
    CVaR_temp = 0;
    for m = 1:sampleSize
        CVaR_temp = CVaR_temp + max((-portReturns(m,1) - VaR), 0);
    end
    val = VaR + 1/(sampleSize*(1 - alpha))*CVaR_temp;   
    end
end

