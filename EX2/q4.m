load("ex2data.mat");
lambda = 0.01;
sigmas = [0.05, 1, 2];
m = length(Xtrain(:,1));
d= length(Xtrain(1,:));
X = [-5:0.05:5];
Y = [5:-0.05:-5];

for s=1:length(sigmas)
    alpha = softsvmrbf(lambda,sigmas(s),m,d,Xtrain,Ytrain);
    kMatrix =@(x) exp(-vecnorm((Xtrain - x)').^2./(2*sigmas(s)));
	h= @(x) sign(kMatrix(x)*alpha);
    figure(s)
    result = zeros(length(X),length(Y));
    for x=1:length(X)
        for y=1:length(Y)
        sample = [X(x),Y(y)];
        result(y,x) = h(sample);
        end
    end
    heatmap(result,'colormap',colormap([0 0 1; 1 0 0]));
    xlabel(sigmas(s));
    grid off
    colorbar off
end
