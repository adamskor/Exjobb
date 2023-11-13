function [q, Lambda, P, Sigma] = InvestorViews(Sigma, Pi, Data)
    nAssets = size(Sigma,1);
    P = eye(nAssets);
    Xi = ones(1,20);
    
    q = (Pi*252 + sqrt(diag(Sigma)))/252
    q = Pi + 0.0001;

    Lambda = P*Sigma*P';
end

