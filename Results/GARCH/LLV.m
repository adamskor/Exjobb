LLVGARCHGauss = zeros(1, Data.Info.nAssets);
LLVGARCHt = zeros(1, Data.Info.nAssets);
LLVEGARCHGauss = zeros(1, Data.Info.nAssets);
LLVEGARCHt = zeros(1, Data.Info.nAssets);

for asset = 1:Data.Info.nAssets
    LLVGARCHGauss(1, asset) = mean(squeeze(Data.Univariate.GARCHGauss.LLV(:,asset,:)));
end
for asset = 1:Data.Info.nAssets
    LLVGARCHt(1, asset) = mean(squeeze(Data.Univariate.GARCHt.LLV(:,asset,:)));
end
for asset = 1:Data.Info.nAssets
    LLVEGARCHGauss(1, asset) = mean(squeeze(Data.Univariate.EGARCHGauss.LLV(:,asset,:)));
end
for asset = 1:Data.Info.nAssets
    LLVEGARCHt(1, asset) = mean(squeeze(Data.Univariate.EGARCHt.LLV(:,asset,:)));
end
mean(LLVGARCHGauss)
mean(LLVGARCHt)
mean(LLVEGARCHGauss)
mean(LLVEGARCHt)
