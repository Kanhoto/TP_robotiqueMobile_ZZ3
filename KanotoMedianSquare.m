function[A, B] = KanotoMedianSquare(Table_i)
size_Table_i = size(Table_i);

% Step 1

i1 = fix(rand*size_Table_i(:,2));
i2 = fix(rand*size_Table_i(:,2));
while(i1 == i2)
    i1 = fix(rand*(size_Table_i(:,2)-1));
    i2 = fix(rand*(size_Table_i(:,2)-1));
end
p1 = Table_i(:,i1+1);
p2 = Table_i(:,i2+1);

% Step 2
x1 = p1(1);
x2 = p2(1);
y1 = p1(2);
y2 = p2(2);
A_temp = (y2 - y1) / (x2 - x1);
B_temp = y2 - A_temp*x2;

ri = [];
for i = 1:size_Table_i(:,2)
    ri = [ri, Table_i(2,i) - (A_temp*Table_i(1,i) + B_temp)]
end