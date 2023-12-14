%asset = 5; %%% Asset 5 and 11 looks best
window = 1;
buckets = 80;
fSize = 6;
%test = normrnd(0, 1, 100, 1, 200);

%%% GARCH Gauss
for asset = 1:Data.Info.nAssets
    ax = gca; ax.FontSize = 8;
    subplot(2, 2, 1)
    A = Data.Univariate.GARCHGauss.z(:, asset, window);
    A = A( ~any( isnan( A ) | isinf( A ), 2 ),: );
    histfit(A, buckets);
    ax = gca; ax.FontSize = 8; ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('GARCH Residuals, Gaussian assumption', 'FontSize', fSize)
    subplot(2, 2, 2)
    A = Data.Univariate.GARCHt.z(:, asset, window);
    A = A( ~any( isnan( A ) | isinf( A ), 2 ),: );
    histfit(A, buckets,'tLocationScale', 0, 1,  Data.Univariate.GARCHt.Params(5, asset, window));
    ax = gca; ax.FontSize = 8;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('GARCH Residuals, Student-t assumption', 'FontSize', fSize)
    subplot(2, 2, 3)
    A = squeeze(Data.Univariate.EGARCHGauss.z(:, asset, window));
    A = A( ~any( isnan( A ) | isinf( A ), 2 ),: );
    histfit(A, buckets);
    ax = gca; ax.FontSize = 8;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('EGARCH Residuals, Gaussian assumption', 'FontSize', fSize)
    subplot(2, 2, 4)
    A = squeeze(Data.Univariate.EGARCHt.z(:, asset, window));
    A = A( ~any( isnan( A ) | isinf( A ), 2 ),: );
    histfit(A, buckets,'tLocationScale', 0, 1,  Data.Univariate.EGARCHt.Params(5, asset, window));
    ax = gca; ax.FontSize = 8;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('EGARCH Residuals, Student-t assumption', 'FontSize', fSize)
    annotation('rectangle',[0 0 1 1],'Color','k');
    ax = gca;
    exportgraphics(gcf,strcat('Uni_Histogram_Plot_', Data.Info.Assets(asset), '.eps'),"Resolution",600)
end


