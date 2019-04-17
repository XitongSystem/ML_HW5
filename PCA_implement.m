function Y = PCA_implement(X, d)   
    covarianceMatrix = X'*X/(size(X,1)-1); 
    [E, D] = eig(covarianceMatrix); 
    [~,order] = sort(diag(-D));
    E = E(:,order);
    Y = X*E(:,1:d);
    Y = Y*E(:,1:d)';
end