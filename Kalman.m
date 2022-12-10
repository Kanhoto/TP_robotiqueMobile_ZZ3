function[res]=Kalman(X0,CX0,Y1,CY1,Y2,CY2)

H = [1 0 0; 0 1 0; 0 0 1];

K1 = CX0*transpose(H)*inv(H*CX0*transpose(H)+ CY1);

CX1 = CX0 - K1*H*CX0;
CX1

X1 = X0 + K1*(Y1 - X0);
X1

K2 = CX1*transpose(H)*inv(H*CX1*transpose(H)+CY2);

CX2 = CX1 - K2*H*CX1;
CX2

X2 = X1 + K2*(Y2-X1);
X2

res = 0;

