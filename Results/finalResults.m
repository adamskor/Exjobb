function [Data] = finalResults(Data)

startDay = 1;
if Data.Info.Optimisations(1)
    %%% START DAY DAILY
    Data.Results.MaxSharpe.finalResults.DailyVaR = Data.Results.MaxSharpe.VaR(startDay);
    Data.Results.MaxSharpe.finalResults.DailyCVaR = Data.Results.MaxSharpe.CVaR(startDay);
    Data.Results.MaxSharpe.finalResults.DailySTARR = Data.Results.MaxSharpe.STARR(startDay);
    Data.Results.MaxSharpe.finalResults.DailyMeanVaR = Data.Results.MaxSharpe.meanVaR(startDay);
    Data.Results.MaxSharpe.finalResults.DailySharpe = Data.Results.MaxSharpe.Sharpe(startDay);
    Data.Results.MaxSharpe.finalResults.DailyAveTurnover = Data.Results.MaxSharpe.aveTurnover(startDay);
    Data.Results.MaxSharpe.finalResults.DailySTD = Data.Results.MaxSharpe.STD(startDay);
    Data.Results.MaxSharpe.finalResults.DailyAveReturns = Data.Results.MaxSharpe.AveReturns(startDay);
    Data.Results.MaxSharpe.finalResults.DailyFinalWealth = Data.Results.MaxSharpe.finalWealth(startDay);
    %%% Robustness check DAILY
    Data.Results.MaxSharpe.finalResults.DailyAveP = mean(Data.Results.MaxSharpe.p);
    Data.Results.MaxSharpe.finalResults.DailyAvePin95 = size(Data.Results.MaxSharpe.p(Data.Results.MaxSharpe.p < 0.05))/253;
    %%% START DAY WEEKLY
    Data.Results.MaxSharpe.finalResults.WeeklyVaR = Data.Results.MaxSharpe.WeeklyVaR(startDay);
    Data.Results.MaxSharpe.finalResults.WeeklyCVaR = Data.Results.MaxSharpe.WeeklyCVaR(startDay);
    Data.Results.MaxSharpe.finalResults.WeeklySTARR = Data.Results.MaxSharpe.WeeklySTARR(startDay);
    Data.Results.MaxSharpe.finalResults.WeeklyMeanVaR = Data.Results.MaxSharpe.WeeklymeanVaR(startDay);
    Data.Results.MaxSharpe.finalResults.WeeklySharpe = Data.Results.MaxSharpe.WeeklySharpe(startDay);
    Data.Results.MaxSharpe.finalResults.WeeklyAveTurnover = Data.Results.MaxSharpe.WeeklyaveTurnover(startDay);
    Data.Results.MaxSharpe.finalResults.WeeklySTD = Data.Results.MaxSharpe.WeeklySTD(startDay);
    Data.Results.MaxSharpe.finalResults.WeeklyAveReturns = Data.Results.MaxSharpe.WeeklyAveReturns(startDay);
    Data.Results.MaxSharpe.finalResults.WeeklyFinalWealth = Data.Results.MaxSharpe.WeeklyfinalWealth(startDay);
    %%% Robustness check WEEKLY
    Data.Results.MaxSharpe.finalResults.WeeklyAveP = mean(Data.Results.MaxSharpe.Weeklyp);
    Data.Results.MaxSharpe.finalResults.WeeklyAvePin95 = size(Data.Results.MaxSharpe.Weeklyp(Data.Results.MaxSharpe.Weeklyp < 0.05))/253;
    %%% START DAY QUARTERLY
    Data.Results.MaxSharpe.finalResults.QuartVaR = Data.Results.MaxSharpe.QuartVaR(startDay);
    Data.Results.MaxSharpe.finalResults.QuartCVaR = Data.Results.MaxSharpe.QuartCVaR(startDay);
    Data.Results.MaxSharpe.finalResults.QuartSTARR = Data.Results.MaxSharpe.QuartSTARR(startDay);
    Data.Results.MaxSharpe.finalResults.QuartMeanVaR = Data.Results.MaxSharpe.QuartmeanVaR(startDay);
    Data.Results.MaxSharpe.finalResults.QuartSharpe = Data.Results.MaxSharpe.QuartSharpe(startDay);
    Data.Results.MaxSharpe.finalResults.QuartAveTurnover = Data.Results.MaxSharpe.QuartaveTurnover(startDay);
    Data.Results.MaxSharpe.finalResults.QuartSTD = Data.Results.MaxSharpe.QuartSTD(startDay);
    Data.Results.MaxSharpe.finalResults.QuartAveReturns = Data.Results.MaxSharpe.QuartAveReturns(startDay);
    Data.Results.MaxSharpe.finalResults.QuartFinalWealth = Data.Results.MaxSharpe.QuartfinalWealth(startDay);
    %%% Robustness check QUARTERLY
    Data.Results.MaxSharpe.finalResults.QuartAveP = mean(Data.Results.MaxSharpe.Quartp);
    Data.Results.MaxSharpe.finalResults.QuartAvePin95 = size(Data.Results.MaxSharpe.Quartp(Data.Results.MaxSharpe.Quartp < 0.05))/253;
