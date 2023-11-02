function [rho, nu, eta_t] = Student_t_Copula(data)
    count = 1;
    sample_size = 10000;
    z = data.z_GARCH_t;
    uniform = tcdf(z, 5);
%     for row = 1:size(z,1)
%         for col = 1:size(z,2)
%             if uniform(row, col) == 1
%                 uniform(row, col) = 0.9999999999999999;
%                 count = count + 1;
%             end
%         end
%     end
    [rho,nu] = copulafit('t',uniform,'Method','ApproximateML');
    sample = copularnd('t', rho, nu, sample_size);
    eta_t = tinv(sample, 5);
    disp(count)
end

