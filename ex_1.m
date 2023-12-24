
clc
clear all
%---------------������߾���------%
A=load('data_1.txt');
w=[0.3 0.3 0.4];%����Ȩ��
wd=w_Attribute_1(A);  %���ר��Ȩ��
%---------------�����Ȩ���߾���------%
n=4;   %------�����ĸ���
k=3;   %------ר�ҵĸ���
m=3;   %------����ָ��ĸ���

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

%---------------�����������----------------%
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

    PUZ1(i)=C_pro_tr(Z,CC);
    PUZ2(i)=WX_pro_tr(Z,CC) ;
    PUZ3(i)=our_pro_tr(Z,CC);
    
    PUF1(i)=C_pro_tr(F,CC);
    PUF2(i)=WX_pro_tr(F,CC) ;
    PUF3(i)=our_pro_tr(F,CC);
    
    UC1(i)=R_coefficient(PUZ1(i),PUF1(i));
    UC2(i)=R_coefficient(PUZ2(i),PUF2(i));
    UC3(i)=R_coefficient(PUZ3(i),PUF3(i));
 
 end
UC=[UC1;UC2;UC3];
   
%---------------�����ź�������������----------------%
 for jjj=1:n
     XX=C(1+(jjj-1)*k:jjj*k,:);
     RD(1+(jjj-1)*k:jjj*k,:)=Pro_distance(F,XX);  
     SD(1+(jjj-1)*k:jjj*k,:)=Pro_distance(Z,XX);  
 end
 %---------------����������С�ź������Լ�������С�������----------------%
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
 
    
    PRZ1(i)=C_pro_tr(ZR,BR);
    PRZ2(i)=WX_pro_tr(ZR,BR) ;
    PRZ3(i)=our_pro_tr(ZR,BR);
    
    PRF1(i)=C_pro_tr(FR,BR);
    PRF2(i)=WX_pro_tr(FR,BR) ;
    PRF3(i)=our_pro_tr(FR,BR);
    
    RC1(i)=R_coefficient(PRF1(i),PRZ1(i));
    RC2(i)=R_coefficient(PRF2(i),PRZ2(i));
    RC3(i)=R_coefficient(PRF3(i),PRZ3(i));
 
    PSZ1(i)=C_pro_tr(ZS,BS);
    PSZ2(i)=WX_pro_tr(ZS,BS) ;
    PSZ3(i)=our_pro_tr(ZS,BS);
    
    PSF1(i)=C_pro_tr(FS,BS);
    PSF2(i)=WX_pro_tr(FS,BS);
    PSF3(i)=our_pro_tr(FS,BS);
    
    SC1(i)=R_coefficient(PSZ1(i),PSF1(i));
    SC2(i)=R_coefficient(PSZ2(i),PSF2(i));
    SC3(i)=R_coefficient(PSZ3(i),PSF3(i));
 end
RC=[RC1;RC2;RC3];SC=[SC1;SC2;SC3];
Q=(UC+RC+SC)/3;

