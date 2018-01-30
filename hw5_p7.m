i1=[3 2 3 4 3 3 2 2 4 3];
i2=[4 3 3 4 3 4 4 4 3 4];
i3=[2 3 3 3 2 3 2 3 2 2];
i4=[4 3 3 4 4 4 4 3 4 4];
ref=[5 4 4 4 5 4 4 4 4 5];

MOS1=mean(i1);
MOS2=mean(i2);
MOS3=mean(i3);
MOS4=mean(i4);

DMOS1=mean(abs(i1-ref));
DMOS2=mean(abs(i2-ref));
DMOS3=mean(abs(i3-ref));
DMOS4=mean(abs(i4-ref));