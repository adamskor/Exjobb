addpath(genpath('Statistical Tests'), genpath('Univariate Distributions'), ...
        genpath('Multivariate Distributions'), genpath('Simulation'), genpath('Black Litterman'), ...
        genpath('mfe-toolbox-main'), genpath('Optimisation'), genpath('Results'), genpath('Statistical Tests'), ...
        genpath('codegen'), genpath('MarketCorrelation'))
%%
[Data] = FormatData();
%% Estimate univariate distributions and return i.i.d. z_t and relevant model parameters
[Data] = GARCHGauss(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
%%
[Data] = GARCHt(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
%%
[Data] = EGARCHGauss(Data.TimeSeries.Returns, Data.TimeSeries.eps, Data);
%%
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
%%
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
%% Black Litterman CAPM Equilibrium
[Data] = ExcessReturns(Data.Simulate.t.EGARCHt.Sigma, Data);
[Data] = InvestorViews(Data.Simulate.t.EGARCHt.Sigma, Data.BL.Pi, Data);
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
%%% One Day Holding Results
[Data] = PortDailyWeights(Data);
[Data] = PortWealth(Data);
[Data] = PortReturns(Data);
[Data] = PortSTD(Data);
[Data] = PortVaRCVaR(Data);
[Data] = PortSTARR(Data);
[Data] = PortMeanVaR(Data);
[Data] = PortSharpe(Data);
[Data] = PortAveTurnover(Data);                          
[Data] = pairedtTest(Data);

%%% Weekly Holding Results
[Data] = WeeklyPortWeights(Data);
[Data] = WeeklyPortWealth(Data);
[Data] = WeeklyPortReturns(Data);
[Data] = WeeklyPortSTD(Data);
[Data] = WeeklyPortVaRCVaR(Data);
[Data] = WeeklyPortSTARR(Data);
[Data] = WeeklyPortMeanVaR(Data);
[Data] = WeeklyPortSharpe(Data);
[Data] = WeeklyPortAveTurnover(Data);
[Data] = WeeklypairedtTest(Data);
%%% Quarterly Holding Results
[Data] = QuartPortWeights(Data);
[Data] = QuartPortWealth(Data);
[Data] = QuartPortReturns(Data);
[Data] = QuartPortSTD(Data);
[Data] = QuartPortVaRCVaR(Data);
[Data] = QuartPortSTARR(Data);
[Data] = QuartPortMeanVaR(Data);
[Data] = QuartPortSharpe(Data);
[Data] = QuartPortAveTurnover(Data);
[Data] = QuartpairedtTest(Data);
 
%% Yearly Holding Results
[Data] = YearlyPortWeights(Data);
[Data] = YearlyPortWealth(Data);
[Data] = YearlyPortReturns(Data);
[Data] = YearlyPortSTD(Data);
[Data] = YearlyPortVaRCVaR(Data);
[Data] = YearlyPortSTARR(Data);
[Data] = YearlyPortMeanVaR(Data);
[Data] = YearlyPortSharpe(Data);
[Data] = YearlyPortAveTurnover(Data);
[Data] = YearlypairedtTest(Data);
%%
[Data] = finalResults(Data);



