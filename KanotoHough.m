function[t1_o, t2_o, P_opt, theta_opt] = KanotoHough(Table_i, n)
t1_o = [];
t2_o = zeros(n+1, n+1);
P_opt = 0;
theta_opt = 0;

size_Table_i = size(Table_i);

for i = 1:size_Table_i(:,2)
   for j = i+1:size_Table_i(:,2)
       x1 = Table_i(1,i);
       x2 = Table_i(1,j);
       y1 = Table_i(2,i);
       y2 = Table_i(2,j);
       theta1 = -atan((x2-x1) / (y2-y1));
       dist = sqrt((y2-y1)^2 + (x2-x1)^2);
       P1 = abs((x1*y2) - (x2*y1))/dist;
       t1_o = [t1_o, [theta1;P1]];
       
   end
end

Height = (max(t1_o(1,:)) - min(t1_o(1,:)))/n + 10^(-9);
Width= (max(t1_o(2,:)) - min(t1_o(2,:)))/n + 10^(-9);
size_t1_o = size(t1_o);

temp = [];
for i = 1:size_t1_o(:,2)
    N_theta1 = t1_o(1,i) - min(t1_o(1,:));
    N_P1 = t1_o(2,i) - min(t1_o(2,:));
    x = fix(N_P1 / Width)+1;
    y = fix(N_theta1 / Height)+1;
    temp = [temp, [x; y]];
    t2_o((n+1)-y,x) = t2_o((n+1)-y,x) + 1;
end

t1_o = [t1_o; temp];
[MaxOpt, ind] = max(t2_o, [], 'all', 'linear');
N_x = fix(ind/n) + 1;
N_y = rem(ind,n) + 1;

for i = 1:size_t1_o(:,2)
    if((t1_o(3,i) == N_x) && (t1_o(4,i) == N_y))
        theta_opt = theta_opt + t1_o(1,i);
        P_opt = P_opt + t1_o(2,i);
    end
end
theta_opt = theta_opt / MaxOpt;
P_opt = P_opt / MaxOpt;
