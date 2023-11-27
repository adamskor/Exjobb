asset = 5; %%% Asset 5 and 11 looks best
window = 1;
fSize = 18;
%test = normrnd(0, 1, 100, 1, 200);

%%% GARCH Gauss
%zGauss = reshape(squeeze(Data.Univariate.GARCHGauss.z(:, asset, :)), 1, []);
for asset = 1:Data.Info.nAssets
    ax = gca; ax.FontSize = 14;
    %%%
    subplot(2, 2, 1)
    qqplot(squeeze(Data.Univariate.GARCHGauss.z(:, asset, window)));
    ax = gca; ax.FontSize = 14; ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('GARCH Residuals, Gaussian assumption', 'FontSize', fSize)
    ylabel('$z$', 'Interpreter', 'latex', 'fontsize', 14)
    xlabel('Assumed Distribution', 'fontsize', 14)
    %%%
    subplot(2, 2, 2)
    pd1 = makedist('tLocationScale', 0, 1,  Data.Univariate.GARCHt.Params(5, asset, window));
    qqplot(squeeze(Data.Univariate.GARCHt.z(:, asset, window)), pd1);
    ax = gca; ax.FontSize = 14;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('GARCH Residuals, Student-t assumption', 'FontSize', fSize)
    ylabel('$z$', 'Interpreter', 'latex', 'fontsize', 14)
    xlabel('Assumed Distribution', 'fontsize', 14)
    %%%
    subplot(2, 2, 3)
    qqplot(squeeze(Data.Univariate.EGARCHGauss.z(:, asset, window)));
    ax = gca; ax.FontSize = 14;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('EGARCH Residuals, Gaussian assumption', 'FontSize', fSize)
    ylabel('$z$', 'Interpreter', 'latex', 'fontsize', 14)
    xlabel('Assumed Distribution', 'fontsize', 14)
    %%%
    subplot(2, 2, 4)
    pd2 = makedist('tLocationScale', 0, 1,  Data.Univariate.EGARCHt.Params(5, asset, window));
    qqplot(squeeze(Data.Univariate.EGARCHt.z(:, asset, window)), pd2);
    ax = gca; ax.FontSize = 14;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('EGARCH Residuals, Student-t assumption', 'FontSize', fSize)
    ylabel('$z$', 'Interpreter', 'latex', 'fontsize', 14)
    xlabel('Assumed Distribution', 'fontsize', 14)
    annotation('rectangle',[0 0 1 1],'Color','k');
    exportgraphics(ax,strcat('QQ_Plot_', Data.Info.Assets(asset), '.jpg'),"Resolution",600)
end


