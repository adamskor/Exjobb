addpath('Statistical Tests', 'Univariate Distributions', 'Multivariate Distributions', 'Simulation', 'Black Litterman')
%%
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
%                   r_hat, Sigma
%               GARCHt:
%                   r_hat, Sigma
%               EGARCHGauss:
%                   r_hat, Sigma
%               EGARCHt:
%                   r_hat, Sigma
%           t:
%               GARCHGauss:
%                   r_hat, Sigma
%               GARCHt:
%                   r_hat, Sigma
%               EGARCHGauss:
%                   r_hat, Sigma
%               EGARCHt:
%                   r_hat, Sigma
%
%%%
%%
[Data] = FormatData();
%% Estimate univariate distributions and return i.i.d. z_t and relevant model parameters
%[Data] = Gaussian(Data.TimeSeries.Returns, Data);
%[Data] = Student_t(Data.TimeSeries.Returns, Data);
%[Data] = GARCHGauss(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
%[Data] = GARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
%[Data] = EGARCHGauss(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
%%
[Data] = EGARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
%%
%[Data] = Gaussian_Copula(Data.Univariate.GARCHGauss.z, Data);
%%
[Data] = Student_t_Copula(Data.Univariate.EGARCHt.z, Data.Univariate.EGARCHt.Params, Data);
%%
[Data.Simulate.t.EGARCHt.r_hat, Data.Simulate.t.EGARCHt.Sigma] = ...
   simulateReturnsEGARCHt(Data.Copula.t.eta, Data.Univariate.EGARCHt.Params, Data);     
%%
[Data] = ExcessReturns(Data.Simulate.t.EGARCHt.Sigma, Data);
%%
[Data] = InvestorViews(Data.Simulate.t.EGARCHt.Sigma, Data.BL.Pi, Data);
%%
[Data] = PosteriorDist(Data);
[Data] = ReturnsCBL(Data);
%%
[Data] = MaxSharpe(Data);
%%
%[Data] = ConMaxSharpe(Data);
[Data] = MinimiseCVaR(Data);
[Data] = MaxSTARR(Data);
%[Data] = ConMaxSTARR(Data);
%%
[Data] = PortWealth(Data);
[Data] = PortReturns(Data);
%%
[Data] = pairedtTest(Data);











