

Skew = skewness(Data.TimeSeries.allReturns)
Kurt = kurtosis(Data.TimeSeries.allReturns)

[h_0, pValue] = EngleArchTest(Data, 0)