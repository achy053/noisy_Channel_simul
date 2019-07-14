
Pt=1;
Gt=100;
Gr=10;
f=2*10^9;
lambda=(3*10^8)/(f);
ha_sf_lf=[];
ha_sf=[];
ha=[];
for d=10:2000
 Lsf=randn(1,1);
 normal_forlog=(sqrt(2.511)*randn(1,1)); %%%normal
 Llf=10^(normal_forlog/10); %%%% 10^(4/10)=2.511
ha=[ha (Pt*Gt*Gr*lambda^2)/(4*pi*d)^2];
ha_sf=[ha_sf (abs(Lsf)^2*Pt*Gt*Gr*lambda^2)/(4*pi*d)^2];
ha_sf_lf=[ha_sf_lf (abs(Llf)^2*abs(Lsf)^2*Pt*Gt*Gr*lambda^2)/(4*pi*d)^2];

end
d=10:2000;

hold all

plot(d, 10*log10(ha))
% plot(d, 10*log10(ha_sf))
 plot(d, 10*log10(ha_sf_lf))

