function Pval_inRange(N,R1_norm, R2_norm)

for i = 1:N
    
    randindices3 = randperm(i);
    new_gaussian_1 = R1_norm(randindices3);

    randindices4 = randperm(i);
    new_gaussian_2 = R2_norm(randindices4);
    [is_sig(i), pval(i)] = ttest2(new_gaussian_1,new_gaussian_2);
end

hold on;
plot(1:N,pval);
hold on;
title('Comparison of P value as a function of N')
xlabel('N');
ylabel('P-value');