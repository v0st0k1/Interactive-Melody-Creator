function val = DTWR(p,t,w)
    n=size(p,2)+1;
    m=size(t,2)+1;
    mat=zeros(n,m)+inf;
    mat(1,1)=0;
    
    w = max (w, abs(n-m));
    
    for i=2:n
        for j=(max(2,i-w)):(min(m,i+w))
            dist = d_euclid(p(:,i-1),t(:,j-1));
            mat(i,j) = dist + min(min(mat(i-1,j),mat(i,j-1)),mat(i-1,j-1));
        end
    end
    
    val=mat(n,m);
end