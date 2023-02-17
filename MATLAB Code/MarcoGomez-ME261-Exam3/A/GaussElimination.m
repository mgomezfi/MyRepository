% Marco Gomez
% ME 261 Exam 3
%Problem 1 Function


function [x] = GaussElim(row,column,C)
disp(C)
for i = 1:row-1
    %disp(C)
    for j = i+1:row
        %disp(C)
        C(j,:) = C(j,:)-C(i,:)*C(j,i)/C(i,i);
        %disp(C)
    end
    disp(C)
end
for i = row:-1:1
    sm = 0;
    for j = row:-1:i+1
        sm = sm+C(i,j)*x(j);
    end
    x(i) = (C(i,row+1)-sm)/C(i,i);
end
end