end
if Data.Info.Optimisations(2)
    %%% START DAY DAILY
    Data.Results.MinCVaR.finalResults.DailyVaR = Data.Results.MinCVaR.VaR(startDay);
    Data.Results.MinCVaR.finalResults.DailyCVaR = Data.Results.MinCVaR.CVaR(startDay);
    Data.Results.MinCVaR.finalResults.DailySTARR = Data.Results.MinCVaR.STARR(startDay);
    Data.Results.MinCVaR.finalResults.DailyMeanVaR = Data.Results.MinCVaR.meanVaR(startDay);
    Data.Results.MinCVaR.finalResults.DailySharpe = Data.Results.MinCVaR.Sharpe(startDay);
    Data.Results.MinCVaR.finalResults.DailyAveTurnover = Data.Results.MinCVaR.aveTurnover(startDay);
    Data.Results.MinCVaR.finalResults.DailySTD = Data.Results.MinCVaR.STD(startDay);
    Data.Results.MinCVaR.finalResults.DailyAveReturns = Data.Results.MinCVaR.AveReturns(startDay);
    Data.Results.MinCVaR.finalResults.DailyFinalWealth = Data.Results.MinCVaR.finalWealth(startDay);
    %%% Robustness check DAILY
    Data.Results.MinCVaR.finalResults.DailyAveP = mean(Data.Results.MinCVaR.p);
    Data.Results.MinCVaR.finalResults.DailyAvePin95 = size(Data.Results.MinCVaR.p(Data.Results.MinCVaR.p < 0.05))/253;
    %%% START DAY WEEKLY
    Data.Results.MinCVaR.finalResults.WeeklyVaR = Data.Results.MinCVaR.WeeklyVaR(startDay);
    Data.Results.MinCVaR.finalResults.WeeklyCVaR = Data.Results.MinCVaR.WeeklyCVaR(startDay);
    Data.Results.MinCVaR.finalResults.WeeklySTARR = Data.Results.MinCVaR.WeeklySTARR(startDay);
    Data.Results.MinCVaR.finalResults.WeeklyMeanVaR = Data.Results.MinCVaR.WeeklymeanVaR(startDay);
    Data.Results.MinCVaR.finalResults.WeeklySharpe = Data.Results.MinCVaR.WeeklySharpe(startDay);
    Data.Results.MinCVaR.finalResults.WeeklyAveTurnover = Data.Results.MinCVaR.WeeklyaveTurnover(startDay);
    Data.Results.MinCVaR.finalResults.WeeklySTD = Data.Results.MinCVaR.WeeklySTD(startDay);
    Data.Results.MinCVaR.finalResults.WeeklyAveReturns = Data.Results.MinCVaR.WeeklyAveReturns(startDay);
    Data.Results.MinCVaR.finalResults.WeeklyFinalWealth = Data.Results.MinCVaR.WeeklyfinalWealth(startDay);
    %%% Robustness check WEEKLY
    Data.Results.MinCVaR.finalResults.WeeklyAveP = mean(Data.Results.MinCVaR.Weeklyp);
    Data.Results.MinCVaR.finalResults.WeeklyAvePin95 = size(Data.Results.MinCVaR.Weeklyp(Data.Results.MinCVaR.Weeklyp < 0.05))/253;
    %%% START DAY QUARTERLY
    Data.Results.MinCVaR.finalResults.QuartVaR = Data.Results.MinCVaR.QuartVaR(startDay);
    Data.Results.MinCVaR.finalResults.QuartCVaR = Data.Results.MinCVaR.QuartCVaR(startDay);
    Data.Results.MinCVaR.finalResults.QuartSTARR = Data.Results.MinCVaR.QuartSTARR(startDay);
    Data.Results.MinCVaR.finalResults.QuartMeanVaR = Data.Results.MinCVaR.QuartmeanVaR(startDay);
    Data.Results.MinCVaR.finalResults.QuartSharpe = Data.Results.MinCVaR.QuartSharpe(startDay);
    Data.Results.MinCVaR.finalResults.QuartAveTurnover = Data.Results.MinCVaR.QuartaveTurnover(startDay);
    Data.Results.MinCVaR.finalResults.QuartSTD = Data.Results.MinCVaR.QuartSTD(startDay);
    Data.Results.MinCVaR.finalResults.QuartAveReturns = Data.Results.MinCVaR.QuartAveReturns(startDay);
    Data.Results.MinCVaR.finalResults.QuartFinalWealth = Data.Results.MinCVaR.QuartfinalWealth(startDay);
    %%% Robustness check QUARTERLY
    Data.Results.MinCVaR.finalResults.QuartAveP = mean(Data.Results.MinCVaR.Quartp);
    Data.Results.MinCVaR.finalResults.QuartAvePin95 = size(Data.Results.MinCVaR.Quartp(Data.Results.MinCVaR.Quartp < 0.05))/253;
