%%Channel_Env=1; %%%LOS Umi-SC
clear all
sigma_1=2.9; %dB
alpha_1=1;
beta_1=1;
gamma_1=1;
freq=2;
H_loop=[];
for k=1:3
dist_range=5:10:20;
Hfree_mag_db=-(10*alpha_1.*log10(dist_range)+beta_1+(10*gamma_1*log10(freq)));
Hfree_mag_linear=sqrt(10.^(Hfree_mag_db/10));


H_lf=10^(sqrt(sigma_1)*randn(1,1))/(10);

H_sf=(randn(1)+ 1j*randn(1))/sqrt(2);

H=Hfree_mag_linear.*(H_lf*H_sf);
H_loop=[H_loop ;H];

end
plot(abs(mean(H_loop)))

X=randn(5,1);

% Y=H*X;



j