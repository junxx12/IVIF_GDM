function I=ind_conversion_Group(X)
n=5;   %------方案的个数
k=5;   %------专家的个数
[nn m]=size(X);

for j=1:n
    for i=1:k
    I(i+k*(j-1),:)=X(j+n*(i-1),:);
    end
end
