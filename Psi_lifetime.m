% Function to calculate the stability sets of the eigenfunctions

function [Psi_out,n_out]=Psi_lifetime(Psi_in,E_in,eps,set_index)

n_efn=0;


%==========================================================================
% Gain States
%==========================================================================
if isequal(set_index,'+')
    eps=eps;
   
    for i = 1:length(Psi_in)

        if (abs(E_in(i)) > eps)
            n_efn = n_efn + 1;
            Psi_out(:,n_efn) = Psi_in(:,i); 
        end
        
    end
    n_out=n_efn;
    
%==========================================================================
% Stable States
%==========================================================================   
    
elseif isequal(set_index,'0')
    eps=log(eps);
    for i = 1:length(Psi_in)

        if (abs(abs(E_in(i))-1) < eps)
            n_efn = n_efn + 1;
            Psi_out(:,n_efn) = Psi_in(:,i); 
        end
        
    end
    
      
    n_out=n_efn;

    
    
%==========================================================================
% Loss States
%==========================================================================    
elseif isequal(set_index,'-')
    
    eps=eps^(-1);
    for i = 1:length(Psi_in)

        if (abs(E_in(i)) < eps)
            n_efn = n_efn + 1;
            Psi_out(:,n_efn) = Psi_in(:,i); 
        end
        
    end
    
    n_out=n_efn;
end


end