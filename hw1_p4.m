b=10;
A=zeros(b,b);
for n=1:b
    for m=1:b
        if (m<=n)
            A(m,b+1-n)=1;
        end
    end
end
B=conv2(A,A);
A
B