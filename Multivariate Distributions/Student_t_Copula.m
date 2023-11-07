function [Data] = Student_t_Copula(z, params, Data)
    count = 1;
    sample_size = Data.Info.Parameters.simSampleSize;
    DoF = zeros(size(z));
    for window = 1:size(z,3)
        for column = 1:size(DoF, 2)
            DoF(:, column, window) = params(5, column, window);
        end
    end
    uniform = tcdf(z, DoF);
    rho = zeros(size(z,2), size(z,2), size(z,3));
    sample = zeros(sample_size, size(z,2), size(z,3));
    nu = zeros(1, size(z,3));
%     for row = 1:size(z,1)
%         for col = 1:size(z,2)
%             if uniform(row, col) == 1
%                 uniform(row, col) = 0.9999999999999999;
%                 count = count + 1;
%             end
%         end
%     end
    for window = 1:size(z, 3)
        [rho(:, :, window), nu(:, window)] = copulafit('t',uniform,'Method','ApproximateML');
        sample(:, :, window) = copularnd('t', rho(:, :, window), nu(:, window), sample_size);
    end
    
    DoF = zeros(size(sample));
    for window = 1:size(z,3)
        for column = 1:size(DoF, 2)
            DoF(:, column, window) = params(5, column, window);
        end
    end
    Data.Copula.t.Rho = rho;
    Data.Copula.t.eta = tinv(sample, nu*ones(sample_size, 20));
    Data.Copula.t.nu = nu;
end

