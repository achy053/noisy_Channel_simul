
%%%%PATH_LOSS
%%Channel_Env=1; %%%LOS Umi-SC
%%%Channel_Env=2;   %%%NLOS uMI-sc
freq=6;
channel_env=1;

if channel_env==1
alpha_1 = 2;
beta_1  = 31.4; %%db
gamma_1 = 2.1 ;  
sigma_1 = 2.9;    %% db
dist_range=5:10:121;
end

if channel_env==2
alpha_1 = 3.5;
beta_1  = 24.4; %%db
gamma_1 = 1.9 ;  
sigma_1 = 8;    %% db
dist_range=19:10:272;
end


path_loss=[];
for num_iter=1:1000
path_loss =[path_loss; (10*alpha_1.*log10(dist_range))+beta_1+(10*gamma_1*log10(freq))+10^(sqrt(sigma_1)*randn(1,1))/(10)];
%%keyboard
end
%%keyboard
figure(2)
hold all
plot(dist_range,-mean(path_loss),'b')
% plot(dist_range,(path_loss(1,:)),'r')
% plot(dist_range,(path_loss(2,:)),'k')

title('Path Loss (dB)');
xlabel(' Distance (meter)');
ylabel(' Path Loss (dB)');
grid on



% rand_gaussian= 10^(sqrt(sigma_1)*randn(1,1))/(10);
% mean(rand_gaussian)
% var(rand_gaussian)
% 
% hist(rand_gaussian)


%%%%CHANNEL_DETERMINATION
%%Channel_Env=1; %%%LOS Umi-SC
clear all

channel_env=1;
freq=2;
dist=50;
H_loop=[];
for k=1:3

 [Hfree,Hfree_mag_db]=free_loss(channel_env,freq,dist)
 keyboard

H_lf=10^(sqrt(sigma_1)*randn(1,1))/(10);

H_sf=(randn(1)+ 1j*randn(1))/sqrt(2);

H=Hfree.*(H_lf*H_sf);
H_loop=[H_loop ;H];

end
plot(abs(mean(H_loop)))

X=randn(5,1);

% Y=H*X;
x=randn(1000,1);
% hist(x)
hist(exp(abs(x)))




%%%%RECEIVED_SIGNAL
x=sqrt(1/2)*([1-1j,1+1j,-1-1j, -1+1j]);
BW=1;
N0=10^(-174/10)*10^(-3)*BW;
received_signal_loop=[];
for k=1:10
%  direct_path_loss_db=-(10*alpha1*log10(d)+beta1+10*gamma1*log10(f));
% direct_path_loss_linear=10^(direct_path_loss_db/10);
% direct_path_gain=sqrt(direct_path_loss_linear);
Hfree_mag_db=-(10*alpha_1.*log10(dist_range)+beta_1+(10*gamma_1*log10(freq)));
Hfree=sqrt(10.^(Hfree_mag_db/10));

H_lf=10^(sqrt(sigma_1)*randn(1,1))/(10);

H_sf=(randn(1)+ 1j*randn(1))/sqrt(2);

H=Hfree.*(H_lf*H_sf);

constellation_pt_selection=x(randi(4));
transmit_power_dbm=23;
transmit_power_watt=10^(transmit_power_dbm/10)*(10^-3);
transmit_signal=constellation_pt_selection*sqrt(transmit_power_watt);
%transmit_signal_after_channel=transmit_signal*direct_path_gain;
transmit_signal_after_channel=transmit_signal*H;
additive_noise=sqrt(N0/2)*(randn(1,1)+1j*randn(1,1));
received_signal=transmit_signal_after_channel+additive_noise;
%%%estimated_signal=received_signal/direct_path_gain
received_signal_loop=[received_signal_loop received_signal];

keyboard
end
