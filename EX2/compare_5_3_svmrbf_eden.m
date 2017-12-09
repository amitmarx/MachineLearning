load('mnist_all.mat')

% Distinguishing between the digits 3 and 5
label0train = train3;
label1train = train5;
label0test = test3;
label1test = test5;
values_train = [];
values_test = [];

%scale = -10:1:8;
scale = 0:1:1;
for i = scale
	lambda = 10^i;
	sigma = 1;
	trainsize = 1000;
	[Xtrain,Ytrain,Xtest,Ytest] = gensmallm(label0train,label1train,label0test,label1test,trainsize);
	
	m = length(Ytrain);
    d = 784;
	
	alpha = softsvmrbf(lambda, sigma, m, d, Xtrain, Ytrain)
	hS = Xtrain'*alpha;
	
	
	m = length(Ytrain);
	mistake = distribution_err(hS(1:d), m, Xtrain, Ytrain);
	values_train = [values_train , mistake];

	m = length(Ytest);
	mistake = distribution_err(hS(1:d), m, Xtest,Ytest);
	values_test = [values_test , mistake];
end

x = scale;

figure
hold off
plot(x, values_train,  'LineWidth', 3);
hold on
plot(x, values_test, 'LineWidth', 2);
xlabel ("training sample sizes");

legend('3/5 training error', '3/5 test error');