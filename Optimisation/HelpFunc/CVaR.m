function val = CVaR(w, alpha, r_hat, sampleSize) %#codegen
    portReturns = r_hat(:, :)*w';
    portReturnsSort = sort(portReturns);
    VaR = -portReturnsSort(floor((1 - alpha)*size(portReturnsSort, 1)));
    CVaR_temp = 0;
    for m = 1:sampleSize
        CVaR_temp = CVaR_temp + max((-w*r_hat(m, :)' - VaR), 0);
    end
    val = VaR + 1/(sampleSize*(1 - alpha))*CVaR_temp;   
    %%% codegen CVaR -args {zeros(1,14), zeros(1,1), zeros(10000, 14), zeros(1,1)}   
end

