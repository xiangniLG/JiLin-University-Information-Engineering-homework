%%
%step1:initialize
clc; 
pr=[0.5 0.5];        %各字符出现的概率  
temp=[0.0 0.5 1.0];  
orignal=temp;  
%%
%step2:execute 'random_int_gen.slx'
n=length(random);  
%%
%step3:encode

for i=1:n  
    width=temp(3)-temp(1);  
    w=temp(1);  
    switch random(i)  
        case 0  
            m=1;  
        case 1  
            m=2;  
    end  
    temp(1)=w+orignal(m)*width;  
    temp(3)=w+orignal(m+1)*width;  
    left=temp(1);  
    right=temp(3);  
   % fprintf('left=%.6f',left);  
   % fprintf('    ');  
   % fprintf('right=%.6f\n',right);  
end  
encode=(temp(1)+temp(3))/2 ;
enco=dectobin(encode,60);
q=0:59;
q=q';
enco=enco';
%%
%step4:execute 'myCsystem.slx'
%%
% step5:decode
decode=de;  
decode=['0'];  

for i=1:n  
    %printf('tmp=%.6f\n',encode);  
    if(encode>=orignal(1)& encode<orignal(2))  
        decode(i)='0';  
        t=1;  
    elseif(encode>=orignal(2)& encode<orignal(3))  
        decode(i)='1';  
        t=2;  
    end  
    encode=(encode-orignal(t));  
    encode=encode/pr(t); 
    
end  
decode;