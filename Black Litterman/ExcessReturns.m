function [Pi] = ExcessReturns(Sigma, Data)
    %%% Placeholder for index returns will be first asset with some noise
    returns = Data.TimeSeries.Returns;
    noise = normrnd(0,0.01,size(returns, 1),1);
    marketReturns = returns(:,5) + noise;
    numAssets = size(returns,2);
    LB = zeros(1,numAssets);
    Aeq = ones(1,numAssets);
    Beq = 1;
    opts = optimoptions('lsqlin','Algorithm','interior-point', 'Display',"off");
    wtsMarket = lsqlin(returns, marketReturns, [], [], Aeq, Beq, LB, [], [], opts);
    shpr = mean(marketReturns)/std(marketReturns);
    delta = shpr/sqrt(wtsMarket'*Sigma*wtsMarket);
    Pi = delta*Sigma*wtsMarket;
    Pi = Pi;
end

