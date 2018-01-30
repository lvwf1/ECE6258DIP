theta1 = 0:2:256; %Projecting 1-bit Reconstruction
[R1,~] = radon(Z,theta1); 
num_angles_R1 = size(R1,2)
theta2 = 0:4:256; %Projecting 4-bit Reconstruction
[R2,~] = radon(Z,theta2);
num_angles_R2 = size(R2,2)
theta3 = 0:8:256;  %Projecting 8-bit Reconstruction
[R3,xp] = radon(Z,theta3); 
num_angles_R3 = size(R3,2)
output_size = max(size(Z));
 
dtheta1 = theta1(1);
I1 = iradon(R1,dtheta1,output_size);
dtheta2 = theta2(1);
I2 = iradon(R2,dtheta2,output_size);
dtheta1 = theta3(1);
I3 = iradon(R3,dtheta3,output_size);
 
figure, imshow(I1)
figure, imshow(I2)
figure, imshow(I3)