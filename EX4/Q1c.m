load("mnist_all.mat");
all = [test0;test1;test2;test3;test4;test5;test6;test7;test8;test9];
gen=@(group,value) ones(length(group),1)*value;
labels = [gen(test0,0);gen(test1,1);gen(test2,2);gen(test3,3);gen(test4,4);gen(test5,5);gen(test6,6);gen(test7,7);gen(test8,8);gen(test9,9)];
rnd = randi([1 length(labels)],1000,1);
test=double(all(rnd,:));
labels = labels(rnd);

% clustersK=kmeans(test,10,100);
% resultsK = inf(10,3);
% for k=1:10
%      clusterLabels = labels(clustersK == k);
%      clusterSize = length(clusterLabels);
%      mostCommonLabel = mode(clusterLabels);
%      percentageWithLabel = sum(clusterLabels==mostCommonLabel)/clusterSize;
%      resultsK(k,1)=clusterSize;
%      resultsK(k,2) = mostCommonLabel;
%      resultsK(k,3) = percentageWithLabel;
% end

clustersS=singlelinkage(test,10);
resultsS = inf(10,3);
for k=1:10
     clusterLabels = labels(clustersS == k);
     clusterSize = length(clusterLabels);
     mostCommonLabel = mode(clusterLabels);
     percentageWithLabel = sum(clusterLabels==mostCommonLabel)/clusterSize;
     resultsS(k,1)=clusterSize;
     resultsS(k,2) = mostCommonLabel;
     resultsS(k,3) = percentageWithLabel;
end