end
if Data.Info.Optimisations(3)
    %%% START DAY DAILY
    Data.Results.MaxSTARR.finalResults.DailyVaR = Data.Results.MaxSTARR.VaR(startDay);
    Data.Results.MaxSTARR.finalResults.DailyCVaR = Data.Results.MaxSTARR.CVaR(startDay);
    Data.Results.MaxSTARR.finalResults.DailySTARR = Data.Results.MaxSTARR.STARR(startDay);
    Data.Results.MaxSTARR.finalResults.DailyMeanVaR = Data.Results.MaxSTARR.meanVaR(startDay);
    Data.Results.MaxSTARR.finalResults.DailySharpe = Data.Results.MaxSTARR.Sharpe(startDay);
    Data.Results.MaxSTARR.finalResults.DailyAveTurnover = Data.Results.MaxSTARR.aveTurnover(startDay);
    Data.Results.MaxSTARR.finalResults.DailySTD = Data.Results.MaxSTARR.STD(startDay);
    Data.Results.MaxSTARR.finalResults.DailyAveReturns = Data.Results.MaxSTARR.AveReturns(startDay);
    Data.Results.MaxSTARR.finalResults.DailyFinalWealth = Data.Results.MaxSTARR.finalWealth(startDay);
    %%% Robustness check DAILY
    Data.Results.MaxSTARR.finalResults.DailyAveP = mean(Data.Results.MaxSTARR.p);
    Data.Results.MaxSTARR.finalResults.DailyAvePin95 = size(Data.Results.MaxSTARR.p(Data.Results.MaxSTARR.p < 0.05))/253;
    %%% START DAY WEEKLY
    Data.Results.MaxSTARR.finalResults.WeeklyVaR = Data.Results.MaxSTARR.WeeklyVaR(startDay);
    Data.Results.MaxSTARR.finalResults.WeeklyCVaR = Data.Results.MaxSTARR.WeeklyCVaR(startDay);
    Data.Results.MaxSTARR.finalResults.WeeklySTARR = Data.Results.MaxSTARR.WeeklySTARR(startDay);
    Data.Results.MaxSTARR.finalResults.WeeklyMeanVaR = Data.Results.MaxSTARR.WeeklymeanVaR(startDay);
    Data.Results.MaxSTARR.finalResults.WeeklySharpe = Data.Results.MaxSTARR.WeeklySharpe(startDay);
    Data.Results.MaxSTARR.finalResults.WeeklyAveTurnover = Data.Results.MaxSTARR.WeeklyaveTurnover(startDay);
    Data.Results.MaxSTARR.finalResults.WeeklySTD = Data.Results.MaxSTARR.WeeklySTD(startDay);
    Data.Results.MaxSTARR.finalResults.WeeklyAveReturns = Data.Results.MaxSTARR.WeeklyAveReturns(startDay);
    Data.Results.MaxSTARR.finalResults.WeeklyFinalWealth = Data.Results.MaxSTARR.WeeklyfinalWealth(startDay);
    %%% Robustness check WEEKLY
    Data.Results.MaxSTARR.finalResults.WeeklyAveP = mean(Data.Results.MaxSTARR.Weeklyp);
    Data.Results.MaxSTARR.finalResults.WeeklyAvePin95 = size(Data.Results.MaxSTARR.Weeklyp(Data.Results.MaxSTARR.Weeklyp < 0.05))/253;
    %%% START DAY QUARTERLY
    Data.Results.MaxSTARR.finalResults.QuartVaR = Data.Results.MaxSTARR.QuartVaR(startDay);
    Data.Results.MaxSTARR.finalResults.QuartCVaR = Data.Results.MaxSTARR.QuartCVaR(startDay);
    Data.Results.MaxSTARR.finalResults.QuartSTARR = Data.Results.MaxSTARR.QuartSTARR(startDay);
    Data.Results.MaxSTARR.finalResults.QuartMeanVaR = Data.Results.MaxSTARR.QuartmeanVaR(startDay);
    Data.Results.MaxSTARR.finalResults.QuartSharpe = Data.Results.MaxSTARR.QuartSharpe(startDay);
    Data.Results.MaxSTARR.finalResults.QuartAveTurnover = Data.Results.MaxSTARR.QuartaveTurnover(startDay);
    Data.Results.MaxSTARR.finalResults.QuartSTD = Data.Results.MaxSTARR.QuartSTD(startDay);
    Data.Results.MaxSTARR.finalResults.QuartAveReturns = Data.Results.MaxSTARR.QuartAveReturns(startDay);
    Data.Results.MaxSTARR.finalResults.QuartFinalWealth = Data.Results.MaxSTARR.QuartfinalWealth(startDay);
    %%% Robustness check QUARTERLY
    Data.Results.MaxSTARR.finalResults.QuartAveP = mean(Data.Results.MaxSTARR.Quartp);
    Data.Results.MaxSTARR.finalResults.QuartAvePin95 = size(Data.Results.MaxSTARR.Quartp(Data.Results.MaxSTARR.Quartp < 0.05))/253;
