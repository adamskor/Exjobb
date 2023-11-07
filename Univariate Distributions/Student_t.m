function [Data] = Student_t(returns, Data)
    z = zeros(size(returns,1), size(returns,2), size(returns,3));
    params = zeros(3, size(returns,2), size(returns,3));
    for window = 1:size(returns, 3)
        for asset = 1:size(returns,2)
            pd = fitdist(returns(:, asset), 'tLocationScale');
            params(1,asset) = pd.mu;
            params(2,asset) = pd.sigma;
            params(3,asset) = pd.nu;
            var = pd.sigma^2*(pd.nu/(pd.nu-2));
            z(:, asset) = (returns(:, asset) - pd.mu)./sqrt(var);
        end
    end
    Data.Univarite.t.z = z;
    Data.Univariate.t.Params = params;
end

