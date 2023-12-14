function [Data] = YearlyPortMeanVaR(Data)

    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.YearlymeanVaR = ((1/252)*Data.Results.MaxSharpe.YearlyAveReturns./Data.Results.MaxSharpe.YearlyVaR);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.YearlymeanVaR = ((1/252)*Data.Results.MinCVaR.YearlyAveReturns./Data.Results.MinCVaR.YearlyVaR);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.YearlymeanVaR = ((1/252)*Data.Results.MaxSTARR.YearlyAveReturns./Data.Results.MaxSTARR.YearlyVaR);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.YearlymeanVaR = ((1/252)*Data.Results.ResMaxSharpe.YearlyAveReturns./Data.Results.ResMaxSharpe.YearlyVaR);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.YearlymeanVaR = ((1/252)*Data.Results.ResMinCVaR.YearlyAveReturns./Data.Results.ResMinCVaR.YearlyVaR);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.YearlymeanVaR = ((1/252)*Data.Results.ResMaxSTARR.YearlyAveReturns./Data.Results.ResMaxSTARR.YearlyVaR);
    end
end

