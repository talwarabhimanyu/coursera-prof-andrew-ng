function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

X_Pos = X(y(:,1) == 1,:);
X_Neg = X(y(:,1) == 0,:);

plot(X_Pos(:,1), X_Pos(:,2),'k+','LineWidth', 2, 'MarkerSize', 10);
hold on;
plot(X_Neg(:,1), X_Neg(:,2),'ko', 'MarkerFaceColor', 'y','MarkerSize', 10);




% =========================================================================



hold off;

end
