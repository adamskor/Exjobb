function [Data] = PortVaRCVaR(Data)
    Data.Results.Bench.VaR = zeros(1, Data.Info.nStartDays);
    Data.Results.Bench.CVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.BenchEQW.VaR = zeros(1, Data.Info.nStartDays);
    Data.Results.BenchEQW.CVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSharpe.VaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSharpe.CVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MinCVaR.VaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MinCVaR.CVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSTARR.VaR = zeros(1, Data.Info.nStartDays);
    Data.Results.MaxSTARR.CVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.VaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSharpe.CVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.VaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMinCVaR.CVaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.VaR = zeros(1, Data.Info.nStartDays);
    Data.Results.ResMaxSTARR.CVaR = zeros(1, Data.Info.nStartDays);
    for StartDay = 1:Data.Info.nStartDays
        [Data.Results.Bench.VaR(StartDay), Data.Results.Bench.CVaR(StartDay)] = CVaR(Data.Results.Bench.Returns, Data.Info.sigLevel, Data.Info.nWindows, Data);
        [Data.Results.BenchEQW.VaR(StartDay), Data.Results.BenchEQW.CVaR(StartDay)] = CVaR(Data.Results.BenchEQW.Returns, Data.Info.sigLevel, Data.Info.nWindows, Data);
        if Data.Info.Optimisations(1)
        [Data.Results.MaxSharpe.VaR(StartDay), Data.Results.MaxSharpe.CVaR(StartDay)] = CVaR(Data.Results.MaxSharpe.Returns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(2)
        [Data.Results.MinCVaR.VaR(StartDay), Data.Results.MinCVaR.CVaR(StartDay)] = CVaR(Data.Results.MinCVaR.Returns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(3)
        [Data.Results.MaxSTARR.VaR(StartDay), Data.Results.MaxSTARR.CVaR(StartDay)] = CVaR(Data.Results.MaxSTARR.Returns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(4)
        [Data.Results.ResMaxSharpe.VaR(StartDay), Data.Results.ResMaxSharpe.CVaR(StartDay)] = CVaR(Data.Results.ResMaxSharpe.Returns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(5)
        [Data.Results.ResMinCVaR.VaR(StartDay), Data.Results.ResMinCVaR.CVaR(StartDay)] = CVaR(Data.Results.ResMinCVaR.Returns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
        end
        if Data.Info.Optimisations(6)
        [Data.Results.ResMaxSTARR.VaR(StartDay), Data.Results.ResMaxSTARR.CVaR(StartDay)] = CVaR(Data.Results.ResMaxSTARR.Returns(:, StartDay), Data.Info.sigLevel, Data.Info.nWindows, Data);
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

