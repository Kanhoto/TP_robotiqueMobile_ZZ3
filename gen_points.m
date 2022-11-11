%calcul de points pour le td de Robotique Mobile
clear all;
clf;
NbPoints=100;
tab1_pts= zeros(2,NbPoints);
tab2_pts= zeros(2,NbPoints);
tab3_pts= zeros(2,NbPoints);

for k=1:NbPoints
	valuex1=35+5*rand();
	valuey1=40+5*rand();
	valuex2=60+50*rand();
	valuey2=45+15*rand();
	valuex3=50+25*rand();
	valuey3=110+50*rand();
	tab1_pts(1,k)=valuex1;
	tab1_pts(2,k)=valuey1;
	tab2_pts(1,k)=valuex2;
	tab2_pts(2,k)=valuey2;
	tab3_pts(1,k)=valuex3;
	tab3_pts(2,k)=valuey3;
end

hold on;
figure(1);
plot(tab1_pts(1,:),tab1_pts(2,:),'.r');
plot(tab2_pts(1,:),tab2_pts(2,:),'.g');
plot(tab3_pts(1,:),tab3_pts(2,:),'.b');
plot(37,42,'*r');
plot(50,45,'*g');
plot(55,50,'*b');
plot(65,85,'*y')
axis([0,200,0,200]);

NoClassifiedPoints = [37 50 55 65; 42 45 50 85];
ClassifiedPoints(:,:,1) = tab1_pts;
ClassifiedPoints(:,:,2) = tab2_pts;
ClassifiedPoints(:,:,3) = tab3_pts;

% Mean approximate
%KanotoMeans(NoClassifiedPoints, ClassifiedPoints)

%K_means approximate
%KanotoKmeans(NoClassifiedPoints, ClassifiedPoints, 10)

%Mahalanobis approximate
%KanotoMahalanobis(NoClassifiedPoints, ClassifiedPoints)

%ACP
%[vecp, valp] = KanotoACP(NoClassifiedPoints, ClassifiedPoints)

%Hough's transform
figure(2);

Table1 = [11 25 55 68 105 145 190 220 238 251 275;
    239 150 209 80 181 161 141 173 121 58 109];

Table2 = [212 280 321 325 388 432 440 475 483;
    235 256 135 160 252 304 171 140 367];

[tab_theta_P, tab_visu, P, theta] = KanotoHough(Table1, 6);
plot(tab_theta_P(2,:), tab_theta_P(1,:), '.r');
plot(P,theta, '*b');

%min square
figure(3);

[A, B] = KanotoMinSquare(Table1);

plot(Table1(2,:), Table1(1,:), '.r');
X = [0; 240];
Y = [B; A*240+B];
line(X,Y);

%median square
figure(4);

[A, B] = KanotoMedianSquare(Table1);

plot(Table1(2,:), Table1(1,:), '.r');
X = [40; 240];
Y = [A*40 + B; A*240 + B];
line(X,Y);
