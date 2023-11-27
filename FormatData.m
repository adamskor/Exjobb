function [Data] = FormatData(Data)
    %DATA Summary of this function goes here
    %   Detailed explanation goes here
    
    choice = menu("Are you sure? Data will be lost ","Yes","No");
    if choice == 2
        Data = Data;
        return
    end
    close all
    clearvars
    fac = 1.3848;
    Data.Info.Bench.Weights = 
    temp = [2.64, 6.19, 2.19, 4.75, 2.61, 3.99, 5.22, 6.07, 5.88, 10.01, 6.57, 4.55, 5.96, 5.47]/100;
    factor = 1/sum(temp);
    Data.Info.Bench.Weights = factor*temp;
    in_sample_size = 3290;
    window_size = 1000;
    Data.Info.sigLevel = 0.99;
    Data.Info.Parameters.simSampleSize = 10000;
    T_table = readtable("Data_new2.xlsx");
    T_matrix = readmatrix("Data_new2.xlsx");
    assets = ["AIRP", "CPR", "COLOb", "DGE", "GEBN", "HEIN", "HRMS", "KNEBV", ...
               "OREP", "LVMH",  "MTXGn", "NESN", "RCOP", "SCHP"];
    dates = T_table(3:10910, 3);
    prices = T_matrix(3:4755, 4:17);
    T_matrix2 = readmatrix("Data_new2.xlsx", 'Sheet', 'Daily Index');
    index = T_matrix2(3:4755, 4);
    rf_rate = T_matrix2(3:4755, 6)/100;
    
    for t = 1:size(prices,2)
        prices(:,t) = fillmissing(prices(:,t), 'linear'); 
        prices(:,t) = flip(prices(:,t));
        index = fillmissing(index, 'linear'); 
        index = flip(index);
        rf_rate= fillmissing(rf_rate, 'linear'); 
        rf_rate_temp = flip(rf_rate);
        
    end
    %prices = prices(1:1010, :);
    Data.Info.nWindows = size(prices, 1) - window_size;
    Data.Info.WindowSize = window_size;
    Data.Info.nAssets = size(prices,2);
    Data.Info.Optimisations = [1 1 1 1 1 1 ];
    returns = zeros(window_size, size(prices,2), size(prices,1)-1 -window_size);
    index_returns = zeros(window_size, 1, size(prices,1)-1 -window_size);
    rf_rate = zeros(window_size, 1, size(prices,1)-1 -window_size);
    
    
    log_returns = zeros(window_size, size(prices,2), size(prices,1)-1 -window_size);
    returns_temp = zeros(size(prices,1)-1, size(prices,2));
    index_returns_temp = zeros(size(prices,1)-1, 1);
    log_returns_temp = zeros(size(prices,1)-1, size(prices,2));
    for asset = 1:size(prices,2)
        for t = 2:size(prices,1)
            returns_temp(t-1, asset, 1) = (prices(t, asset) - prices(t-1, asset))/prices(t-1, asset);
            index_returns_temp(t-1, 1) = (index(t) - index(t-1))/index(t-1);
            log_returns_temp(t-1, asset, 1) = log(prices(t, asset)/prices(t-1, asset));
        end
    end
    
    Data.TimeSeries.mu_0 = mean(index_returns_temp);
    
    window = 1;
    for i = window_size:size(returns_temp,1)
        returns(1:window_size, :, window) = returns_temp(i-(window_size-1):i, :);
        index_returns(1:window_size, :, window) = index_returns_temp(i-(window_size-1):i, :);
        rf_rate(1:window_size, :, window) = rf_rate_temp(i-(window_size-1):i, :);
        
        window = window + 1;
    end
    
    Data.TimeSeries.allReturns = returns_temp - rf_rate_temp(1:4752);
    
    Data.TimeSeries.Prices = prices;
    Data.TimeSeries.RFrate = rf_rate/360;
    Data.TimeSeries.MSCI = index_returns;
    Data.TimeSeries.Returns = returns - Data.TimeSeries.RFrate;
    Data.TimeSeries.LogReturns = log_returns;
    Data.TimeSeries.Dates = dates;
    Data.TimeSeries.eps = returns - mean(returns);
    Data.TimeSeries.epsLog = log_returns - mean(log_returns);
    Data.Info.minInvest = 0.01;
    Data.Info.turnoverLimit = 0.001;
    Data.TimeSeries.meanCVaR = 8.233998e-02;
    %Data.TimeSeries.mu_0 = mean(MSCI);
    
%     Data.TimeSeriesIS.Prices = prices(1:in_sample_size,:);
%     Data.TimeSeriesIS.Returns = returns(1:in_sample_size,:);
%     Data.TimeSeriesIS.LogReturns = log_returns(1:in_sample_size,:);
%     Data.TimeSeriesIS.Dates = dates(1:in_sample_size,:);
%     Data.TimeSeriesIS.eps = returns(1:in_sample_size,:) - mean(returns(1:in_sample_size,:));
%     Data.TimeSeriesIS.epsLog = log_returns(1:in_sample_size,:) - mean(log_returns(1:in_sample_size,:));
%     
%     
%     Data.TimeSeriesOOS.Prices = prices(in_sample_size + 1:end,:);
%     Data.TimeSeriesOOS.Returns = returns(in_sample_size + 1:end,:);
%     Data.TimeSeriesOOS.LogReturns = log_returns(in_sample_size + 1:end,:);
%     Data.TimeSeriesOOS.Dates = dates(in_sample_size + 1:end,:);
%     Data.TimeSeriesOOS.eps = returns(in_sample_size + 1:end,:) - mean(returns(in_sample_size + 1:end,:));
%     Data.TimeSeriesOOS.epsLog = log_returns(1:in_sample_size,:) - mean(log_returns(in_sample_size + 1:end,:));
    
    Data.Info.Assets = assets;
    %Data.Info.Parameters.simSampleSize = 10000;
    
end

