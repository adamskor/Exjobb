function [Data] = PortWealth(Data)
    Data.Results.Bench.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.MaxSharpe.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.ConMaxSharpe.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.MinCVaR.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.MaxSTARR.Wealth = zeros(Data.Info.nWindows, 1);
    Data.Results.ConMaxSTARR.Wealth = zeros(Data.Info.nWindows, 1);
    
    Data.Results.Bench.Wealth(1) = 100;
    Data.Results.MaxSharpe.Wealth(1) = 100;
    Data.Results.ConMaxSharpe.Wealth(1) = 100;
    Data.Results.MinCVaR.Wealth(1) = 100;
    Data.Results.MaxSTARR.Wealth(1) = 100;
    Data.Results.ConMaxSTARR.Wealth(1) = 100;
    for i = 1:Data.Info.nWindows-1
        Data.Results.MaxSharpe.Wealth(i + 1) = Data.Results.MaxSharpe.Wealth(i)*Data.Optimisation.MaxSharpe.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        Data.Results.ConMaxSharpe.Wealth(i + 1) = Data.Results.ConMaxSharpe.Wealth(i)*Data.Optimisation.ConMaxSharpe.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        Data.Results.MinCVaR.Wealth(i + 1) = Data.Results.MinCVaR.Wealth(i)*Data.Optimisation.MinCVaR.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        Data.Results.MaxSTARR.Wealth(i + 1) = Data.Results.MaxSTARR.Wealth(i)*Data.Optimisation.MaxSTARR.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        Data.Results.ConMaxSTARR.Wealth(i + 1) = Data.Results.ConMaxSTARR.Wealth(i)*Data.Optimisation.ConMaxSTARR.Weights(1,:,i)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
        Data.Results.Bench.Wealth(i + 1) = Data.Results.Bench.Wealth(i)*(ones(1,20)/20)*(1 + Data.TimeSeries.Returns(1, :, i + 1))';
    end
end