end
if Data.Info.Optimisations(4)
    %%% START DAY DAILY
    Data.Results.ResMaxSharpe.finalResults.DailyVaR = Data.Results.ResMaxSharpe.VaR(startDay);
    Data.Results.ResMaxSharpe.finalResults.DailyCVaR = Data.Results.ResMaxSharpe.CVaR(startDay);
    Data.Results.ResMaxSharpe.finalResults.DailySTARR = Data.Results.ResMaxSharpe.STARR(startDay);
    Data.Results.ResMaxSharpe.finalResults.DailyMeanVaR = Data.Results.ResMaxSharpe.meanVaR(startDay);
    Data.Results.ResMaxSharpe.finalResults.DailySharpe = Data.Results.ResMaxSharpe.Sharpe(startDay);
    Data.Results.ResMaxSharpe.finalResults.DailyAveTurnover = Data.Results.ResMaxSharpe.aveTurnover(startDay);
    Data.Results.ResMaxSharpe.finalResults.DailySTD = Data.Results.ResMaxSharpe.STD(startDay);
    Data.Results.ResMaxSharpe.finalResults.DailyAveReturns = Data.Results.ResMaxSharpe.AveReturns(startDay);
    Data.Results.ResMaxSharpe.finalResults.DailyFinalWealth = Data.Results.ResMaxSharpe.finalWealth(startDay);
    %%% Robustness check DAILY
    Data.Results.ResMaxSharpe.finalResults.DailyAveP = mean(Data.Results.ResMaxSharpe.p);
    Data.Results.ResMaxSharpe.finalResults.DailyAvePin95 = size(Data.Results.ResMaxSharpe.p(Data.Results.ResMaxSharpe.p < 0.05))/253;
    %%% START DAY WEEKLY
    Data.Results.ResMaxSharpe.finalResults.WeeklyVaR = Data.Results.ResMaxSharpe.WeeklyVaR(startDay);
    Data.Results.ResMaxSharpe.finalResults.WeeklyCVaR = Data.Results.ResMaxSharpe.WeeklyCVaR(startDay);
    Data.Results.ResMaxSharpe.finalResults.WeeklySTARR = Data.Results.ResMaxSharpe.WeeklySTARR(startDay);
    Data.Results.ResMaxSharpe.finalResults.WeeklyMeanVaR = Data.Results.ResMaxSharpe.WeeklymeanVaR(startDay);
    Data.Results.ResMaxSharpe.finalResults.WeeklySharpe = Data.Results.ResMaxSharpe.WeeklySharpe(startDay);
    Data.Results.ResMaxSharpe.finalResults.WeeklyAveTurnover = Data.Results.ResMaxSharpe.WeeklyaveTurnover(startDay);
    Data.Results.ResMaxSharpe.finalResults.WeeklySTD = Data.Results.ResMaxSharpe.WeeklySTD(startDay);
    Data.Results.ResMaxSharpe.finalResults.WeeklyAveReturns = Data.Results.ResMaxSharpe.WeeklyAveReturns(startDay);
    Data.Results.ResMaxSharpe.finalResults.WeeklyFinalWealth = Data.Results.ResMaxSharpe.WeeklyfinalWealth(startDay);
    %%% Robustness check WEEKLY
    Data.Results.ResMaxSharpe.finalResults.WeeklyAveP = mean(Data.Results.ResMaxSharpe.Weeklyp);
    Data.Results.ResMaxSharpe.finalResults.WeeklyAvePin95 = size(Data.Results.ResMaxSharpe.Weeklyp(Data.Results.ResMaxSharpe.Weeklyp < 0.05))/253;
    %%% START DAY QUARTERLY
    Data.Results.ResMaxSharpe.finalResults.QuartVaR = Data.Results.ResMaxSharpe.QuartVaR(startDay);
    Data.Results.ResMaxSharpe.finalResults.QuartCVaR = Data.Results.ResMaxSharpe.QuartCVaR(startDay);
    Data.Results.ResMaxSharpe.finalResults.QuartSTARR = Data.Results.ResMaxSharpe.QuartSTARR(startDay);
    Data.Results.ResMaxSharpe.finalResults.QuartMeanVaR = Data.Results.ResMaxSharpe.QuartmeanVaR(startDay);
    Data.Results.ResMaxSharpe.finalResults.QuartSharpe = Data.Results.ResMaxSharpe.QuartSharpe(startDay);
    Data.Results.ResMaxSharpe.finalResults.QuartAveTurnover = Data.Results.ResMaxSharpe.QuartaveTurnover(startDay);
    Data.Results.ResMaxSharpe.finalResults.QuartSTD = Data.Results.ResMaxSharpe.QuartSTD(startDay);
    Data.Results.ResMaxSharpe.finalResults.QuartAveReturns = Data.Results.ResMaxSharpe.QuartAveReturns(startDay);
    Data.Results.ResMaxSharpe.finalResults.QuartFinalWealth = Data.Results.ResMaxSharpe.QuartfinalWealth(startDay);
    %%% Robustness check QUARTERLY
    Data.Results.ResMaxSharpe.finalResults.QuartAveP = mean(Data.Results.ResMaxSharpe.Quartp);
    Data.Results.ResMaxSharpe.finalResults.QuartAvePin95 = size(Data.Results.ResMaxSharpe.Quartp(Data.Results.ResMaxSharpe.Quartp < 0.05))/253;
