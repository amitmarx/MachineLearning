function w = perceptron(m, d, Xtrain, Ytrain, maxupdates)
  w = zeros(1,d)
  attempts = 0
  isValid = zeros(1,m)
  while attempts< maxupdates & sum(isValid) != m
    ++attempts
    for i=1:m
       if(Ytrain(i) * dot(w,Xtrain(i,:)) <=0)    
          w+= Ytrain(i)* Xtrain(i,:)
          isValid = zeros(1,m)
          break
        else
          isValid(i) =1
        end
    end
  end