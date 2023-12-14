function [Data] = WeeklyPortVaRCVaR(Data)
    Data.Results.Bench.VaR = zeros(1, Data.Info.nStartDays);
    Data.Results.Bench.CVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.BenchEQW.VaR = zeros(1, Data.Info.nStartDays);
    Data.Results.BenchEQW.CVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSharpe.WeeklyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSharpe.WeeklyCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MinCVaR.WeeklyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MinCVaR.WeeklyCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSTARR.WeeklyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSTARR.WeeklyCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.WeeklyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.WeeklyCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.WeeklyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.WeeklyCVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.WeeklyVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.WeeklyCVaR = zeros(1, Data.Info.nStartDays);
    for StartDay = 1:Data.Info.nStartDays
        [Data.Results.Bench.VaR(StartDay), Data.Results.Bench.CVaR(StartDay)] = CVaR(Data.Results.Bench.Returns, Data.Info.sigLevel, Data.Info.nWindows, Data);
        [Data.Results.BenchEQW.VaR(StartDay), Data.Results.BenchEQW.CVaR(StartDay)] = CVaR(Data.Results.BenchEQW.Returns, Data.Info.sigLevel, Data.Info.nWindows, Data);
        if Data.Info.Optimisations(1)
        [Data.Results.MaxSharpe.WeeklyVaR(StartDay), Data.Results.MaxSharpe.WeeklyCVaR(StartDay)] = CVaR(Data.Results.MaxSharpe.WeeklyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(2)
        [Data.Results.MinCVaR.WeeklyVaR(StartDay), Data.Results.MinCVaR.WeeklyCVaR(StartDay)] = CVaR(Data.Results.MinCVaR.WeeklyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(3)
        [Data.Results.MaxSTARR.WeeklyVaR(StartDay), Data.Results.MaxSTARR.WeeklyCVaR(StartDay)] = CVaR(Data.Results.MaxSTARR.WeeklyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(4)
        [Data.Results.ResMaxSharpe.WeeklyVaR(StartDay), Data.Results.ResMaxSharpe.WeeklyCVaR(StartDay)] = CVaR(Data.Results.ResMaxSharpe.WeeklyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(5)
        [Data.Results.ResMinCVaR.WeeklyVaR(StartDay), Data.Results.ResMinCVaR.WeeklyCVaR(StartDay)] = CVaR(Data.Results.ResMinCVaR.WeeklyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(6)
        [Data.Results.ResMaxSTARR.WeeklyVaR(StartDay), Data.Results.ResMaxSTARR.WeeklyCVaR(StartDay)] = CVaR(Data.Results.ResMaxSTARR.WeeklyReturns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
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

