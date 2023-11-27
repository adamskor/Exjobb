addpath(genpath('Statistical Tests'), genpath('Univariate Distributions'), ...
        genpath('Multivariate Distributions'), genpath('Simulation'), genpath('Black Litterman'), ...
        genpath('mfe-toolbox-main'), genpath('Optimisation'), genpath('Results'), genpath('Statistical Tests'), ...
        genpath('codegen'))
%%

%%
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
[Data] = GARCHGauss(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);

[Data] = GARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);

[Data] = EGARCHGauss(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);

[Data] = EGARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data, 0);
%%
try
    load('EGARCHtParams.mat')
    Data.Univariate.EGARCHt.Params = EGARCHtParams;
    clear EGARCHtParams
    [Data] = EGARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data, 1);
catch
    [Data] = EGARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data, 0);
end
%%
[Data] = Gaussian_Copula(Data.Univariate.EGARCHt.z, Data);

[Data] = Student_t_Copula(Data.Univariate.EGARCHt.z, Data.Univariate.EGARCHt.Params, Data);
%%
try
    load('tCopulaSampling.mat')
    Data.Copula.t.eta = eta;
    Data.Copula.t.nu = nu;
    Data.Copula.t.Rho = Rho;
    clear eta nu Rho
catch
    [Data] = Student_t_Copula(Data.Univariate.EGARCHt.z, Data.Univariate.EGARCHt.Params, Data);
end


%%
[Data.Simulate.t.EGARCHt.r_hat, Data.Simulate.t.EGARCHt.Sigma] = ...
   simulateReturnsEGARCHt(Data.Copula.t.eta, Data.Univariate.EGARCHt.Params, Data);     
%%% Black Litterman CAPM Equilibrium
[Data] = ExcessReturns(Data.Simulate.t.EGARCHt.Sigma, Data);
%%
[Data] = InvestorViews(Data.Simulate.t.EGARCHt.Sigma, Data.BL.Pi, Data);
%%
[Data] = PosteriorDist(Data);
[Data] = ReturnsCBL(Data);

%% CAPM Optimisation
[Data] = MaxSharpe(Data);
%%
[Data] = MinimiseCVaR(Data);

[Data] = MaxSTARR(Data);
%%
[Data] = RestrictedMaxSharpe(Data);
%%
[Data] = RestrictedMinimiseCVaR(Data);

[Data] = RestrictedMaxSTARR(Data);
%%
[Data] = PortWealth(Data);
[Data] = PortReturns(Data);
[Data] = PortSTD(Data);
[Data] = PortVaRCVaR(Data);
[Data] = PortSTARR(Data);
[Data] = PortMeanVaR(Data);
[Data] = PortSharpe(Data);
[Data] = PortAveTurnover(Data);
[Data] = pairedtTest(Data);
