function[t1_o] = KanotoMahalanobis(NoClassifiedPoints, ClassifiedPoints)
t1_o = [];

size_NoClassifiedPoints = size(NoClassifiedPoints);
size_ClassifiedPoints = size(ClassifiedPoints);

AllClassifiedPoints = [];
temp = [];
for j = 1:size_ClassifiedPoints(:,3)
    for k = 1:size_ClassifiedPoints(:,2)
        temp = [ClassifiedPoints(:,k,j); j];
        AllClassifiedPoints = [AllClassifiedPoints, temp];
    end 
end
size_AllClassifiedPoints = size(AllClassifiedPoints);

for j = 1:size_NoClassifiedPoints(:,2)
    tab_dist = [];
    for i = 1:size_ClassifiedPoints(:,3)
        xi = mean(ClassifiedPoints(:,:,i),2);
        x = NoClassifiedPoints(:,j);
        C_i = cov(transpose(ClassifiedPoints(:,:,i)));
        dist = transpose(x - xi) * inv(C_i) * (x - xi);
        tab_dist = [tab_dist, dist];
    end
    [val, indice] = min(tab_dist);
    t1_o = [t1_o, indice];
end