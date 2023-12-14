function [Data] = ExcessReturns(Sigma, Data)
    %%% Placeholder for index returns will be first asset with some noise
    Pi = zeros(1, size(Sigma, 2), size(Sigma, 3));
    for window = 1:size(Sigma, 3)
        returns = Data.TimeSeries.Returns(:, :, window);
        marketReturns = Data.TimeSeries.MSCI(:, 1, window);
        numAssets = size(returns,2);
        LB = zeros(1,numAssets);
        Aeq = ones(1,numAssets);
        Beq = 1;
        opts = optimoptions('lsqlin','Algorithm','interior-point', 'Display',"off");
        wtsMarket = lsqlin(returns, marketReturns, [], [], Aeq, Beq, LB, [], [], opts);
        %shpr = mean(marketReturns)/std(marketReturns);
        shpr = 0.5/(sqrt(252));
        delta = (shpr)/(sqrt(wtsMarket'*Sigma(:,:,window)*wtsMarket));
        Pi(1, :, window) = delta*Sigma(:,:,window)*wtsMarket;
        Data.BL.Pi = Pi;
    end
    
end

