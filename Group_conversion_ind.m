function I=Group_conversion_ind(X)
n=4;   %------方案的个数
k=3;   %------专家的个数
[nn m]=size(X);
for i=1:k
    for j=1:n
    I(j+n*(i-1),:)=X(i+k*(j-1),:);
    end
end
