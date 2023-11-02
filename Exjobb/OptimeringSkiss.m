

data
for
    window(i) = jada
end
for i
    weights(i,:) = Optimise(window(i))
end
results = result(weights, params);


function [weights] = Optimise(window, param)
    [z] = getUnivariate(window);
    [sigma, marginals, residuals] = getMultivariate(z, params);
    [returns_BL, mu_BL] = getBlackLitterman(sigma, residuals, params);
    weights_SR = SR_Opti(returns_BL, mu_BL);
    weights_STARR = STARR_Opti(returns_BL, mu_BL);
    weights_SR_Con = SR_Con_Opti(returns_BL, mu_BL);
    
    weights(1, :) = weights_SR;
    weights(1, :) = weights_SR;
    weights(1, :) = weights_SR;
end