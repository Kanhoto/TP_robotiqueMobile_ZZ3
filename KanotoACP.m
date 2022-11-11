function[t1_o, t2_o] = KanotoACP(NoClassifiedPoints, ClassifiedPoints)
t1_o = [];
t2_o = [];

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
    tab_vecprop = [];
    tab_valprop = [];
    for i = 1:size_ClassifiedPoints(:,3)
        xi = mean(ClassifiedPoints(:,:,i),2);
        x = NoClassifiedPoints(:,j);
        C_i = cov(transpose(ClassifiedPoints(:,:,i)));
        dist = transpose(x - xi) * inv(C_i) * (x - xi);
        tab_dist = [tab_dist, dist];
        [vecprop, valprop] = eig(C_i);
        tab_vecprop = cat(3,tab_vecprop, vecprop);
        tab_valprop = cat(3,tab_valprop, valprop);
    end
    [val, indice] = min(tab_dist);
    t1_o = [t1_o, tab_vecprop(:,:,indice)];
    t2_o = [t2_o, tab_valprop(:,:,indice)];
end