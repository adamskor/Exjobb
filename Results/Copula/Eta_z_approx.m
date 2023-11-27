%asset = 5;
window = 2000;

%subplot(1,2,1)
for asset = 1:Data.Info.nAssets
    qqplot(Data.Copula.t.eta.Window2000(:, asset), Data.Univariate.EGARCHt.z(:, asset, window));
    ylabel('$\eta$', 'Interpreter', 'latex', 'fontsize', 20)
    xlabel('$z$', 'Interpreter', 'latex', 'fontsize', 20)
    annotation('rectangle',[0 0 1 1],'Color','k');
    exportgraphics(gca,strcat('QQ_Plot_', Data.Info.Assets(asset), '.eps'),"Resolution",600)
   
end