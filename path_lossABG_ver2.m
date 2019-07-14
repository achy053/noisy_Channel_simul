

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
