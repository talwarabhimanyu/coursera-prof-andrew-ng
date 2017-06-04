function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
dist = 0;
dist2 = 0;
for iter1 = 1:size(idx,1)
  idx(iter1) = 1;
  dist = sum(((X(iter1,:) - centroids(1,:)).^2)(:));
  for iter2 = 2:size(centroids,1)
    dist2 = sum(((X(iter1,:) - centroids(iter2,:)).^2)(:));
    if dist2 < dist
      idx(iter1) = iter2;
      dist = dist2;
    endif
  endfor
endfor






% =============================================================

end

