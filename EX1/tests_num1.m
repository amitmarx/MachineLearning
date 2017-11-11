	%test1
	m = 9;
    d = 3;
    Xtrain = [[-3, 5, -2]; [4, 1, -2]; [-3, 2, 0]; [-3, 4, 1]; [1, 7, 1]; [2, 4, 2]; [6, -2, 0]; [3, 2, -1]; [4, 3, -2]];
    Ytrain = [-1, -1,-1,-1, 1, 1, 1, 1, 1];
    maxupdates = 20;

    if perceptron(m, d, Xtrain, Ytrain, maxupdates) == [10; 1; 21],
        display("passed the first test");
    else
        display("*** failed the first test *** ");
    end;
	
	%test2
	maxupdates = 10;

    if perceptron(m, d, Xtrain, Ytrain, maxupdates) == [9; 1; 18],
        display("passed the second test");
    else
        display("*** failed the second test *** ");
    end;
	
	%test3
	m = 5;
    d = 3;
    Xtrain = [[-2, 4, -1]; [4, 1, -1]; [1, 6, -1]; [2, 4, -1]; [6, 2, -1]];
    Ytrain = [-1, -1, 1, 1, 1];
    maxupdates = 20;

    if perceptron(m, d, Xtrain, Ytrain, maxupdates) == [2; 3; 13],
        display("passed the 3rd test");
    else
        display("*** failed the 3rd test ***");
    end;
	
	%test4
	if (perceptron(m, d, Xtrain, Ytrain, maxupdates) == [2; 4; 13]),
        display("*** failed the 4th test ***");
    else
        display("passed the 4th test");
    end;
	
	%test5
	m = 9;
    d = 3;
    Xtrain = [[-3, 5, -2]; [4, 1, -2]; [-3, 2, 0]; [-3, 4, 1]; [1, 7, 1]; [2, 4, 2]; [6, -2, 0]; [-3, 2, -1]; [4, 1, -2]];
    Ytrain = [-1, -1,-1,-1, 1, 1, 1, 1, 1];
    maxupdates = 10**5;

    if perceptron(m, d, Xtrain, Ytrain, maxupdates) == [5; 4; 3],
        display("passed the 5th test");
    else
        display("*** failed the 5th test *** ");
        display(perceptron(m, d, Xtrain, Ytrain, maxupdates));
    end;