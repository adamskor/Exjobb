function [Data] = InvestorViews(Sigma, Pi, Data)
    q = zeros(1, size(Pi, 2), size(Pi, 3));
    for window = 1:size(Pi, 3)
       P = eye(size(Pi, 2));
       q(1, :, window) = (P*Pi(:, :, window)')' + abs(normrnd(0, 0.005));      
    end
    Data.BL.q = q;
    Data.BL.Lambda = Sigma;







end

