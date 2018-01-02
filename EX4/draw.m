function draw = draw(X,C)
groups = unique(C);
numberOfClusters = length(groups);
hold on
for i=1:numberOfClusters
   indexes = C==groups(i);
   cluster = X(indexes,:);
   color = rand(1,3);
   scatter(cluster(:,1),cluster(:,2),[],color,'filled');
end
hold off
end