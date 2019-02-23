sprintf("Hello World!")
A = [1 2;3 4;5 6];
B = [1;1];
C = A*B
D = A - 1
F = A.*D
G = A.^2
H = 1 ./ A
I = exp(A)
J = log(A)
L = -A
K = abs(A)
N = A'
O = [1 15 2 0.5]
val = max(O)
[val, ind] = max(O)
P = O < 3
Q = magic(3)
[row, col] = find(Q >= 7)
R = sum(Q)
S = prod(Q)
M = [0.4 1.5 3.8 9.1]
T = floor(M)
T = ceil(M)
T = rand(3)
max(rand(3), rand(3))
max(Q,[], 1)
max(Q,[], 2)
T = max(max(A))
T = max(A(:))
T = magic(9)
T = sum(T, 1)
T = sum(T, 2)
T = magic(9)
I = eye(9)
M = T.*I
sum(sum(M))
Iflip = flipud(eye(9))
RES = T.*flipud(eye(9))
sum(RES)
sum(sum(RES))
pinv(Q) 
pinv(Q) * (Q)
