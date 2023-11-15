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
%[Data.Simulate.t.EGARCHt.r_hat, Data.Simulate.t.EGARCHt.Sigma] = ...
%   simulateReturnsEGARCHt(Data.Copula.t.eta, Data.Univariate.EGARCHt.Params, Data);
%%
%[Data.Simulate.t.EGARCHt.r_hat_test, Data.Simulate.t.EGARCHt.Sigma_test] = ...
%   simulateReturnsEGARCHt(Data.Univariate.EGARCHt.z, Data.Univariate.EGARCHt.Params, Data);

%%
%%%Hoang meeting
% asset = 1;
% figure(1)
% subplot(2,1,1)
% plot(Data.Univariate.EGARCHt.z(:, asset))
% title('z_t from EGARCH with student t assumption')
% 
% subplot(2,1,2)
% plot(Data.Copula.t.eta(:, asset))
% title('eta from EGARCH with student t assumption & t-copula')
% 
% figure(2)
% histfit(Data.Univariate.EGARCHt.z(:, asset), 100, 'tLocationScale', 0, 1, Data.Univariate.EGARCHt.Params(5, asset))
% title('Histit of z_t to a stardardized t-distribution')
% 
% figure(3)
% histfit(Data.Copula.t.eta(:, asset), 100, 'tLocationScale', 0, 1, Data.Univariate.EGARCHt.Params(5, asset))
% title('Histit of eta to a stardardized t-distribution')
% 
% figure(4)
% hist(tcdf(Data.Univariate.EGARCHt.z(:, asset), Data.Univariate.EGARCHt.Params(5, asset)))
% title('tcdf of z_t from EGARCH with student t assumption')
% 
% figure(5)
% subplot(2,1,1)
% plot(Data.TimeSeries.Returns(:, asset))
% title('Actual daily returns')
% subplot(2,1,2)
% plot(Data.Simulate.t.EGARCHt.r_hat(:, asset))
% title('Simulated daily returns with eta')
% 
% figure(6)
% subplot(2,1,1)
% plot(Data.TimeSeries.Returns(:, asset))
% title('Actual daily returns')
% subplot(2,1,2)
% plot(Data.Simulate.t.EGARCHt.r_hat_test(:, asset))
% title('Simulated daily returns with z_t')
% 
% 
% 
% %%
% [Pi] = ExcessReturns(Data.Simulate.t.EGARCHt.Sigma, Data);
% [q, Lambda, P, Sigma] = InvestorViews(Data.Simulate.t.EGARCHt.Sigma, Pi, Data);
% tau = 0.5;
% mu_BL = inv(inv(tau*Sigma) + P'*inv(Lambda)*P) * (inv(tau*Sigma)*Pi + P'*inv(Lambda)*q);
% mu_bl = (P'*(Lambda\P) + inv(tau*Sigma)) \ ( tau*Sigma\Pi + P'*(Lambda\q));
% 
% Sigma_mu_BL = inv(inv(tau*Sigma) + P'*inv(Lambda)*P);
% Sigma_CBL = Sigma_mu_BL + Sigma;
% mu_CBL = mu_BL;
% r_CBL = mu_CBL + ((sqrt(diag(Sigma_CBL))')*Data.Univariate.EGARCHt.z');
% 
% 
% 
% 
% [q*252 Pi*252 mu_BL*252]
% 
% 
% 
% 

%QQ_plot(Data);




% [Data.Simulate.Gauss.GARCHGauss.r_hat, Data.Simulate.Gauss.GARCHGauss.Sigma] = ...
%     simulateReturnsGARCHGauss(Data.Copula.Gauss.eta, Data.Univariate.GARCHGauss.Params, Data);
% [Data.Simulate.t.GARCHGauss.r_hat, Data.Simulate.t.GARCHGauss.Sigma] = ...
%     simulateReturnsGARCHGauss(Data.Copula.t.eta, Data.Univariate.GARCHGauss.Params, Data);
% 
% [Data.Simulate.Gauss.GARCHt.r_hat, Data.Simulate.Gauss.GARCHt.Sigma] = ...
%     simulateReturnsGARCHGauss(Data.Copula.Gauss.eta, Data.Univariate.GARCHt.Params, Data);
% [Data.Simulate.t.GARCHt.r_hat, Data.Simulate.t.GARCHt.Sigma] = ...
%     simulateReturnsGARCHGauss(Data.Copula.t.eta, Data.Univariate.GARCHt.Params, Data);
% 
% [Data.Simulate.Gauss.EGARCHGauss.r_hat, Data.Simulate.Gauss.EGARCHGauss.Sigma] = ...
%     simulateReturnsEGARCHGauss(Data.Copula.Gauss.eta, Data.Univariate.EGARCHGauss.Params, Data);
% [Data.Simulate.t.EGARCHGauss.r_hat, Data.Simulate.t.EGARCHGauss.Sigma] = ...
%     simulateReturnsEGARCHGauss(Data.Copula.t.eta, Data.Univariate.EGARCHGauss.Params, Data);
% 
% [Data.Simulate.Gauss.EGARCHt.r_hat, Data.Simulate.Gauss.EGARCHt.Sigma] = ...
%     simulateReturnsEGARCHt(Data.Copula.Gauss.eta, Data.Univariate.EGARCHt.Params, Data);
%[h_0, pValue] = EngleArchTest(Data, 1);
