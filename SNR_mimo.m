
freq=10;
channel_env=1;
dist=500;
[Hfree,Hfree_mag_db]=free_loss(channel_env,freq,dist)
n=6;
Tx_power=10^(23/10)*10^-3; 
Noise_power=10^(-174/10)*10^(-3);

H_chan=randn(n,n);
H_chan=Hfree*H_chan
H_chan_withouD=H_chan-diag(diag(H_chan))
snr_user=[];
sinr_user=[];
for k=1:n
    Rx_sig_power=abs(H_chan(k,k))^2*Tx_power;
    interf_power=sum(abs(H_chan(k,:)).^2)*Tx_power;
    snr_user=[snr_user Rx_sig_power/Noise_power];
    sinr_user=[sinr_user Rx_sig_power/(Noise_power+interf_power)];
       
end

figure(1)
plot(1:n,10*log10(snr_user))
hold on
plot(1:n,10*log10(sinr_user),'r')