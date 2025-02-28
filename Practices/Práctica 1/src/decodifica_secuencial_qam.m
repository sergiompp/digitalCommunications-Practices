function [bits_dec]=decodifica_secuencial_qam(simbolos_qam,M);
%-------------------------------------------------------------------------
% Funcion que realiza la conversion de simbolos de una constelacion M-QAM a
% bits siguiendo una asignacion binaria secuencial
%
%  bits_dec=decodifica_secuencial_qam(simbolos_qam,M)
%
%    simbolos_qam : vector de simbolos M-QAM a decodificar (1 x Nsimbolos)
%               M : orden (numero de simbolos de la constelacion)
%
%        bits_dec : bits decodificados a partir de los simbolos (1 x Nbits)
%                   Nbits = Nsimbolos x m, siendo m=log2(M) el numero de
%                   bits por simbolo de la constelacion
%
%-------------------------------------------------------------------------
%
% Function that converts symbols from a M-QAM constellation to a binary
% sequence (bits) using a sequential encoding
%
%  bits_dec=decodifica_secuencial_qam(simbolos_qam,M)
%
%    simbolos_qam : vector with M-QAM symbols (1 x Nsimbolos)
%               M : order (numero elements of the alphabet) of the M-QAM
%
%        bits_dec : decoded bits obtained from M-QAM symbols (1 x Nbits)
%                   Nbits = Nsimbolos x m, with m=log2(M) being the number
%                   of bits per symbol in the constellation
%-------------------------------------------------------------------------
%
% LABORATORIO DE COMUNICACIONES DIGITALES   
%
%        Version: 1.0
%  Realizado por: Marcelino Lazaro
%                 Departamento de Teoria de la Se�al y Comunicaciones
%                 Universidad Carlos III de Madrid
%      Creacion : octubre 2011
% Actualizacion : octubre 2014
%
%

m = log2(M);
M2 = sqrt(M);
m2 = log2(M2);

simbolos_qam_I = real(simbolos_qam);
simbolos_qam_Q = imag(simbolos_qam);

bits_simbolo_dec_Ia = decodifica_secuencial_pam(simbolos_qam_I,M2);
bits_simbolo_dec_Qa = decodifica_secuencial_pam(simbolos_qam_Q,M2);

Nsimbolos = length(simbolos_qam);
bits_simbolo_dec = [reshape(bits_simbolo_dec_Ia,m2,Nsimbolos); reshape(bits_simbolo_dec_Qa,m2,Nsimbolos)];

bits_dec = transpose(bits_simbolo_dec(:));

