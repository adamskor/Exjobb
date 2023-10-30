function [] = QQ_plot(data)
    h =  findobj('type','figure');
    n = length(h);
    for i = 1:20
        figure(i + 1)
        subplot(2,2,1)
        pd_1 = fitdist(data.z_GARCH_G(:, i), 'Normal');
        qqplot(data.z_GARCH_G(:, i), pd_1)
        title(data.assets{i})
        subplot(2,2,2)
        pd_2 = fitdist(data.z_GARCH_t(:, i), 'tLocationScale');
        qqplot(data.z_GARCH_t(:, i), pd_2)
        title(data.assets{i})
        subplot(2,2,3)
        pd_3 = fitdist(data.z_EGARCH_G(:, i), 'Normal');
        qqplot(data.z_EGARCH_t(:, i), pd_3)
        title(data.assets{i})
        subplot(2,2,4)
        pd_4 = fitdist(data.z_EGARCH_t(:, i), 'tLocationScale');
        qqplot(data.z_EGARCH_t(:, i), pd_4)
        title(data.assets{i})
    end
end

