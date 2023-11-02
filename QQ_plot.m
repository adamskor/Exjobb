function [] = QQ_plot(data)
    h =  findobj('type','figure');
    n = length(h);
    for i = 1:20
        
        figure(i)
        subplot(2,2,1)
        qqplot(data.z_GARCH_G(:, i))
        title(data.assets{i})
        
        
        
        figure(i+20)
        subplot(2,2,1)
        
        var = zeros(length(data.returns_OOS(:, i)),1);
        var(1) = (data.eps(end, i) / data.z_GARCH_G(end, i))^2;
        params = data.params_GARCH_G(:, i);
        for p=2:length(data.returns_OOS(:, i))
            var(p) = params(1) + params(2)*(data.returns_OOS(p-1, i) - mean(data.returns_OOS(:, i)))^2 + params(3)*var(p-1)^2;
        end
        eps_OOS = data.returns_OOS(:, i) - mean(data.returns_OOS(:, i));
        z_OOS = eps_OOS./sqrt(var);
        qqplot(z_OOS)
        title(data.assets{i})
        
        
        
        figure(i)
        subplot(2,2,2)
        pd_2 = fitdist(data.z_GARCH_t(:, i), 'tLocationScale');
        qqplot(data.z_GARCH_t(:, i), pd_2)
        title(data.assets{i})
        
        figure(i+20)
        subplot(2,2,2)
        var = zeros(length(data.returns_OOS(:, i)),1);
        var(1) = (data.eps(end, i) / data.z_GARCH_t(end, i))^2;
        params = data.params_GARCH_t(:, i);
        for p=2:length(data.returns_OOS(:, i))
            var(p) = params(1) + params(2)*(data.returns_OOS(p-1, i) - mean(data.returns_OOS(:, i)))^2 + params(3)*var(p-1)^2;
        end
        eps_OOS = data.returns_OOS(:, i) - mean(data.returns_OOS(:, i));
        z_OOS = eps_OOS./sqrt(var);
        qqplot(z_OOS, pd_2)
        title(data.assets{i})
        
        figure(i)
        subplot(2,2,3)
        pd_3 = fitdist(data.z_EGARCH_G(:, i), 'Normal');
        qqplot(data.z_EGARCH_t(:, i), pd_3)
        title(data.assets{i})
        
        
        figure(i+20)
        subplot(2,2,3)
        var = zeros(length(data.returns_OOS(:, i)),1);
        var(1) = (data.eps(end, i) / data.z_EGARCH_G(end, i))^2;
        params = data.params_EGARCH_G(:, i);
        for p=2:length(data.returns_OOS(:, i))
            var(p) = exp( params(1) + params(2)*(log(var(p-1))) + ...
                         params(3)*(abs(eps(p-1)))/var(p-1) + ...
                         params(4)*((abs(eps(p-1)))/var(p-1) - sqrt(2/pi)));
        end
        eps_OOS = data.returns_OOS(:, i) - mean(data.returns_OOS(:, i));
        z_OOS = eps_OOS./sqrt(var);
        qqplot(z_OOS, pd_3)
        title(data.assets{i})
        
        
        
        figure(i)
        subplot(2,2,4)
        pd_4 = fitdist(data.z_EGARCH_t(:, i), 'tLocationScale');
        qqplot(data.z_EGARCH_t(:, i), pd_4)
        title(data.assets{i})
        figure(i+20)
        subplot(2,2,4)
        var = zeros(length(data.returns_OOS(:, i)),1);
        var(1) = (data.eps(end, i) / data.z_EGARCH_t(end, i))^2;
        params = data.params_EGARCH_t(:, i);
        eps_OOS = data.returns_OOS(:, i) - mean(data.returns_OOS(:, i));
        for p=2:length(data.returns_OOS(:, i))
            var(p) = exp( params(1) + params(2)*(log(var(p-1))) + ...
                         params(3)*(abs(eps_OOS(p-1)))/var(p-1) + ...
                         params(4)*((abs(eps_OOS(p-1)))/var(p-1) - ...
                         sqrt((params(5) - 2)/ pi)*(gamma((params(5) - 1)/2)/gamma((params(5))/2))));
        end
        z_OOS = eps_OOS./sqrt(var);
        qqplot(z_OOS, pd_4)
        title(data.assets{i})
        figure(i)
        suptitle('In Sample')
        figure(i+20)
        suptitle('Out of Sample')
        
    end
end

