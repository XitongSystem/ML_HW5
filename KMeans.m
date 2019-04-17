function [center, label] = KMeans(data, K)   
    [n, p]=size(data);   
    feature_max=zeros(p);        
    feature_min=zeros(p);        
    center =zeros(K, p);      
    
    %% init
    for i=1:p
       feature_max(i)=max(data(:,i));    
       feature_min(i)=min(data(:,i));    
       for j=1:K
            center(j,i)=feature_max(i)+(feature_min(i)-feature_max(i))*rand(); 
       end      
    end
    
    iter = 0;
    while iter < 10000
        iter = iter + 1;
        last_center = center;    
        
        for i=1:K
            tmp{i}=[]; 
            for j=1:n
                tmp{i}=[tmp{i};data(j,:)-center(i,:)];
            end
        end
        
        %% get minimum distance
        distance=zeros(n,K);
        for i=1:n        
            c=[];
            for j=1:K
                c=[c sumsqr(tmp{j}(i,:))];
            end
            [~, index] = min(c);
            distance(i,index)=sumsqr(tmp{index}(i,:));           
        end
        
        %% update center
        for i=1:K           
           for j=1:p
                center(i,j)=sum(distance(:,i).*data(:,j))/sum(distance(:,i));
           end           
        end
        
        if sumsqr(last_center-center) < 1e-4
            break;
        end
    end
    
    %% get label
    label = [];
    for i=1:n
        tmp=[];
        for j=1:K
            tmp=[tmp sumsqr(data(i,:)-center(j,:))];
        end
        [~, index]=min(tmp);
        label = [label; index];
    end
    
end