
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jesus Hermoso de Mendoza Hernandez
% Desafio Tecnologico 2014 - E.T.S. Ingenieria de Telecomunicacion
% 
% Comprime una sola fila de la imagen, devolviendo la fila comprimida, usando un esquema RLE
% y otra fila, que hace de indice, marcando donde empieza y termina cada racha
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% USO: [fila,indice] = comprime_fila(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [fila,indice] = comprime_fila(x)

indice = uint8(zeros(1,4000)); 
fila =x(1);    

%Para evitar problemas al intentar evaluar x(0) en línea 22
if  x(1) == x(2)          
    indice(1) = 1;
end

for i=2:3999
    
    if x(i) ~= x(i-1)                                    %Comprueba si 2 elementos consecutivos son diferentes
        fila = cat(2, fila, x(i));                       %Adjunta a la fila comprimida el elemento "x(i)"
        if x(i) == x(i+1)                                %Detecta el INICIO de una racha
            indice(i) = 1;
        end
    
    else                                                 %Si este else se ejecuta => estamos dentro o al final de una racha
        if x(i) ~=x(i+1)                                 %Detecta el FINAL de una racha
            indice(i) = 1;             
        end                                              %Notar que si x(i) == x(i+1)  => Estamos en el interior de una racha,
                                                         %por tanto no escribimos ni en "indice" ni en "fila"                                                           
    end
end

if x(3999) == x(4000)
    indice(4000) = 1;
else
    fila = cat(2, fila, x(4000));
    
end