function [Hfree,Hfree_mag_db]=free_loss(channel_env,freq,dist)

if channel_env==1
alpha_1 = 2;
beta_1  = 31.4; %%db
gamma_1 = 2.1 ;  
sigma_1 = 2.9;    %% db
%dist_range=5:10:121;
end

if channel_env==2
alpha_1 = 3.5;
beta_1  = 24.4; %%db
gamma_1 = 1.9 ;  
%sigma_1 = 8;    %% db
%%dist_range=19:10:272;
end


Hfree_mag_db=-(10*alpha_1.*log10(dist)+beta_1+(10*gamma_1*log10(freq)));
Hfree=sqrt(10.^(Hfree_mag_db/10));