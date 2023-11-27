%asset = 5; %%% Asset 5 and 11 looks best
window = 100;
buckets = 150;
fSize = 18;
%test = normrnd(0, 1, 100, 1, 200);

%%% GARCH Gauss
for asset = 1:Data.Info.nAssets
    ax = gca; ax.FontSize = 14;
    subplot(2, 2, 1)
    histfit(squeeze(Data.Univariate.GARCHGauss.z(:, asset, window)), buckets);
    ax = gca; ax.FontSize = 14; ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('GARCH Residuals, Gaussian assumption', 'FontSize', fSize)
    subplot(2, 2, 2)
    histfit(squeeze(Data.Univariate.GARCHt.z(:, asset, window)), buckets,'tLocationScale', 0, 1,  Data.Univariate.GARCHt.Params(5, asset, window));
    ax = gca; ax.FontSize = 14;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('GARCH Residuals, Student-t assumption', 'FontSize', fSize)
    subplot(2, 2, 3)
    histfit(squeeze(Data.Univariate.EGARCHGauss.z(:, asset, window)), buckets);
    ax = gca; ax.FontSize = 14;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('EGARCH Residuals, Gaussian assumption', 'FontSize', fSize)
    subplot(2, 2, 4)
    histfit(squeeze(Data.Univariate.EGARCHt.z(:, asset, window)), buckets,'tLocationScale', 0, 1,  Data.Univariate.EGARCHt.Params(5, asset, window));
    ax = gca; ax.FontSize = 14;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('EGARCH Residuals, Student-t assumption', 'FontSize', fSize)
    annotation('rectangle',[0 0 1 1],'Color','k');
    ax = gca;
    exportgraphics(ax,strcat('Histogram_Plot_', Data.Info.Assets(asset), '.jpg'),"Resolution",600)
end


