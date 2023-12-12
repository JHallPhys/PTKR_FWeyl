clear all
close all
%==========================================================================
%   Initialisation  
%==========================================================================
set_efn='G'; % % Thou shalt not change
set_stability='+'; % Thou shalt not change
K_class =10; % Classical Kicking
gamma = complex(0,0.001); % PT-strength 
Nmin=200;
dN=100;
Nmax=600;
N_i=Nmin:dN:Nmax;
NLen=length(N_i);
%==========================================================================
%  Fractal Weyl
%==========================================================================
for itt=1:NLen
    tic
    N_1=N_i(itt)
    N = 2*N_1+1; % Hilbert space dimension
    T=2*pi/N; % Effective hbar
    kick = K_class/T; % Quantum Kicking
    hbar=1/(2*pi*N);
    % Schur Parameters
    eps=exp(imag(gamma)*T);% Tolerance parameter for stability classification
    tic
    U=zeros(N,N); % Initialise Flouqet matrix
    [U,time1]=UMatrix(U,N,N_1,K_class,T,gamma); % Construct Flouqet matrix
    [psi,En] = schur(U); % psi are the Schur eigenfns and En matrix of eigs
    [psiS,Es]=REig(En,psi,N,set_efn) ;   % Reorder efn/values
    Es=diag(Es); 
    [psi_2,n_efn]=Psi_lifetime(psiS,Es,eps,set_stability);
    pint(itt)=n_efn;
    toc
end
%==========================================================================
% save the data  
%==========================================================================

FWData=[transpose(2*N_i+1),transpose(pint)]; % store the data
% Savce the data
str_ext='.mat'; % File extension
fname1=get_fname_ptkr(Nmin,dN,Nmax,K_class,str_ext);
parent_d = cd;   
cd '/Users/joe/Desktop/PTFW/PTKR_FWeyl/FWdata'; % Where save data
save(fname1,'FWData');
cd(parent_d)


