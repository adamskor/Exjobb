function [z, params] = Gaussian(data)
    returns = data.returns;
    z = zeros(size(returns,1), size(returns,2));
    params = zeros(2, size(returns,2));
    for asset = 1:size(returns,2)
        pd = fitdist(returns(:, asset), 'Normal');
        params(1,asset) = pd.mu;
        params(2,asset) = pd.sigma;
        z(:, asset) = (returns(:, asset) - pd.mu)./pd.sigma;
    end
end

