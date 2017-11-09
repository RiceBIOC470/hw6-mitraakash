% Akash Mitra
% am132

%HW6

% Problem 1. Curve fitting. 
% Part 1. Take 10 x values on the interval 0 < x <= 10 and then create y
% values from the x values by plugging the x values into a third order
% polynomial of your choice. Add random noise to the data by choosing a random number
% in the interval [-D, D]. Start with D = 1. Plot your data in the x-y plane.

x = randi([0 10], 10, 1);

% Random 3rd order polynomial
p = [1 -4 4 33];
% Evaluating for x
y = polyval(p,x);

% Plotting data
figure;
plot(x,y, 'r-')
%set(gca,'FontSize',24);

% Creating noise
noise = -1 + (1+1)*rand(10,1);

% Random sampling from noise and insert into x
xx = x;
randindices = randperm(numel(xx)/2, numel(noise)/2);
randindices2 = randperm(numel(xx)/2, numel(noise)/2);
xx(randindices) = noise(randindices2);

% Random sampling in y
yy = y;
randindices = randperm(numel(yy)/2, numel(noise)/2);
randindices2 = randperm(numel(yy)/2, numel(noise)/2);
yy(randindices2) = noise(randindices);
plot(xx,yy, 'b-')

plot(xx, yy, x, y)
legend ('Noisy data','Random data');


% Part 2. Fit your data with polynomials from order 1 to 9. Plot the fitted
% polynomials together with the data. 

fit_1 = fit(xx, yy, 'poly1');
plot(fit_1, xx,yy)
set(gca,'FontSize',24);

fit_2 = fit(xx, yy, 'poly2');
plot(fit_2, xx,yy)
set(gca,'FontSize',24);

fit_3 = fit(xx, yy, 'poly3');
plot(fit_3, xx,yy)
set(gca,'FontSize',24);

fit_4 = fit(xx, yy, 'poly4');
plot(fit_4, xx,yy)
set(gca,'FontSize',24);

fit_5 = fit(xx, yy, 'poly5');
plot(fit_5, xx,yy)
set(gca,'FontSize',24);

fit_6 = fit(xx, yy, 'poly6');
plot(fit_6, xx,yy)
set(gca,'FontSize',24);

fit_7 = fit(xx, yy, 'poly7');
plot(fit_7, xx,yy)
set(gca,'FontSize',24);

fit_8 = fit(xx, yy, 'poly8');
plot(fit_8, xx,yy)
set(gca,'FontSize',24);

fit_9 = fit(xx, yy, 'poly9');
plot(fit_9, xx,yy)
set(gca,'FontSize',24);


% Part 3. On a separate plot, plot the R^2 and adjusted R^2 as a function
% of the order of the polynomial. 

[fit_out1, fit_metric1] = fit(xx,yy, fit_1);
[fit_out2, fit_metric2] = fit(xx,yy, fit_2);
[fit_out3, fit_metric3] = fit(xx,yy, fit_3);
[fit_out4, fit_metric4] = fit(xx,yy, fit_4);
[fit_out5, fit_metric5] = fit(xx,yy, fit_5);
[fit_out6, fit_metric6] = fit(xx,yy, fit_6);
[fit_out7, fit_metric7] = fit(xx,yy, fit_7);
[fit_out8, fit_metric8] = fit(xx,yy, fit_8);
[fit_out9, fit_metric9] = fit(xx,yy, fit_9);

rsquare = [fit_metric1.rsquare, fit_metric2.rsquare, fit_metric3.rsquare, fit_metric4.rsquare, fit_metric5.rsquare, fit_metric6.rsquare, fit_metric7.rsquare, fit_metric8.rsquare, fit_metric9.rsquare];
adf_rsquare = [fit_metric1.adjrsquare, fit_metric2.adjrsquare, fit_metric3.adjrsquare, fit_metric4.adjrsquare, fit_metric5.adjrsquare, fit_metric6.adjrsquare, fit_metric7.adjrsquare, fit_metric8.adjrsquare, fit_metric9.adjrsquare];

poly_degree = [1,2,3,4,5,6,7,8,9];

