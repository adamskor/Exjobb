function [Data] = PortReturns(Data)
    Data.Results.Bench.Returns = zeros(Data.Info.nWindows, 1);
    Data.Results.MaxSharpe.Returns = zeros(Data.Info.nWindows, 1);
    Data.Results.ConMaxSharpe.Returns = zeros(Data.Info.nWindows, 1);
    Data.Results.MinCVaR.Returns = zeros(Data.Info.nWindows, 1);
    Data.Results.MaxSTARR.Returns = zeros(Data.Info.nWindows, 1);
    Data.Results.ConMaxSTARR.Returns = zeros(Data.Info.nWindows, 1);
    Data.Optimisation.Bench.Weights = (ones(1,Data.Info.nAssets)/Data.Info.nAssets);
    
    
    for i = 1:Data.Info.nWindows-1
        Data.Results.MaxSharpe.Returns(i + 1) = Data.Optimisation.MaxSharpe.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        Data.Results.ConMaxSharpe.Returns(i + 1) = Data.Optimisation.ConMaxSharpe.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        Data.Results.MinCVaR.Returns(i + 1) = Data.Optimisation.MinCVaR.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        Data.Results.MaxSTARR.Returns(i + 1) = Data.Optimisation.MaxSTARR.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        Data.Results.ConMaxSTARR.Returns(i + 1) = Data.Optimisation.ConMaxSTARR.Weights(1,:,i)*(Data.TimeSeries.Returns(1, :, i + 1))';
        Data.Results.Bench.Returns(i + 1) = Data.Optimisation.Bench.Weights*(Data.TimeSeries.Returns(1, :, i + 1))';     
        
    end
    Data.Results.Bench.AveReturns = mean(Data.Results.Bench.Returns);
    Data.Results.MaxSharpe.AveReturns = mean(Data.Results.MaxSharpe.Returns);
    Data.Results.ConMaxSharpe.AveReturns = mean(Data.Results.ConMaxSharpe.Returns);
    Data.Results.MinCVaR.AveReturns = mean(Data.Results.MinCVaR.Returns);
    Data.Results.MaxSTARR.AveReturns = mean(Data.Results.MaxSTARR.Returns);
    Data.Results.ConMaxSTARR.AveReturns = mean(Data.Results.ConMaxSTARR.Returns);
    
    Data.Results.Bench.STD = std(Data.Results.Bench.Returns);
    Data.Results.MaxSharpe.STD = std(Data.Results.MaxSharpe.Returns);
    Data.Results.ConMaxSharpe.STD = std(Data.Results.ConMaxSharpe.Returns);
    Data.Results.MinCVaR.STD = std(Data.Results.MinCVaR.Returns);
    Data.Results.MaxSTARR.STD = std(Data.Results.MaxSTARR.Returns);
    Data.Results.ConMaxSTARR.STD = std(Data.Results.ConMaxSTARR.Returns);
    
    Data.Results.Bench.Sharpe = mean(Data.Results.Bench.Returns - Data.TimeSeries.RFrate)/Data.Results.Bench.STD;
    Data.Results.MaxSharpe.Sharpe = mean(Data.Results.MaxSharpe.Returns - Data.TimeSeries.RFrate)/Data.Results.MaxSharpe.STD;
    Data.Results.ConMaxSharpe.Sharpe = mean(Data.Results.ConMaxSharpe.Returns - Data.TimeSeries.RFrate)/Data.Results.ConMaxSharpe.STD;
    Data.Results.MinCVaR.Sharpe = mean(Data.Results.MinCVaR.Returns - Data.TimeSeries.RFrate)/Data.Results.MinCVaR.STD;
    Data.Results.MaxSTARR.Sharpe = mean(Data.Results.MaxSTARR.Returns - Data.TimeSeries.RFrate)/Data.Results.MaxSTARR.STD;
    Data.Results.ConMaxSTARR.Sharpe = mean(Data.Results.ConMaxSTARR.Returns - Data.TimeSeries.RFrate)/Data.Results.ConMaxSTARR.STD;
    
    Data.Results.Bench.Sortino = sortino(Data.Results.Bench.Returns', Data.TimeSeries.RFrate(1));
    Data.Results.MaxSharpe.Sortino = sortino(Data.Results.MaxSharpe.Returns, Data.TimeSeries.RFrate(1));
    Data.Results.ConMaxSharpe.Sortino = sortino(Data.Results.ConMaxSharpe.Returns, Data.TimeSeries.RFrate(1));
    Data.Results.MinCVaR.Sortino = sortino(Data.Results.MinCVaR.Returns, Data.TimeSeries.RFrate(1));
    Data.Results.MaxSTARR.Sortino = sortino(Data.Results.MaxSTARR.Returns, Data.TimeSeries.RFrate(1));
    Data.Results.ConMaxSTARR.Sortino = sortino(Data.Results.ConMaxSTARR.Returns, Data.TimeSeries.RFrate(1));
    
    [Data.Results.Bench.VaR, Data.Results.Bench.CVaR] = CVaR(Data.Results.Bench.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    [Data.Results.MaxSharpe.VaR, Data.Results.MaxSharpe.CVaR] = CVaR(Data.Results.MaxSharpe.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    [Data.Results.ConMaxSharpe.VaR, Data.Results.ConMaxSharpe.CVaR] = CVaR(Data.Results.ConMaxSharpe.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    [Data.Results.MinCVaR.VaR, Data.Results.MinCVaR.CVaR] = CVaR(Data.Results.MinCVaR.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    [Data.Results.MaxSTARR.VaR, Data.Results.MaxSTARR.CVaR] = CVaR(Data.Results.MaxSTARR.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    [Data.Results.ConMaxSTARR.VaR, Data.Results.ConMaxSTARR.CVaR] = CVaR(Data.Results.ConMaxSTARR.Returns, Data.Info.sigLevel, Data.Info.nWindows);
    
    Data.Results.Bench.STARR = Data.Results.Bench.AveReturns/Data.Results.Bench.CVaR;
    Data.Results.MaxSharpe.STARR = Data.Results.MaxSharpe.AveReturns/Data.Results.MaxSharpe.CVaR;
    Data.Results.ConMaxSharpe.STARR = Data.Results.ConMaxSharpe.AveReturns/Data.Results.ConMaxSharpe.CVaR;
    Data.Results.MinCVaR.STARR = Data.Results.MinCVaR.AveReturns/Data.Results.MinCVaR.CVaR;
    Data.Results.MaxSTARR.STARR = Data.Results.MaxSTARR.AveReturns/Data.Results.MaxSTARR.CVaR;
    Data.Results.ConMaxSTARR.STARR = Data.Results.ConMaxSTARR.AveReturns/Data.Results.ConMaxSTARR.CVaR;
    
    Data.Results.Bench.meanVaR = Data.Results.Bench.AveReturns/Data.Results.Bench.VaR;
    Data.Results.MaxSharpe.meanVaR = Data.Results.MaxSharpe.AveReturns/Data.Results.MaxSharpe.VaR;
    Data.Results.ConMaxSharpe.meanVaR = Data.Results.ConMaxSharpe.AveReturns/Data.Results.ConMaxSharpe.VaR;
    Data.Results.MinCVaR.meanVaR = Data.Results.MinCVaR.AveReturns/Data.Results.MinCVaR.VaR;
    Data.Results.MaxSTARR.meanVaR = Data.Results.MaxSTARR.AveReturns/Data.Results.MaxSTARR.VaR;
    Data.Results.ConMaxSTARR.meanVaR = Data.Results.ConMaxSTARR.AveReturns/Data.Results.ConMaxSTARR.VaR;
    
    Bench_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    MaxSharpe_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    ConMaxSharpe_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    MinCVaR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    MaxSTARR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    ConMaxSTARR_temp = zeros(Data.Info.nAssets, Data.Info.nWindows);
    
    %Bench_temp(:,:) = Data.Optimisation.Bench.Weights(1,:,:);
    MaxSharpe_temp(:,:) = Data.Optimisation.MaxSharpe.Weights(1,:,:);
    ConMaxSharpe_temp(:,:) = Data.Optimisation.ConMaxSharpe.Weights(1,:,:);
    MinCVaR_temp(:,:) = Data.Optimisation.MinCVaR.Weights(1,:,:);
    MaxSTARR_temp(:,:) = Data.Optimisation.MaxSTARR.Weights(1,:,:);
    ConMaxSTARR_temp(:,:) = Data.Optimisation.ConMaxSTARR.Weights(1,:,:);
    
    Data.Results.Bench.aveTurnover = mean(mean(abs(diff(Bench_temp')), 2));
    Data.Results.MaxSharpe.aveTurnover = mean(mean(abs(diff(MaxSharpe_temp')), 2));
    Data.Results.ConMaxSharpe.aveTurnover = mean(mean(abs(diff(ConMaxSharpe_temp')), 2));
    Data.Results.MinCVaR.aveTurnover = mean(mean(abs(diff(MinCVaR_temp')), 2));
    Data.Results.MaxSTARR.aveTurnover = mean(mean(abs(diff(MaxSTARR_temp')), 2));
    Data.Results.ConMaxSTARR.aveTurnover = mean(mean(abs(diff(ConMaxSTARR_temp')), 2));
    
    
    function [VaR, val] = CVaR(portReturns, alpha, sampleSize) 
    portReturnsSort = sort(portReturns);
    VaR = -portReturnsSort(1 + floor((1 - alpha)*size(portReturnsSort, 1)));
    CVaR_temp = 0;
    for m = 1:sampleSize
        CVaR_temp = CVaR_temp + max((-portReturns(m,1) - VaR), 0);
    end
    val = VaR + 1/(sampleSize*(1 - alpha))*CVaR_temp;   
    end
end

