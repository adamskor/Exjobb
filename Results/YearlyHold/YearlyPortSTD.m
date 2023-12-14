function [Data] = YearlyPortSTD(Data)
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.YearlySTD = std(Data.Results.MaxSharpe.YearlyReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.YearlySTD = std(Data.Results.MinCVaR.YearlyReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.YearlySTD = std(Data.Results.MaxSTARR.YearlyReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.YearlySTD = std(Data.Results.ResMaxSharpe.YearlyReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.YearlySTD = std(Data.Results.ResMinCVaR.YearlyReturns)*sqrt(252);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.YearlySTD = std(Data.Results.ResMaxSTARR.YearlyReturns)*sqrt(252);
    end
   
end

