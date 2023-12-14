function [Data] = YearlyPortSTARR(Data)

    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.YearlySTARR = ((1/252)*Data.Results.MaxSharpe.YearlyAveReturns./Data.Results.MaxSharpe.YearlyCVaR);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.YearlySTARR = ((1/252)*Data.Results.MinCVaR.YearlyAveReturns./Data.Results.MinCVaR.YearlyCVaR);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.YearlySTARR = ((1/252)*Data.Results.MaxSTARR.YearlyAveReturns./Data.Results.MaxSTARR.YearlyCVaR);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.YearlySTARR = ((1/252)*Data.Results.ResMaxSharpe.YearlyAveReturns./Data.Results.ResMaxSharpe.YearlyCVaR);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.YearlySTARR = ((1/252)*Data.Results.ResMinCVaR.YearlyAveReturns./Data.Results.ResMinCVaR.YearlyCVaR);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.YearlySTARR = ((1/252)*Data.Results.ResMaxSTARR.YearlyAveReturns./Data.Results.ResMaxSTARR.YearlyCVaR);
    end
end

