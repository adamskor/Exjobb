function [z, params] = Student_t(data)
    returns = data.returns;
    z = zeros(size(returns,1), size(returns,2));
    params = zeros(3, size(returns,2));
    for asset = 1:size(returns,2)
        pd = fitdist(returns(:, asset), 'tLocationScale');
        params(1,asset) = pd.mu;
        params(2,asset) = pd.sigma;
        params(3,asset) = pd.nu;
        var = pd.sigma^2*(pd.nu/(pd.nu-2));
        z(:, asset) = (returns(:, asset) - pd.mu)./sqrt(var);
    end
end

