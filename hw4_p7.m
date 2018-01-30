img=[21 21 21 95 169 243 243 243;21 21 21 95 169 243 243 243;21 21 21 95 169 243 243 243;21 21 21 95 169 243 243 243];
img_entropy = entropy(img);

s=[1:4];
img=img(1,:);
p=[3/8 1/8 1/8 3/8];
img_entropy = entropy(p)

[dict,avglen] = huffmandict(s,p);