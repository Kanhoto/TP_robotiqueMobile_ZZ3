function[t1_o] = KanotoKmeans(NoClassifiedPoints, ClassifiedPoints, k_i)
t1_o = [];

size_NoClassifiedPoints = size(NoClassifiedPoints);
size_ClassifiedPoints = size(ClassifiedPoints);

NewClassifiedPoints = [];
temp = [];
for j = 1:size_ClassifiedPoints(:,3)
    for k = 1:size_ClassifiedPoints(:,2)
        temp = [ClassifiedPoints(:,k,j); j];
        NewClassifiedPoints = [NewClassifiedPoints, temp];
    end 
end
size_NewClassifiedPoints = size(NewClassifiedPoints);

for i = 1:size_NoClassifiedPoints(:,2)
    dist = [];
    for j = 1:size_NewClassifiedPoints(:,2)
        dist = [dist, norm(NoClassifiedPoints(:,i) - NewClassifiedPoints(1:2,j))];
    end
    [M, I] = mink(dist, k_i);
    Real_I = fix(I / 100) + 1;
    t1_o = [t1_o, mode(Real_I)];
end