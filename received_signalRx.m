

channel_env=1;
freq=2;
dist=50;
Ts=10^(-6);
mimo_size=3;
%%%%RECEIVED_SIGNAL
x=sqrt(1/2)*([1-1j,1+1j,-1-1j, -1+1j]);
BW=1;
N0=10^(-174/10)*10^(-3)*BW;
% h_short_loop=[];
received_signal_loop=[];
for k=1:100
 [Hfree,Hfree_mag_db]=free_loss(channel_env,freq,dist);
[h_short]=tdla(Ts);
% h_short_loop=[h_short_loop h_short];
h=Hfree.*(h_short);
constellation_pt_selection=x(randi(4));
transmit_power_dbm=23;
transmit_power_watt=10^(transmit_power_dbm/10)*(10^-3);
transmit_signal=constellation_pt_selection*sqrt(transmit_power_watt);
%transmit_signal_after_channel=transmit_signal*direct_path_gain;
transmit_signal_after_channel=transmit_signal*h;
additive_noise=sqrt(N0/2)*(randn(1,1)+1j*randn(1,1));
received_signal=transmit_signal_after_channel+additive_noise;
%%%estimated_signal=received_signal/direct_path_gain
received_signal_loop=[received_signal_loop received_signal];

end
