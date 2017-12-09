function alpha = softsvmrbf(lambda, sigma, m, d, Xtrain, Ytrain)
	k = @(a,b) exp(-(norm(a-b)^2)/(2*sigma));
    G = zeros(m);
    for i=1:m,
        for j=1:m,
            G(i,j)=k(Xtrain(i,:),Xtrain(j,:));
        end
    end
	ell=size(Xtrain,1);
	H=zeros(ell+1,ell+1);
	H(1:ell,1:ell)=G.*lambda;
	f=zeros(1,ell+1);
	A=diag(Ytrain)*[G ones(ell,1)];
	c=ones(ell,1);
	z=quadprog(H,f,-A,-c);
	alpha =z(1:ell);
endfunction