end
if Data.Info.Optimisations(5)
    %%% START DAY DAILY
    Data.Results.ResMinCVaR.finalResults.DailyVaR = Data.Results.ResMinCVaR.VaR(startDay);
    Data.Results.ResMinCVaR.finalResults.DailyCVaR = Data.Results.ResMinCVaR.CVaR(startDay);
    Data.Results.ResMinCVaR.finalResults.DailySTARR = Data.Results.ResMinCVaR.STARR(startDay);
    Data.Results.ResMinCVaR.finalResults.DailyMeanVaR = Data.Results.ResMinCVaR.meanVaR(startDay);
    Data.Results.ResMinCVaR.finalResults.DailySharpe = Data.Results.ResMinCVaR.Sharpe(startDay);
    Data.Results.ResMinCVaR.finalResults.DailyAveTurnover = Data.Results.ResMinCVaR.aveTurnover(startDay);
    Data.Results.ResMinCVaR.finalResults.DailySTD = Data.Results.ResMinCVaR.STD(startDay);
    Data.Results.ResMinCVaR.finalResults.DailyAveReturns = Data.Results.ResMinCVaR.AveReturns(startDay);
    Data.Results.ResMinCVaR.finalResults.DailyFinalWealth = Data.Results.ResMinCVaR.finalWealth(startDay);
    %%% Robustness check DAILY
    Data.Results.ResMinCVaR.finalResults.DailyAveP = mean(Data.Results.ResMinCVaR.p);
    Data.Results.ResMinCVaR.finalResults.DailyAvePin95 = size(Data.Results.ResMinCVaR.p(Data.Results.ResMinCVaR.p < 0.05))/253;
    %%% START DAY WEEKLY
    Data.Results.ResMinCVaR.finalResults.WeeklyVaR = Data.Results.ResMinCVaR.WeeklyVaR(startDay);
    Data.Results.ResMinCVaR.finalResults.WeeklyCVaR = Data.Results.ResMinCVaR.WeeklyCVaR(startDay);
    Data.Results.ResMinCVaR.finalResults.WeeklySTARR = Data.Results.ResMinCVaR.WeeklySTARR(startDay);
    Data.Results.ResMinCVaR.finalResults.WeeklyMeanVaR = Data.Results.ResMinCVaR.WeeklymeanVaR(startDay);
    Data.Results.ResMinCVaR.finalResults.WeeklySharpe = Data.Results.ResMinCVaR.WeeklySharpe(startDay);
    Data.Results.ResMinCVaR.finalResults.WeeklyAveTurnover = Data.Results.ResMinCVaR.WeeklyaveTurnover(startDay);
    Data.Results.ResMinCVaR.finalResults.WeeklySTD = Data.Results.ResMinCVaR.WeeklySTD(startDay);
    Data.Results.ResMinCVaR.finalResults.WeeklyAveReturns = Data.Results.ResMinCVaR.WeeklyAveReturns(startDay);
    Data.Results.ResMinCVaR.finalResults.WeeklyFinalWealth = Data.Results.ResMinCVaR.WeeklyfinalWealth(startDay);
    %%% Robustness check WEEKLY
    Data.Results.ResMinCVaR.finalResults.WeeklyAveP = mean(Data.Results.ResMinCVaR.Weeklyp);
    Data.Results.ResMinCVaR.finalResults.WeeklyAvePin95 = size(Data.Results.ResMinCVaR.Weeklyp(Data.Results.ResMinCVaR.Weeklyp < 0.05))/253;
    %%% START DAY QUARTERLY
    Data.Results.ResMinCVaR.finalResults.QuartVaR = Data.Results.ResMinCVaR.QuartVaR(startDay);
    Data.Results.ResMinCVaR.finalResults.QuartCVaR = Data.Results.ResMinCVaR.QuartCVaR(startDay);
    Data.Results.ResMinCVaR.finalResults.QuartSTARR = Data.Results.ResMinCVaR.QuartSTARR(startDay);
    Data.Results.ResMinCVaR.finalResults.QuartMeanVaR = Data.Results.ResMinCVaR.QuartmeanVaR(startDay);
    Data.Results.ResMinCVaR.finalResults.QuartSharpe = Data.Results.ResMinCVaR.QuartSharpe(startDay);
    Data.Results.ResMinCVaR.finalResults.QuartAveTurnover = Data.Results.ResMinCVaR.QuartaveTurnover(startDay);
    Data.Results.ResMinCVaR.finalResults.QuartSTD = Data.Results.ResMinCVaR.QuartSTD(startDay);
    Data.Results.ResMinCVaR.finalResults.QuartAveReturns = Data.Results.ResMinCVaR.QuartAveReturns(startDay);
    Data.Results.ResMinCVaR.finalResults.QuartFinalWealth = Data.Results.ResMinCVaR.QuartfinalWealth(startDay);
    %%% Robustness check QUARTERLY
    Data.Results.ResMinCVaR.finalResults.QuartAveP = mean(Data.Results.ResMinCVaR.Quartp);
    Data.Results.ResMinCVaR.finalResults.QuartAvePin95 = size(Data.Results.ResMinCVaR.Quartp(Data.Results.ResMinCVaR.Quartp < 0.05))/253;
