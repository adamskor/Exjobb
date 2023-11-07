addpath('Statistical Tests', 'Univariate Distributions', 'Multivariate Distributions', 'Simulation')
close all
clear all

%%% 
%   Data:
%       TimeSeries:
%           Prices, Returns, LogReturns, Dates, eps, epsLog
%       TimeSeriesIS:
%           Prices, Returns, LogReturns, Dates, eps, epsLog
%       TimeSeriesOOS:
%           Prices, Returns, LogReturns, Dates, eps, epsLog
%       Info:
%           Assets
%       Univariate:
%           Gauss:
%               z, Params
%           t:
%               z, Params
%           GARCHGauss:
%               z, Params, LLV
%           GARCHt:
%               z, Params, LLV
%           EGARCHGauss:
%               z, Params, LLV
%           EGARCHt:
%               z, Params, LLV
%%%
%%
[Data] = FormatData();
%% Estimate univariate distributions and return i.i.d. z_t and relevant model parameters
[Data] = Gaussian(Data.TimeSeries.Returns, Data);
[Data] = Student_t(Data.TimeSeries.Returns, Data);
[Data] = GARCHGauss(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
[Data] = GARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
[Data] = EGARCHGauss(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
[Data] = EGARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
%%

%%
[rho_G, eta_Gauss] = Gaussian_Copula(Data);
%%
[rho_t, nu, eta_t] = Student_t_Copula(Data);
Data.eta_t = eta_t;
Data.eta_Gauss = eta_Gauss;
%%
[returns_sim_GARCH_G_C_G] = simulateReturnsGARCH(Data);






%QQ_plot(Data);





%[h_0, pValue] = EngleArchTest(Data, 1);
