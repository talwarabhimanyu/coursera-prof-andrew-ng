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
% Size: 25x401
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));


% Size: 10x26
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
X = [ones(m,1) X];  %Dim: 5000 x 401
a_1 = X;
z_2 = X*Theta1';  %Dim: 5000 x 25
a_2 = [ones(m,1) sigmoid(z_2)];  %Dim: 5000 x 26
z_3 = a_2*Theta2';  %Dim: 5000 x 10
a_3 = sigmoid(z_3); %Dim: 5000 x 10 

for iter = 1:m
  for k = 1:num_labels
    if (y(iter,1) == k)
      J = J -log(a_3(iter,k));
    else
      J = J - log(1-a_3(iter,k));
    endif
  endfor
endfor

J = J/m;
% Add regularization cost
reg_theta1 = Theta1(:,2:size(Theta1,2)).^2;
reg_theta2 = Theta2(:,2:size(Theta2,2)).^2;

reg_cost = (lambda/(2*m))*(sum(reg_theta1(:))+ sum(reg_theta2(:)));

J = J + reg_cost;

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

del_3 = a_3 - y_bin;  %Dim: 5000 x 10
del_2 = ((del_3)*(Theta2)).*a_2.*(1-a_2); %Dim: {(5000 x 10)*(10 x 26)}.*(5000 x 26)

big_del_2 = (a_2')*del_3; %Dim: 26 x 10
big_del_1 = (a_1')*del_2(:,2:end); %Dim: 401*25

Theta2_grad = (big_del_2').*(1/m);
Theta1_grad = (big_del_1').*(1/m);

% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

temp_Theta1_grade = Theta1_grad + Theta1.*(lambda/m);
Theta1_grad = [Theta1_grad(:,1) temp_Theta1_grade(:,2:end)];

temp_Theta2_grade = Theta2_grad + Theta2.*(lambda/m);
Theta2_grad = [Theta2_grad(:,1) temp_Theta2_grade(:,2:end)];















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