plot(poly_degree, rsquare, poly_degree, adf_rsquare);
legend ('R Square','Adjusted R Square');
title('Comparison of R Square and adjusted R Square over various polynomial degrees')
xlabel('Degree of Polynomial');
ylabel('R/Adjusted R Square');

% Part 4. Repeat parts 1 - 3 for D = 10 and D = 1000. Comment on the
% results. 

Variance_Polynomial_Degree(1);
Variance_Polynomial_Degree(10);
Variance_Polynomial_Degree(1000);

% The value of R and R square are closer with a smaller interval. The lines
% almost intersect with a degree of polynomial 2. As the interval is 
% increased, the R and R square grow further apart. At a larger interval,
% the R and R square take longer/higher degree of polynomial to intersect.

% Part 5. Now repeat parts 1-3 but take 100 x values on the interval 0 < x <=
% 10. Comment on the results. 

Variance_Polynomial_Degree_SampleSize(100);

% With a larger sampele size, the R and R Square overlap on all the 
% polynomial degrees.


% Problem 2. Basic statistics. 
% Part 1. Consider two different distributions - Gaussian numbers with a mean of
% 0 and variance 1 and Gaussian numbers with a mean of 1 and variance 1.
% (1) Make a plot of the average p-value for the t-test comparing N random
% numbers chosen from each of these two distributions as a function of N.

% Generate first set of Gaussian numbers

R = randn(10);
R1 = R(:) - mean(R(:));
R1_norm = reshape(R1/std(R1),size(R));

% Generate second set of Gaussian numbers
mean1 = 1;
std1 = 1;
R = randn(10);
R2 = R(:) - mean(R(:));
s = R2/std(R2)*std1;
R2_norm = reshape(s + mean1,size(R));

% Use N random points

Pval_overN(100,R1_norm, R2_norm);

% Part 2. Now keep the first distribution the same, but vary the mean of
% the second distribution between 0 and 10 with the same variance and
% repeat part one. Make a plot of all of these different curves on the same
% set of axes. What is special about the case where the mean of the second
% distribution is 0? 

% Generate new set of Gaussian numbers for second distribution

for i=0:10
    mean1 = i;
    std1 = 1;
    R = randn(10);
    R2 = R(:) - mean(R(:));
    s = R2/std(R2)*std1;
    R2_norm = reshape(s + mean1,size(R));

    [mean(R2_norm(:)),std(R2_norm(:))]

    Pval_inRange(100,R1_norm, R2_norm);
    
end

% With a mean of 0 in the second distribution, we obtain a scattered p
% value plot that starts high, is downward sloping and then proceeds to
% move upward to reach 1. All the other points are downward sloping towards
% 0.

% Part 3. Now keep the means of the two distributions at 0 and 1 as in part
% 1, but vary the variance of both distributions simultaneiously between 0.1 and 10 and plot the 
% p-values vs the number of numbers drawn as before. Comment on your results.  

for i=0.1:0.1:10

    % First set of Gaussian numbers
    mean1 = 0;
    std1 = i;
    R = randn(10);
    R1 = R(:) - mean(R(:));
    s = R1/std(R1)*std1;
    R1_norm = reshape(s + mean1,size(R));

    % Second set of Gaussian numbers
    mean2 = 1;
    std2 = i;
    R = randn(10);
    R2 = R(:) - mean(R(:));
    s = R2/std(R2)*std2;
    R2_norm = reshape(s + mean2,size(R));
    
    for j=0:10
        mean1 = j;
        std1 = 1;
        R = randn(10);
        R2 = R(:) - mean(R(:));
        s = R2/std(R2)*std1;
        R2_norm = reshape(s + mean1,size(R));

        Pval_inRange(100,R1_norm, R2_norm);

    end
end

% With variance between 0.1 and 10, the p-value plots are scattered all
% over the place. There are points with lower N sampling (closer to 0) that
% have p values between 0 and 1, and points with higher N sampling(closer 
% to 100). Due to changes in variance, there are drastic changes in p-
% values. 
% Note: To actually view the changes better, increment for loop by
% 1 instead of 0.1
