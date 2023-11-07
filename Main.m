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
%           Parameters:
%               simSampleSize
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
%       Copula:
%           Gauss:
%               Rho, eta
%           t:
%               Rho, nu, eta
%       Simulate:
%           Gauss:
%               GARCHGauss:
%                   r
%               GARCHt:
%                   r
%               EGARCHGauss:
%                   r
%               EGARCHt:
%                   r
%           t:
%               GARCHGauss:
%                   r
%               GARCHt:
%                   r
%               EGARCHGauss:
%                   r
%               EGARCHt:
%                   r
%
%%%
%%
[Data] = FormatData();
%% Estimate univariate distributions and return i.i.d. z_t and relevant model parameters
[Data] = Gaussian(Data.TimeSeries.Returns, Data);
[Data] = Student_t(Data.TimeSeries.Returns, Data);
[Data] = GARCHGauss(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
[Data] = GARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
[Data] = EGARCHGauss(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
%%
[Data] = EGARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);

%%
[Data] = Gaussian_Copula(Data.Univariate.EGARCHt.z, Data);

[Data] = Student_t_Copula(Data.Univariate.EGARCHt.z, Data.Univariate.EGARCHt.Params, Data);


%%
Data.Simulate.Gauss.GARCHGauss.r = simulateReturnsGARCHGauss(Data.Copula.Gauss.eta, Data.Univariate.GARCHGauss.Params, Data);
Data.Simulate.t.GARCHGauss.r = simulateReturnsGARCHGauss(Data.Copula.t.eta, Data.Univariate.GARCHGauss.Params, Data);

Data.Simulate.Gauss.GARCHt.r = simulateReturnsGARCHGauss(Data.Copula.Gauss.eta, Data.Univariate.GARCHt.Params, Data);
Data.Simulate.t.GARCHt.r = simulateReturnsGARCHGauss(Data.Copula.t.eta, Data.Univariate.GARCHt.Params, Data);

Data.Simulate.Gauss.EGARCHGauss.r = simulateReturnsEGARCHGauss(Data.Copula.Gauss.eta, Data.Univariate.EGARCHGauss.Params, Data);
Data.Simulate.t.EGARCHGauss.r = simulateReturnsEGARCHGauss(Data.Copula.t.eta, Data.Univariate.EGARCHGauss.Params, Data);

Data.Simulate.Gauss.EGARCHt.r = simulateReturnsEGARCHt(Data.Copula.Gauss.eta, Data.Univariate.EGARCHt.Params, Data);
Data.Simulate.t.EGARCHt.r = simulateReturnsEGARCHt(Data.Copula.t.eta, Data.Univariate.EGARCHt.Params, Data);







%QQ_plot(Data);





%[h_0, pValue] = EngleArchTest(Data, 1);
