v = zeros(10, 1)
for i=1:10,
  v(i) = 2^i;
endfor
v
indices = 1:10
for i = indices
  disp(i)
endfor

i = 1;
while i <= 5
  v(i) = 100;
  i = i + 1;
endwhile
v

j = 1;
while true
  v(j) = 300;
  if j == 6
    break;
  end
  j = j + 1;
endwhile
v

if v(1) == 1,
  disp("The value is one");
elseif v(1) == 2,
  disp("The value is two");
else
  disp("The value is not one or two");
endif

function y = squareNumber(x)
  y = x ^ 2;
endfunction

function [y1, y2] = squareAndCubeNumber(x)
  y1 = x ^ 2;
  y2 = x ^ 3;
endfunction

x = [1 1;1 2;1 3];
y = [1;2;3];
theta = [0;0]
function J = costFunctionJ(x, y, theta)
  m = size(x,1)
  prediction = x*theta;
  sqrError = (prediction - y).^2;
  J = (1/(2*m))*sum(sqrError);
endfunction

j = costFunctionJ(x, y, theta)

