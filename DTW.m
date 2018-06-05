function val = DTW(p,t)
    n=size(p,2)+1;
    m=size(t,2)+1;
    mat=zeros(n,m);
    mat(2:end,1) = inf;
    mat(1,2:end) = inf;
    
    for i=2:n
        for j=2:m
            dist = d_euclid(p(:,i-1),t(:,j-1));
            mat(i,j) = dist + min(min(mat(i-1,j),mat(i,j-1)),mat(i-1,j-1));
        end
    end
    
    val=mat(n,m);
end