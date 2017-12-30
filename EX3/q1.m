load('regdata.mat')
bestLambdaPerSize = Inf(1,90);
for size=10:100
    fprintf('%i\n',size);
    bestLambda = Inf;
    bestError = Inf;
    for lambda=0:30
        trainX = X(:,1:size);
        trainY = Y(1:size);
        w = ridgeQ1(lambda,trainX,trainY);
        results = Xtest'*(w);
        error=quaredLoss(results,Ytest);
        if(bestError>error)
            bestError = error;
            bestLambda =lambda;
        end
    end
    bestLambdaPerSize(size-9) = bestLambda;
end
hold on
plot([10:100],bestLambdaPerSize);
xlabel('Training Sample Size');
ylabel('Lambda');

function w = ridgeQ1(lambda,X,Y)
w = ((X*X'+lambda)^-1)*X*Y;
end

function error = quaredLoss(results,Y)
    error = sum((results - Y).^2)/length(Y);
end