end
if Data.Info.Optimisations(6)
    %%% START DAY DAILY
    Data.Results.ResMaxSTARR.finalResults.DailyVaR = Data.Results.ResMaxSTARR.VaR(startDay);
    Data.Results.ResMaxSTARR.finalResults.DailyCVaR = Data.Results.ResMaxSTARR.CVaR(startDay);
    Data.Results.ResMaxSTARR.finalResults.DailySTARR = Data.Results.ResMaxSTARR.STARR(startDay);
    Data.Results.ResMaxSTARR.finalResults.DailyMeanVaR = Data.Results.ResMaxSTARR.meanVaR(startDay);
    Data.Results.ResMaxSTARR.finalResults.DailySharpe = Data.Results.ResMaxSTARR.Sharpe(startDay);
    Data.Results.ResMaxSTARR.finalResults.DailyAveTurnover = Data.Results.ResMaxSTARR.aveTurnover(startDay);
    Data.Results.ResMaxSTARR.finalResults.DailySTD = Data.Results.ResMaxSTARR.STD(startDay);
    Data.Results.ResMaxSTARR.finalResults.DailyAveReturns = Data.Results.ResMaxSTARR.AveReturns(startDay);
    Data.Results.ResMaxSTARR.finalResults.DailyFinalWealth = Data.Results.ResMaxSTARR.finalWealth(startDay);
    %%% Robustness check DAILY
    Data.Results.ResMaxSTARR.finalResults.DailyAveP = mean(Data.Results.ResMaxSTARR.p);
    Data.Results.ResMaxSTARR.finalResults.DailyAvePin95 = size(Data.Results.ResMaxSTARR.p(Data.Results.ResMaxSTARR.p < 0.05))/253;
    %%% START DAY WEEKLY
    Data.Results.ResMaxSTARR.finalResults.WeeklyVaR = Data.Results.ResMaxSTARR.WeeklyVaR(startDay);
    Data.Results.ResMaxSTARR.finalResults.WeeklyCVaR = Data.Results.ResMaxSTARR.WeeklyCVaR(startDay);
    Data.Results.ResMaxSTARR.finalResults.WeeklySTARR = Data.Results.ResMaxSTARR.WeeklySTARR(startDay);
    Data.Results.ResMaxSTARR.finalResults.WeeklyMeanVaR = Data.Results.ResMaxSTARR.WeeklymeanVaR(startDay);
    Data.Results.ResMaxSTARR.finalResults.WeeklySharpe = Data.Results.ResMaxSTARR.WeeklySharpe(startDay);
    Data.Results.ResMaxSTARR.finalResults.WeeklyAveTurnover = Data.Results.ResMaxSTARR.WeeklyaveTurnover(startDay);
    Data.Results.ResMaxSTARR.finalResults.WeeklySTD = Data.Results.ResMaxSTARR.WeeklySTD(startDay);
    Data.Results.ResMaxSTARR.finalResults.WeeklyAveReturns = Data.Results.ResMaxSTARR.WeeklyAveReturns(startDay);
    Data.Results.ResMaxSTARR.finalResults.WeeklyFinalWealth = Data.Results.ResMaxSTARR.WeeklyfinalWealth(startDay);
    %%% Robustness check WEEKLY
    Data.Results.ResMaxSTARR.finalResults.WeeklyAveP = mean(Data.Results.ResMaxSTARR.Weeklyp);
    Data.Results.ResMaxSTARR.finalResults.WeeklyAvePin95 = size(Data.Results.ResMaxSTARR.Weeklyp(Data.Results.ResMaxSTARR.Weeklyp < 0.05))/253;
    %%% START DAY QUARTERLY
    Data.Results.ResMaxSTARR.finalResults.QuartVaR = Data.Results.ResMaxSTARR.QuartVaR(startDay);
    Data.Results.ResMaxSTARR.finalResults.QuartCVaR = Data.Results.ResMaxSTARR.QuartCVaR(startDay);
    Data.Results.ResMaxSTARR.finalResults.QuartSTARR = Data.Results.ResMaxSTARR.QuartSTARR(startDay);
    Data.Results.ResMaxSTARR.finalResults.QuartMeanVaR = Data.Results.ResMaxSTARR.QuartmeanVaR(startDay);
    Data.Results.ResMaxSTARR.finalResults.QuartSharpe = Data.Results.ResMaxSTARR.QuartSharpe(startDay);
    Data.Results.ResMaxSTARR.finalResults.QuartAveTurnover = Data.Results.ResMaxSTARR.QuartaveTurnover(startDay);
    Data.Results.ResMaxSTARR.finalResults.QuartSTD = Data.Results.ResMaxSTARR.QuartSTD(startDay);
    Data.Results.ResMaxSTARR.finalResults.QuartAveReturns = Data.Results.ResMaxSTARR.QuartAveReturns(startDay);
    Data.Results.ResMaxSTARR.finalResults.QuartFinalWealth = Data.Results.ResMaxSTARR.QuartfinalWealth(startDay);
    %%% Robustness check QUARTERLY
    Data.Results.ResMaxSTARR.finalResults.QuartAveP = mean(Data.Results.ResMaxSTARR.Quartp);
    Data.Results.ResMaxSTARR.finalResults.QuartAvePin95 = size(Data.Results.ResMaxSTARR.Quartp(Data.Results.ResMaxSTARR.Quartp < 0.05))/253;
end
end



