function alpha = softsvmrbf(lambda, sigma, m, d, Xtrain, Ytrain)
    k = @(a,b) exp(-(norm(a-b)^2)/(2*sigma));
    G = zeros(m);
    for i=1:m
        for j=1:m
            G(i,j)=k(Xtrain(i,:),Xtrain(j,:));
        end
    end
	H=[G*2*lambda eye(m);zeros(m) zeros(m)];
    A=[G.*Ytrain eye(m);zeros(m) eye(m)];
    u=[zeros(1,m) ones(1,m)/m];
    v=[ones(m,1);zeros(m,1)];
    alpha = quadprog(H,u,-A,-v);
    alpha = alpha([1:m]);
end