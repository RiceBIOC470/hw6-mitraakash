function Variance_Polynomial_Degree_SampleSize(n)

x = randi([0 10], n, 1);

% Random 3rd order polynomial
p = [1 -4 4 33];
% Evaluating for x
y = polyval(p,x);

% Plotting data
figure;
plot(x,y, 'r-')
%set(gca,'FontSize',24);

% Creating noise
noise = -1 + (1+1)*rand(n,1);

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
