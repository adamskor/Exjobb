function VaR = ValueatRisk(w, window, Data)
    alpha = Data.Info.sigLevel;
    portReturns = Data.Simulate.t.EGARCHt.r_hat(:, :, window)*w';
    portReturnsSort = sort(portReturns);
    VaR = -portReturnsSort(floor((1 - alpha)*size(portReturnsSort, 1)));
end

