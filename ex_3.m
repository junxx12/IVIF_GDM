
clc
clear all
%---------------导入决策矩阵------%
AA=load('data_3.txt');   
A=ind_conversion_Group_3(AA);  %---------------将个体转化为群体------%
w=[0.243 0.113 0.283 0.043 0.029 0.288];%属性权重
wd=w_Attribute_3(AA);  %求解专家权重
% wd=[0.27, 0.16, 0.23, 0.16, 0.18];
%---------------计算加权决策矩阵------%
n=5;   %------方案的个数
k=5;   %------专家的个数
m=6;   %------属性指标的个数

for j=1:(n*k)
     for i=1:m
         BB(j,1+(i-1)*4)=1-(1-A(j,1+(i-1)*4))^w(i);
         BB(j,2+(i-1)*4)=1-(1-A(j,2+(i-1)*4))^w(i);
         BB(j,3+(i-1)*4)=(A(j,3+(i-1)*4))^w(i);
         BB(j,4+(i-1)*4)=(A(j,4+(i-1)*4))^w(i);
     end
end

for j=1:n
    for jj=1:k
         for i=1:m
             C(jj+k*(j-1),1+(i-1)*4)=1-(1-BB(jj+k*(j-1),1+(i-1)*4))^wd(jj);
             C(jj+k*(j-1),2+(i-1)*4)=1-(1-BB(jj+k*(j-1),2+(i-1)*4))^wd(jj);
             C(jj+k*(j-1),3+(i-1)*4)=(BB(jj+k*(j-1),3+(i-1)*4))^wd(jj);
             C(jj+k*(j-1),4+(i-1)*4)=(BB(jj+k*(j-1),4+(i-1)*4))^wd(jj);    
         end
    end
end

%---------------计算正理想解----------------%
for jj=1:k
        for ii=1:m
        Z(jj,1+4*(ii-1))=max(C([jj jj+k jj+k*2 jj+k*3],1+4*(ii-1)));
        Z(jj,2+4*(ii-1))=max(C([jj jj+k jj+k*2 jj+k*3],2+4*(ii-1)));
        Z(jj,3+4*(ii-1))=min(C([jj jj+k jj+k*2 jj+k*3],3+4*(ii-1)));
        Z(jj,4+4*(ii-1))=min(C([jj jj+k jj+k*2 jj+k*3],4+4*(ii-1)));
        
        F(jj,1+4*(ii-1))=min(C([jj jj+k jj+k*2 jj+k*3],1+4*(ii-1)));
        F(jj,2+4*(ii-1))=min(C([jj jj+k jj+k*2 jj+k*3],2+4*(ii-1)));
        F(jj,3+4*(ii-1))=max(C([jj jj+k jj+k*2 jj+k*3],3+4*(ii-1)));
        F(jj,4+4*(ii-1))=max(C([jj jj+k jj+k*2 jj+k*3],4+4*(ii-1)));
        end
end

 for i=1:n
    CC=C(1+(i-1)*k:i*k,:);
    PUZ3(i)=our_pro_tr(Z,CC);
    PUF3(i)=our_pro_tr(F,CC);
    UC3(i)=R_coefficient(PUZ3(i),PUF3(i));
 
 end
   
%---------------计算遗憾矩阵和满意矩阵----------------%
 for jjj=1:n
     XX=C(1+(jjj-1)*k:jjj*k,:);
     RD(1+(jjj-1)*k:jjj*k,:)=Pro_distance(F,XX);  
     SD(1+(jjj-1)*k:jjj*k,:)=Pro_distance(Z,XX);  
 end
 %---------------计算最大和最小遗憾矩阵以及最大和最小满意矩阵----------------%
  for jj=1:k
        for ii=1:m
        ZR(jj,ii)=max(RD([jj jj+k jj+k*2 jj+k*3],ii));
        FR(jj,ii)=min(RD([jj jj+k jj+k*2 jj+k*3],ii));
        ZS(jj,ii)=max(SD([jj jj+k jj+k*2 jj+k*3],ii));
        FS(jj,ii)=min(SD([jj jj+k jj+k*2 jj+k*3],ii));
        end
  end
  
 for i=1:n
    BR=RD(1+(i-1)*k:i*k,:);
    BS=SD(1+(i-1)*k:i*k,:);
 
    

    PRZ3(i)=our_pro_tr(ZR,BR);
    PRF3(i)=our_pro_tr(FR,BR);
    RC3(i)=R_coefficient(PRF3(i),PRZ3(i));
 
    PSZ3(i)=our_pro_tr(ZS,BS);
    PSF3(i)=our_pro_tr(FS,BS);
    SC3(i)=R_coefficient(PSZ3(i),PSF3(i));
 end
Q=UC3+RC3+SC3;
our_m=[UC3;RC3;SC3;Q/3]


