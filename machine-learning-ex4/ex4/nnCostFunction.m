function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
X = [ones(m, 1) X]; % Add a column of ones to x
%disp("size of X")
%disp(size(X))
%disp("size of theta1")
%disp(size(Theta1))
z2 = X*Theta1';
a2 = sigmoid(z2);
a2 = [ones(m, 1) a2];
%disp("size of a2")
%disp(size(a2))
z3 = a2*Theta2';
a3 = sigmoid(z3);
%disp("size of a3")
%disp(size(a3))
%disp("size of Y")
%disp(size(y))
%disp(a3(1,:))
%disp(y(1))
%disp("size of num_labels")
%disp(num_labels)
I = eye(num_labels);
y_hot = I(y,:);
%disp("size of Y hot")
%disp(size(y_hot))

cost = -y_hot.*log(a3) - ((1 - y_hot).*log(1 - a3));
%disp("size of cost")
%disp(size(cost))
J = sum(cost, 2); % add all errors along the rows means add all columns
J = (1/m) * sum(J);
%disp("size of Theta1")
%disp(size(Theta1(:,2:end)))
%disp("size of Theta2")
%disp(size(Theta2(:,2:end)))
%disp("size of sum")
%disp(size(sum(Theta1(:,2:end).*Theta1(:,2:end) ,2)));
reg = sum(sum(Theta1(:,2:end).^2 ,2)) + sum(sum(Theta2(:,2:end).^2 ,2));
reg = (lambda/(2*m))*reg;
%disp("reg value")
%disp(reg);          
J = J + reg;

dz3 = a3 -  y_hot;
%disp("size of dz3")
%disp(size(dz3))
%disp("size of a2")
%disp(size(a2))
dw2 = dz3' * a2;
disp("size of dw2")
disp(size(dw2))
disp("size of dz3")
disp(size(dz3))
disp("size of theta2")
disp(size(Theta2))
da2 = a2 .* (1 - a2);
disp("size of da2")
disp(size(da2))
dz2 = dz3 * Theta2;
dz2 = dz2(:,2:end) .* da2(:,2:end) ;
disp("size of dz2")
disp(size(dz2))
dw1 = dz2' * X;
disp("size of dw1")
disp(size(dw1))
Theta1_grad = (dw1 / m) + (lambda/m)*[zeros(hidden_layer_size , 1) Theta1(:,2:end)];
Theta2_grad = (dw2 / m) + (lambda/m)*[zeros(num_labels , 1) Theta2(:,2:end)];

grad = [Theta1_grad(:) ; Theta2_grad(:)];
















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
