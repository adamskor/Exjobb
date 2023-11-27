function [Data] = InvestorViews(Sigma, Pi, Data)
    q = zeros(1, size(Pi, 2), size(Pi, 3));
    for window = 1:size(Pi, 3)
    disp(window)
       for asset = 1:Data.Info.nAssets
            q(1, asset, window) = mean(Data.Simulate.t.EGARCHt.r_hat(:, asset, window)) + 0.1*std(Data.Simulate.t.EGARCHt.r_hat(:, asset, window));
       end           
    end
    Data.BL.q = q;
    Data.BL.Lambda = Sigma;







end

