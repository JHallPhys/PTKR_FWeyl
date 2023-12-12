% Function to reorder the eigenvalues of the Schur decompisition
% This reordering defines the subspace spanned by the orthogonalised schur
% vectors.

function [Psi_out,E_out] = REig(E_in,Psi_in,N,efn_set)

lambda=ordeig(E_in); % get order of eigs

E=-1i*log(lambda); % Calculate quasienergies23dg


if isequal(efn_set,'G') % Gain states
    
    [Er,ind]=sort(imag(E),'descend'); 
    dummy(ind)=1:N;
    [Psi_out,E_out]=ordschur(Psi_in,E_in,dummy);
 
    
elseif isequal(efn_set,'S') % Stable states
    
    [Er,ind]=sort(abs(abs(diag(E_in))-1),'descend'); 
    dummy(ind)=1:N;
    [Psi_out,E_out]=ordschur(Psi_in,E_in,dummy);

        
elseif isequal(efn_set,'L') % Loss states1
    
    [Er,ind]=sort(imag(E)); 
    dummy(ind)=1:N;
    [Psi_out,E_out]=ordschur(Psi_in,E_in,dummy);
    
    
end