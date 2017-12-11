load("ex2data.mat");
lambda = 0.01;
sigmas = [0.05, 1, 2];
m = length(Xtrain(:,1));
d= length(Xtrain(1,:));

for s=1:length(sigmas)
    alpha = softsvmrbf(lambda,sigmas(s),m,d,Xtrain,Ytrain);
    
    kMatrix =@(x) exp(-vecnorm((Xtrain - x)').^2./(2*sigmas(s)));
	h= @(x) sign(kMatrix(x)*alpha);
    hold on
    for t=1:length(Xtest(:,1))
        sample = Xtest(t,:);
        y = h(sample);
        colors = ['r','b'];
        label = min(y+1,1);
        plot(sample(1),sample(2),'color',colors(label));
        
    end
    hold off
end
