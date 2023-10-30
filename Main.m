[prices, returns, dates, assets] = FormatData();
%%
Data.prices = prices;
Data.returns = returns(1:3290,:);
Data.returns_OOS = returns(3291:end,:);
Data.dates = dates;
Data.assets = assets;

%% Estimate univariate distribtuions and return i.i.d. z_t and relevant model parameters
%[z_Gauss, params_Gauss] = Gaussian(Data);
%[z_Student_t, params_Student_t] = Student_t(Data);
[z_GARCH_G, eps, params_GARCH_G] = GARCH(Data, 'Gaussian', 1);


[z_GARCH_t, ~, params_GARCH_t] = GARCH(Data, 't', 1);
[z_EGARCH_G, ~, params_EGARCH_G] = EGARCH(Data, 'Gaussian', 1);
[z_EGARCH_t, ~, params_EGARCH_t] = EGARCH(Data, 't', 1);
Data.eps = eps;
Data.z_GARCH_G = z_GARCH_G;
Data.z_GARCH_t = z_GARCH_t;
Data.z_EGARCH_G = z_EGARCH_G;
Data.z_EGARCH_t = z_EGARCH_t;
Data.params_GARCH_G = params_GARCH_G;
Data.params_GARCH_t = params_GARCH_t;
Data.params_EGARCH_G = params_EGARCH_G;
Data.params_EGARCH_t = params_EGARCH_t;
%%
close all
QQ_plot(Data);





[h_0, pValue] = EngleArchTest(Data, 1);
