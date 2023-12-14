asset = 5; %%% Asset 5 and 11 looks best
window = 1;
fSize = 6;
%test = normrnd(0, 1, 100, 1, 200);

%%% GARCH Gauss
%zGauss = reshape(squeeze(Data.Univariate.GARCHGauss.z(:, asset, :)), 1, []);
for asset = 1:Data.Info.nAssets
    ax = gca; ax.FontSize = 8;
    %%%
    subplot(2, 2, 1)
    A = squeeze(Data.Univariate.GARCHGauss.z(:, asset, window));
    A = A( ~any( isnan( A ) | isinf( A ), 2 ),: );
    qqplot(A);
    ax = gca; ax.FontSize = 8; ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('GARCH Residuals, Gaussian assumption', 'FontSize', fSize)
    ylabel('$z$', 'Interpreter', 'latex', 'fontsize', 10)
    xlabel('Assumed Distribution', 'fontsize', 10)
    %%%
    subplot(2, 2, 2)
    pd1 = makedist('tLocationScale', 0, 1,  Data.Univariate.GARCHt.Params(5, asset, window));
    A = squeeze(Data.Univariate.GARCHt.z(:, asset, window));
    A = A( ~any( isnan( A ) | isinf( A ), 2 ),: );
    qqplot(A, pd1);
    ax = gca; ax.FontSize = 8;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('GARCH Residuals, Student-t assumption', 'FontSize', fSize)
    ylabel('$z$', 'Interpreter', 'latex', 'fontsize', 10)
    xlabel('Assumed Distribution', 'fontsize', 10)
    %%%
    subplot(2, 2, 3)
    A = squeeze(Data.Univariate.EGARCHGauss.z(:, asset, window));
    A = A( ~any( isnan( A ) | isinf( A ), 2 ),: );
    qqplot(A);
    ax = gca; ax.FontSize = 8;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('EGARCH Residuals, Gaussian assumption', 'FontSize', fSize)
    ylabel('$z$', 'Interpreter', 'latex', 'fontsize', 10)
    xlabel('Assumed Distribution', 'fontsize', 10)
    %%%
    subplot(2, 2, 4)
    pd2 = makedist('tLocationScale', 0, 1,  Data.Univariate.EGARCHt.Params(5, asset, window));
    A = squeeze(Data.Univariate.EGARCHt.z(:, asset, window));
    A = A( ~any( isnan( A ) | isinf( A ), 2 ),: );
    qqplot(A, pd2);
    ax = gca; ax.FontSize = 8;  ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
    title('EGARCH Residuals, Student-t assumption', 'FontSize', fSize)
    ylabel('$z$', 'Interpreter', 'latex', 'fontsize', 10)
    xlabel('Assumed Distribution', 'fontsize', 10)
    annotation('rectangle',[0 0 1 1],'Color','k');
    exportgraphics(gcf,strcat('Uni_QQ_Plot_', Data.Info.Assets(asset), '.eps'),"Resolution",600)
end


