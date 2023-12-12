clear all
close all

% Load the data

%
% file_name='Nmin_200_dN_200_Nmax_2000_K5'
file_name='Nmin_200_dN_200_Nmax_400_K0.5'
% file_name='Nmin_100_dN_1000_Nmax_1000_K5'
% file_name='Nmin_200_dN_200_Nmax_400_K5'
file_name=strcat(file_name,'.mat');
parent_d = cd;    
cd './FWData'
Quant_dat = matfile(file_name);
Data=Quant_dat.FWData;
cd(parent_d)

N=Data(:,1);
Pint=Data(:,2);


figure
plot(log10(N),log10(Pint.*(N)),'k.-','Markersize',10)
xlabel('N')
ylabel('pint(\mu)')


