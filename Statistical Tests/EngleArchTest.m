function [h_0, pValue] = EngleArchTest(Data, plotting)
    returns = Data.TimeSeries.allReturns;
    h_0 = zeros(1, size(returns, 2));
    pValue = zeros(1, size(returns, 2));
    res = zeros(size(returns, 1), size(returns, 2));
    for asset = 1:size(returns, 2)
        res(:, asset) = returns(:, asset) - mean(returns(:, asset));
        [h1,pValue1] = archtest(res(:, asset));
        h_0(asset) = h1;
        pValue(asset) = pValue1; 
    end
    if plotting
        h =  findobj('type','figure');
        n = length(h);
        figure(n + 1)
        subplot(2,2,1)
        plot(res(:,1))
        title(data.assets{1})
        subplot(2,2,2)
        plot(res(:,2))
        title(data.assets{2})
        subplot(2,2,3)
        plot(res(:,3))
        title(data.assets{3})
        subplot(2,2,4)
        plot(res(:,4))
        title(data.assets{4})
    end
end

