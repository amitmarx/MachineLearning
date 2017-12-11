load("ex2data.mat")lambdas = [0.01,0.1,1];sigmas = [0.05,1,2];m=length(Xtrain);d=length(Xtrain(1,:));shuffleOrder=randperm(length(Xtrain(:,1)));Xtrain = Xtrain(shuffleOrder,:);Ytrain = Ytrain(shuffleOrder,:);K=5;softsvmrbfResult = zeros(length(lambdas),length(sigmas));for l=1:length(lambdas)    for s=1:length(sigmas)        numberOfRows = length(Xtrain(:,1));        numberOfCols = length(Xtrain(1,:));        groupSize = numberOfRows/K;        totalError=0;        for k=1:K            Vx=Xtrain((k-1)*groupSize+1:(k)*groupSize,:);            Vy=Ytrain((k-1)*groupSize+1:(k)*groupSize,:);            Sx=[Xtrain(1:(k-1)*groupSize,:);Xtrain((k)*groupSize+1:numberOfRows,:)];            Sy=[Ytrain(1:(k-1)*groupSize,:);Ytrain((k)*groupSize+1:numberOfRows,:)];                        a = softsvmrbf(lambdas(l),sigmas(s),length(Sx),d,Sx,Sy);                          kMatrix =@(x) exp(-vecnorm((Sx - x)').^2./(2*sigmas(s)));            h=@(alpha) @(x) sign(kMatrix(x)*alpha);            totalError = totalError + errorRate(h,a,Vx,Vy);        end        softsvmrbfResult(l,s) = totalError/K;     endendsoftsvmResult = zeros(length(lambdas),1);for l=1:length(lambdas)        numberOfRows = length(Xtrain(:,1));        numberOfCols = length(Xtrain(1,:));        groupSize = numberOfRows/K;        totalError=0;        for k=1:K            Vx=Xtrain((k-1)*groupSize+1:(k)*groupSize,:);            Vy=Ytrain((k-1)*groupSize+1:(k)*groupSize,:);            Sx=[Xtrain(1:(k-1)*groupSize,:);Xtrain((k)*groupSize+1:numberOfRows,:)];            Sy=[Ytrain(1:(k-1)*groupSize,:);Ytrain((k)*groupSize+1:numberOfRows,:)];                        w = softsvm(lambdas(l),length(Sx),d,Sx,Sy);                      h = @(w) @(x) sign(dot(w,x)) ;                totalError = totalError + errorRate(h,w,Vx,Vy);        end        softsvmResult(l) = totalError/K; end