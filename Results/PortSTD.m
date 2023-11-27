function [Data] = PortSTD(Data)
    Data.Results.Bench.STD = std(Data.Results.Bench.Returns)*sqrt(252);
    if Data.Info.Optimisations(1)
    Data.Results.MaxSharpe.STD = std(Data.Results.MaxSharpe.Returns)*sqrt(252);
    end
    if Data.Info.Optimisations(2)
    Data.Results.MinCVaR.STD = std(Data.Results.MinCVaR.Returns)*sqrt(252);
    end
    if Data.Info.Optimisations(3)
    Data.Results.MaxSTARR.STD = std(Data.Results.MaxSTARR.Returns)*sqrt(252);
    end
    if Data.Info.Optimisations(4)
    Data.Results.ResMaxSharpe.STD = std(Data.Results.ResMaxSharpe.Returns)*sqrt(252);
    end
    if Data.Info.Optimisations(5)
    Data.Results.ResMinCVaR.STD = std(Data.Results.ResMinCVaR.Returns)*sqrt(252);
    end
    if Data.Info.Optimisations(6)
    Data.Results.ResMaxSTARR.STD = std(Data.Results.ResMaxSTARR.Returns)*sqrt(252);
    end
   
end

