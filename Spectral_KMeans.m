function [center, label] = Spectral_KMeans(data, K)   
    
    %% Dimension Reduction
    matrix = data*data';
    [E, D] = eig(matrix); 

    % Sort the eigenvalues  and recompute matrices
    [~, order] = sort(diag(-D));
    E = E(:,order);
    
    d = min(size(data,2), K);
    [center, label] = KMeans(E(:,1:d), K);
end