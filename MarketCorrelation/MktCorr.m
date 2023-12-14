returns = [squeeze(Data.TimeSeries.Returns(1, : , :))' squeeze(Data.TimeSeries.MSCI(1, :, :)) squeeze(Data.TimeSeries.volIndex(1, :, :))];
eps = [squeeze(Data.TimeSeries.eps(1, :, :))' squeeze(Data.TimeSeries.MSCIeps(1, :, :)) squeeze(Data.TimeSeries.volIndexeps(1, :, :))];
r1 = returns(:, 1); r2 = returns(:, 2); r3 = returns(:, 3); r4 = returns(:, 4); r5 = returns(:, 5); r6 = returns(:, 6); r7 = returns(:, 7);
r8 = returns(:, 8); r9 = returns(:, 9); r10 = returns(:, 10); r11 = returns(:, 11); r12 = returns(:, 12); r13 = returns(:, 13); 
r14 = returns(:, 14); r15 = returns(:, 15); r16 = returns(:, 16);
u1 = ksdensity(r1,r1,'function','cdf'); u2 = ksdensity(r2,r2,'function','cdf');
u3 = ksdensity(r3,r3,'function','cdf'); u4 = ksdensity(r4,r4,'function','cdf');
u5 = ksdensity(r5,r5,'function','cdf'); u6 = ksdensity(r6,r6,'function','cdf');
u7 = ksdensity(r7,r7,'function','cdf'); u8 = ksdensity(r8,r8,'function','cdf');
u9 = ksdensity(r9,r9,'function','cdf'); u10 = ksdensity(r10,r10,'function','cdf');
u11 = ksdensity(r11,r11,'function','cdf'); u12 = ksdensity(r12,r12,'function','cdf');
u13 = ksdensity(r13,r13,'function','cdf'); u14 = ksdensity(r14,r14,'function','cdf');
u15 = ksdensity(r15,r15,'function','cdf'); u16 = ksdensity(r16,r16,'function','cdf');
%%
[Rho,nu] = copulafit('t',[u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16],'Method','ApproximateML');
%%
Rho = round(Rho,2,"significant");

h = heatmap(Rho, 'ColorLimits' , [min(min(Rho))- 1 max(max(Rho))], 'Colormap',gray, 'FontSize', 16)
labels = [Data.Info.Assets 'MSCI' 'VSTOXX'];
h.XDisplayLabels = labels;
h.YDisplayLabels = labels;
h.CellLabelColor = 'black';
h.ColorbarVisible = 'off';

h.Title = 'Estimated correlation matrix from Student´s-t copula';
annotation('rectangle',[0 0 1 1],'Color','k');
exportgraphics(gca,strcat('Cop_Corr_Matrix.eps'),"Resolution",600)