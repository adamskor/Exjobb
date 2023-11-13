function [Data] = FormatData()
    %DATA Summary of this function goes here
    %   Detailed explanation goes here
    in_sample_size = 3290;
    T_table = readtable("Data.xlsx");
    T_matrix = readmatrix("Data.xlsx");
    assets = ["AIRP", "BRKa", "CPRI", "COLOb", "DGE", "EL", "GEBN", "HEIN", "HRMS", "KNEBV", ...
              "LIN", "OREP", "LVMH", "MKL", "MCO", "MTXGn", "NESN", "RCOP", "SCHP", "SP"];
    dates = T_table(3:10910, 3);
    prices = T_matrix(3:4755, 4:23);
    for t = 1:size(prices,2)
        prices(:,t) = fillmissing(prices(:,t), 'linear'); 
        prices(:,t) = flip(prices(:,t));
    end
    returns = zeros(size(prices,1)-1, size(prices,2));
    log_returns = zeros(size(prices,1)-1, size(prices,2));
    for asset = 1:size(prices,2)
        for t = 2:size(prices,1)
            returns(t-1, asset) = (prices(t, asset) - prices(t-1, asset))/prices(t-1, asset);
            log_returns(t-1, asset) = log(prices(t, asset)/prices(t-1, asset));
        end
    end
    Data.TimeSeries.Prices = prices;
    Data.TimeSeries.Returns = returns;
    Data.TimeSeries.LogReturns = log_returns;
    Data.TimeSeries.Dates = dates;
    Data.TimeSeries.eps = returns - mean(returns);
    Data.TimeSeries.epsLog = log_returns - mean(log_returns);
    
    Data.TimeSeriesIS.Prices = prices(1:in_sample_size,:);
    Data.TimeSeriesIS.Returns = returns(1:in_sample_size,:);
    Data.TimeSeriesIS.LogReturns = log_returns(1:in_sample_size,:);
    Data.TimeSeriesIS.Dates = dates(1:in_sample_size,:);
    Data.TimeSeriesIS.eps = returns(1:in_sample_size,:) - mean(returns(1:in_sample_size,:));
    Data.TimeSeriesIS.epsLog = log_returns(1:in_sample_size,:) - mean(log_returns(1:in_sample_size,:));
    
    
    Data.TimeSeriesOOS.Prices = prices(in_sample_size + 1:end,:);
    Data.TimeSeriesOOS.Returns = returns(in_sample_size + 1:end,:);
    Data.TimeSeriesOOS.LogReturns = log_returns(in_sample_size + 1:end,:);
    Data.TimeSeriesOOS.Dates = dates(in_sample_size + 1:end,:);
    Data.TimeSeriesOOS.eps = returns(in_sample_size + 1:end,:) - mean(returns(in_sample_size + 1:end,:));
    Data.TimeSeriesOOS.epsLog = log_returns(1:in_sample_size,:) - mean(log_returns(in_sample_size + 1:end,:));
    
    Data.Info.Assets = assets;
    Data.Info.Parameters.simSampleSize = 4752;
end

