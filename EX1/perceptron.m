function w = perceptron(m, d, Xtrain, Ytrain, maxupdates)
  w = zeros(1,d);
  attempts = 0;
  isValid = 0;
  while attempts< maxupdates & isValid != 1
    isValid = 1;  
    ++attempts;
    for i=1:m
       if(Ytrain(i) * dot(w,Xtrain(i,:)) <=0)    
          w+= Ytrain(i) * Xtrain(i,:);
          isValid = 0;
          break
        end
    end
  end
  endfunction