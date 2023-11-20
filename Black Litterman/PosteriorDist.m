function [Data] = PosteriorDist(Data)
mu_BL = zeros(1, size(Data.BL.Lambda, 2), size(Data.BL.Lambda, 3));
Sigma = Data.Simulate.t.EGARCHt.Sigma;
tau = 0.5;
Lambda = Data.BL.Lambda;
q = Data.BL.q;
Pi = Data.BL.Pi;
P = 1;
for window = 1:size(Data.BL.Lambda, 3)
    mu_BL(:,:,window) = ((Lambda(:, :, window)) + ...
                        inv(tau*Sigma(:, :, window))) \ (tau*Sigma(:, :, window)\Pi(:,:,window)' + P'*(Lambda(:, :, window)\q(:, :, window)'));
end
Data.BL.mu_BL = mu_BL;

end

