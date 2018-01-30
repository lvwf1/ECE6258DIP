h=[1,2,1;0,0,0;-1,-2,-1];
w=[1,2,1];
v=[1;0;-1];
conv2(v,w)

input=ones(7,7);
input(1:4,1:3)=zeros(4,3);
input(5:7,4:7)=zeros(3,4);

input

output1=conv2(h,input);

output1

output2=conv2(v,w,input);

output2