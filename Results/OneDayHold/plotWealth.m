plot(Bench.Wealth(:,1), 'LineWidth',0.5)
hold on
plot(MaxSharpe.Wealth(:,1), 'LineWidth',0.5)
plot(MinCVaR.Wealth(:,1), 'LineWidth',0.5)
plot(MaxSTARR.Wealth(:,1), 'LineWidth',0.5)
ax = gca; ax.FontSize = 14; ax.XAxis.TickLength = [0 0]; ax.YAxis.TickLength = [0 0];
pbaspect([1 1 1])
ylim([80 1050])
xlim([-50 3550])
legend('Billinger Förvaltning', 'MaxSharpe', 'MinCVaR', 'MaxSTARR', 'Location','northwest')
ylabel('Wealth', 'fontsize', 14)
xlabel('Day', 'fontsize', 14)
annotation('rectangle',[0 0 1 1],'Color','k');
exportgraphics(gcf,strcat('Wealth_Plot','.eps'),"Resolution",600)
exportgraphics(gcf,strcat('Wealth_Plot', '.jpg'),"Resolution",600)








