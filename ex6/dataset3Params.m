function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.1;
C_arr = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
Sigma_arr = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
min_err = 100000;
%for i = 1:size(C_arr,2)
%  for j = 1:size(Sigma_arr,2)
%    mean_err = 0
%    model= svmTrain(X, y, C_arr(1,i), @(x1, x2) gaussianKernel(x1, x2, Sigma_arr(1,j)));
%    predictions = svmPredict(model,Xval);
%    mean_err = mean(double(predictions ~= yval));
%    if mean_err <= min_err
%      min_err = mean_err;
%      C = C_arr(i);
%      sigma = Sigma_arr(j);
%    endif
%  endfor
%endfor





% =========================================================================

end
