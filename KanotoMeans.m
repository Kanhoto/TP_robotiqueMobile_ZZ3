function[t1_o] = KanotoMeans(NoClassifiedPoints, ClassifiedPoints)
t1_o = [];

Mean_1 = mean(ClassifiedPoints(:,:,1), 2);
Mean_2 = mean(ClassifiedPoints(:,:,2), 2);
Mean_3 = mean(ClassifiedPoints(:,:,3), 2);
Mean_tab = [Mean_1, Mean_2, Mean_3];
size_Ppoints = size(NoClassifiedPoints);
size_Mean_tab = size(Mean_tab);

for i = 1:size_Ppoints(:,2)
    dist = [];
    for j = 1:size_Mean_tab(:,2)
        dist = [dist, norm(NoClassifiedPoints(:,i) - Mean_tab(:,j))];  
    end
    [M, I] = min(dist);
    t1_o = [t1_o, I];
end