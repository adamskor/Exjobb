function [Data] = Student_t_Copula(z, params, Data)
    sample_size = Data.Info.Parameters.simSampleSize;
    DoF = zeros(size(z));
    for window = 1:size(z,3)
        for column = 1:size(DoF, 2)
            DoF(:, column, window) = params(5, column, window);
        end
    end
    uniform_t = tcdf(z, DoF);
    rho = zeros(size(z,2), size(z,2), size(z,3));
    uniform = zeros(size(z,1), size(z,2), size(z,3));
    sample = zeros(sample_size, size(z,2), size(z,3));
    nu = zeros(1, size(z,3));
    LLV = zeros(1, size(z,3));
    for window = 1:size(z, 3)
        for asset = 1:size(z, 2)
            %%% Avoid 0 and 1 values from cdf function
            uniform(:, asset, window) = rescale(uniform_t(:, asset, window), 0.00001, 0.99999);
        end
    end
    DoF = zeros(size(sample));
    for window = 1:size(z,3)
        for column = 1:size(DoF, 2)
            DoF(:, column, window) = params(5, column, window);
        end
    end
    for window = 1:size(z, 3)
        disp(window)
        [rho(:, :, window), nu(:, window)] = copulafit('t',uniform(:,: ,window),'Method','ApproximateML');
        sample(:, :, window) = copularnd('t', rho(:, :, window), nu(:, window), sample_size);
        Data.Copula.t.eta.(strcat('Window ', num2str(window))) = tinv(sample(:, :, window), DoF(:, :, window));
        copula_pdf = copulapdf('t', uniform(:,: ,window), rho(:, :, window), nu(:, window));
        LLV(:,window) = sum(log(copula_pdf));
    end
    
%     DoF = zeros(size(sample));
%     for window = 1:size(z,3)
%         for column = 1:size(DoF, 2)
%             DoF(:, column, window) = params(5, column, window);
%         end
%     end
    Data.Copula.t.Rho = rho;
    Data.Copula.t.nu = nu;
    Data.Copula.t.LLV = LLV;
    
    
    
end

