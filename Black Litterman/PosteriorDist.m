function [Data] = PosteriorDist(Data)
mu_CBL = zeros(1, size(Data.BL.Lambda, 2), size(Data.BL.Lambda, 3));
Sigma_mu_BL = zeros(size(Data.BL.Lambda, 2), size(Data.BL.Lambda, 2), size(Data.BL.Lambda, 3));
Sigma_CBL = zeros(size(Data.BL.Lambda, 2), size(Data.BL.Lambda, 2), size(Data.BL.Lambda, 3));
Sigma = Data.Simulate.t.EGARCHt.Sigma;
tau = 0.5;
Lambda = Data.BL.Lambda;
q = Data.BL.q;
Pi = Data.BL.Pi;
P = 1;
for window = 1:size(Data.BL.Lambda, 3)
    mu_CBL(:,:,window) = ((Lambda(:, :, window)) + ...
                        inv(tau*Sigma(:, :, window))) \ (tau*Sigma(:, :, window)\Pi(:,:,window)' + P'*(Lambda(:, :, window)\q(:, :, window)'));
    Sigma_mu_BL(:,:,window )= inv(inv(tau*Sigma(:, :, window)) + P*inv(Lambda(:, :, window))*P);
    Sigma_CBL(:,:,window ) = Sigma_mu_BL(:,:,window ) + Sigma(:,:,window );
end
Data.BL.mu_BL = mu_CBL;
Data.BL.Sigma_mu_BL = Sigma_mu_BL;
Data.BL.Sigma_CBL = Sigma_CBL;

end

