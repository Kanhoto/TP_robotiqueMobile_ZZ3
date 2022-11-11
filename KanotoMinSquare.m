function[A, B] = KanotoMinSquare(Table_i)
h_t = [];
size_Table_i = size(Table_i);

for i = 1:size_Table_i(:,2)
   h_t = [h_t, [Table_i(1,i); 1]]; 
end
y = transpose(Table_i(2,:));
h = transpose(h_t);

x = inv(h_t * h) * h_t * y;
A = x(1);
B = x(2);