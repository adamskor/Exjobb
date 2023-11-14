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
    for window = 1:size(z, 3)
        for asset = 1:size(z, 2)
            uniform(:, asset, window) = rescale(uniform_t(:, asset, window), 0.1, 0.9);
        end
    end
    for window = 1:size(z, 3)
        disp(window)
        [rho(:, :, window), nu(:, window)] = copulafit('t',uniform(:,: ,window),'Method','ApproximateML');
        sample(:, :, window) = copularnd('t', rho(:, :, window), nu(:, window), sample_size);
    end
    
    DoF = zeros(size(sample));
    for window = 1:size(z,3)
        for column = 1:size(DoF, 2)
            DoF(:, column, window) = params(5, column, window);
        end
    end
    copula_pdf = copulapdf('t', uniform, rho, nu);
    Data.Copula.t.Rho = rho;
    Data.Copula.t.eta = tinv(sample, DoF);
    Data.Copula.t.nu = nu;
    Data.Copula.t.LLV = sum(log(copula_pdf));
    
    function [out] = squeeze(in)
        disp('hello')
        out = in;
        for depth = 1:size(in,3)
            for col = 1:size(in,2)
                for row = 1:size(in, 1)
                    if in(row, col, depth) == 0 || in(row, col, depth) < 0
                        out(row, col, depth) = 0.1;
                    end
                    if in(row, col, depth) == 1 || in(row, col, depth) > 1
                        out(row, col, depth) = 0.9;
                        disp('one')
                    end
                end
            end
        end
    end
    
end

