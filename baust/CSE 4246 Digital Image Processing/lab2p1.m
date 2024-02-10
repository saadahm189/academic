clear; clc;
a = input('Rows');
b = input('Coloumns');
for i=1:a
    for j=1:b
       p(i,j)=input('Elements');
    end
end
p=reshape(p,a,b);
verticalP = p(end : -1: 1, :); 
disp(verticalP)
horizontalP = p( : , end: -1 : 1); 
disp(horizontalP)