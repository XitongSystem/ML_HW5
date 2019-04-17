load USPS.mat;

r = randi([1 3000],1,100);
%% Raw 
figure;
for i = 0:9
    for j = 1:10
        subplot(10,10,i*10+j);
        y = reshape(A(r(i*10+j),:), 16, 16);
        imshow(y');
    end
end

%% Reduce 
dimension = [10, 50, 100, 200];
for d = 1:4
    figure;
    Y = PCA_implement(A, dimension(d));
    error = sumsqr(Y-A)/(16*16);
    disp(error);
    for i = 0:9
        for j = 1:10
            subplot(10,10,i*10+j);
            y = reshape(Y(r(i*10+j),:), 16, 16);
            imshow(y');
        end
    end
end