function [prices, returns, dates, assets] = FormatData()
    %DATA Summary of this function goes here
    %   Detailed explanation goes here
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
    for asset = 1:size(prices,2)
        for t = 2:size(prices,1)
            returns(t-1, asset) = (prices(t, asset) - prices(t-1, asset))/prices(t-1, asset);
        end
    end
    
    
end

