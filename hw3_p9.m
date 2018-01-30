%9(b)
H2=[1 1 1 1;1 1 -1 -1;sqrt(2) -sqrt(2) 0 0;0 0 sqrt(2) -sqrt(2)]
H2T=transpose(H2)
Xb=[8 8 8 8;8 16 8 8;8 8 8 8;8 8 8 16]
Yb=H2*Xb*H2T/16

%9(c)
Yb(4,4)=0;
Yc=H2T*Yb*H2

%9(d)
H2d=[1 1 1 1;1 -1 1 -1;1 1 -1 -1;1 -1 -1 1]
H2dT=transpose(H2d)
Yhad=H2d*Xb*H2dT/16
Yhad(4,4)=0
Xd=H2dT*Yhad*H2d

%9(e)
W2e=[1 1 1 1;1 1 -1 -1; 1 -1 -1 1;1 -1 1 -1]
W2eT=transpose(W2e)
Whad=W2e*Xb*W2eT/16
Whad(4,4)=0
Xe=W2eT*Whad*W2e

%9(f)
subplot(3,1,1)
plot(Yb);
subplot(3,1,2)
plot(Yhad);
subplot(3,1,3)
plot(Whad);