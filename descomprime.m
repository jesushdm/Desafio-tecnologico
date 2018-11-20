
function descomprime
% *****************************************************************
% Jesus Hermoso de Mendoza Hernandez
% Desafio Tecnologico 2014 - E.T.S. Ingenieria de Telecomunicacion
% 
% Descomprime la imagen a partir del fichero .mat
%Teniendo la matriz indice, que indica cuantas veces se va a escribir
% cada elemento del vector "IMAGEN_COMP", se va escribiendo cada fila
% de la imagen descomprimida
%
%******************************************************************
% USO: [fila,indice] = descomprime
%*****************************************************************

load ('comprimida')                                                 %Cargamos el archivo comprimido

indice = bwunpack(indice_comp, 3000);                     %Desempaquetamos el indice
IMAGEN_FINAL = uint8(zeros(3000,4000));                %Creamos una imagen vacia, que vamos rellenando
pos = 1;                                                                %Marca la posicion actual de la imagen comprimida (una sola fila)
racha = 0;                                                             %Indica si hay una racha activa (0 ó 1)

for i = 1:3000
    for j = 1:4000        
        if indice(i,j) == 0
            if racha == 0
                IMAGEN_FINAL (i,j) = IMAGEN_COMP (pos);
                pos = pos+1;
            else
                IMAGEN_FINAL (i,j) = IMAGEN_COMP (pos);
            end
                
        else
            if racha == 0                                                    %Detecta el inicio de una racha
                IMAGEN_FINAL (i,j) = IMAGEN_COMP (pos);
                racha = 1;
            else
                IMAGEN_FINAL (i,j) = IMAGEN_COMP (pos);      %Detecta el final de una racha
                racha = 0;
                pos = pos+1;
            end
        end
    end
end

imwrite(IMAGEN_FINAL, mapa, 'descomprimida.tif')           %Escribimos la imagen 
msgbox('La imagen se ha descomprimido correctamente')