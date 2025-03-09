clear all
clc

% PV array
Imp = 7.61;
Vmp = 26.3;
Pmaxm  = 200.143; 
Isc = 8.21;
Voc = 32.9;
Kv = -0.1230;
Ki = 0.0032;
Nscell = 54;
a = 1.3;
Rp = 425.405;
Rs = 0.221;
Nser = 45;
Npar = 690;
Tn=273.15+25;
Vocn=32.9;
Vmpn=26.3;

% VSC
Scn = 5*10^6;
Ucn = 690;
Vdcn = 1200;
Lc = 30.31*10^-6;
Rc = 0.95*10^-3;
Cdc = 278*10^-3;

% AC grid
Vg = 690;
fg = 50; 

% Control design 
Va=sqrt(2)*(Vg/sqrt(3));
Vpeak = Vg*sqrt(2);
tau_IAC = 1e-3;
tau_p = 10e-3;
e = 0.7;
%Current loop control
Kp_cc=Lc/tau_IAC;
Ki_cc=Rc/tau_IAC;
w=2*pi*50;
%PLL control 
Kp_pll=(2*w*e)/Va;
tau_pll=4*e^2/(Kp_pll*Va);
Ki_pll=Kp_pll/tau_pll;
% Reactive power loop 
ki_pq = 3/2*Va;
kpp = tau_IAC/(ki_pq*tau_p);
kip = 1/(ki_pq*tau_p);
% DC voltage loop
w1=2*pi*50;
e1 = 0.7;
Kpv = 2*e1*w1*Cdc;
Kiv = w1^2*Cdc;
kvmpp=Vmpn/Vocn;
%% Data
%General coeficients
q=1.60217646e-19;
k=1.3806503e-23;


%Datasheet information of PV panels at nominal conditions (25ºC,1000 W/m2 and A1.5)
Tn=273.15+25;


Impn=7.61;
Vmpn=26.3;
Pmaxen=200.143;
Iscn=8.21;
Vocn=32.9;
KV=-0.1230;
KI=0.0032;
Ns=54; %Cell connected in series

Vtn=Ns*k*Tn/q;

%Constants decided experimentally or iterations
a=1.3;              %Between 1 and 1.5. Adjusted to fit the experimental results
Rp=415.405;         %Obtained by iterations
Rs=0.221;           %Obtained by iterations

%Datasheet information of inverter
Vdcmax=1500;
Idcmax=5700;
Vdcmpptmin=978;
Vdcmpptmaxup25=1350;
Vdcmpptmax35=1250;
Vdcmpptmax50=1100;
Un=690;
mi=1;

%Number of PV panels
Nser=45;
Npar=690;

%% Operation conditions
T=273.15+25;
Gn=1000;

G=800;
Voc=Vocn+KV*(T-Tn);
Vt=Ns*k*T/q;
V = Nser*Voc*Vmpn/Vocn;

I0=(Iscn+KI*(T-Tn))/(exp((Vocn+KV*(T-Tn))/(a*Vt))-1);  %Estimation considering KI and KV (more convenient)
% Ipvn=Iscn;                                              %Approximation if Rs and Rp unknown
Ipvn=Iscn*(Rp+Rs)/Rp; 
Ipv=(Ipvn+KI*(T-Tn))*G/Gn;
%Approximation if Rs and Rp known


% %% Running the different models with different I
% 
%  ii=0;
% for Irr=G*[0.9,1,1.25]  % Droop characteristic curve (MW/(rad/s)
%     ii=ii+1;                     % Iteration number
%      G=Irr;
%      % Simulating the model
%      out=sim('assignment_new_mppt')
%      % Ploting figures
%      f_1 = figure(1); set(f_1, 'Position', [50 500 500 250]);
%      title('MPPT Power with varying irradiance')
%      hold all
%      plot(out.time,out.p,'LineWidth',1.5);
%      xlabel('Time [s]','Interpreter','latex','FontSize',12);
%      ylabel('Power (w)','Interpreter','latex','FontSize',12);
%      txt{ii}=['Irr=' num2str(Irr)]
%      l1=legend(txt)
%      set(l1,'Interpreter','latex','FontSize',12,'Location','NorthEast');
% 
% %Plot with V variables
%      f_2 = figure(2); set(f_2, 'Position', [50 500 500 250]);
%      title('MPPT voltage with varying irradiance')
%      hold all
%      plot(out.time,out.Vdc,'LineWidth',1.5);
%      xlabel('Time [s]','Interpreter','latex','FontSize',12);
%      ylabel('Voltage (v)','Interpreter','latex','FontSize',12);
%      txt{ii}=['Irr=' num2str(Irr)]
%      l1=legend(txt)
%      set(l1,'Interpreter','latex','FontSize',12,'Location','NorthEast');
% 
%  %Plot with I variables
%      f_3 = figure(3); set(f_3, 'Position', [50 500 500 250]);
%      title('MPPT current with varying irradiance')
%      hold all
%      plot(out.time,out.Idc,'LineWidth',1.5);
%      xlabel('Time [s]','Interpreter','latex','FontSize',12);
%      ylabel('Current (A)','Interpreter','latex','FontSize',12);
%      txt{ii}=['Irr=' num2str(Irr)]
%      l1=legend(txt)
%      set(l1,'Interpreter','latex','FontSize',12,'Location','NorthEast');
% 
%       %Plot with IV variables
%      f_4 = figure(4); set(f_4, 'Position', [50 500 500 250]);
%      title('MPPT current with varying irradiance')
%      hold all
%      plot(out.Idc,out.Vdc,'LineWidth',1.5);
%      xlabel('Current (A)','Interpreter','latex','FontSize',12);
%      ylabel('Voltage (v)','Interpreter','latex','FontSize',12);
%      txt{ii}=['Irr=' num2str(Irr)]
%      l1=legend(txt)
%      set(l1,'Interpreter','latex','FontSize',12,'Location','NorthEast');
% end