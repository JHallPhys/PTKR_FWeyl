function fname=get_fname_ptkr(Nmin,dN,Nmax,K_class,gamma,set_stability,str_ext)

gamma=imag(gamma);
ds='_'; % seperator of strings
str_nmin='Nmin';
str_nmin_num=num2str(Nmin);
str_dn='dN';
str_dn_num=num2str(dN)
str_nmax='Nmax';
str_nmax_num=num2str(Nmax);
str_kick='K';
str_kick_num= strrep(num2str(K_class),'.','p');
str_gamma='g';
str_gamma_num= strrep(num2str(gamma),'.','p');

if ismember(set_stability,'0')
    str_set='stable';
end

if ismember(set_stability,'+')
    str_set='gain';
end

fname=strcat(str_nmin,str_nmin_num,ds,str_dn,str_dn_num,ds,str_nmax,str_nmax_num,ds,str_kick,str_kick_num,ds,str_gamma,str_gamma_num,ds,str_set); % The information about the N range
fname=strcat(fname,str_ext); % Add the extension

end
