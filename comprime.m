function comprime(colores)
% *****************************************************************
% Jesus Hermoso de Mendoza Hernandez
% Desafio Tecnologico 2014 - E.T.S. Ingenieria de Telecomunicacion
% 
% Comprime la imagen. Se usa la funcion comprime_fila, para ir construyendo la imagen
% comprimida (que es un vector) y el indice
%
%******************************************************************
% USO: [fila,indice] = comprime_fila(x)
%*******************************************************************

RGB = imread('Imagendesafio.tif');                 %Leemos la imagen
[imagen,mapa] = rgb2ind(RGB,colores);              %La convertimos de RGB a modo indexado con 256 colores
clear RGB                                          %Borramos esta variable, ya que no la vamos a usar mas
                              
IMAGEN_COMP = uint8(zeros(0));                     %Creamos el vector que va a almacenar la imagen comprimida
INDICE = uint8(zeros(0));                          %Y el indice
  
for i = 1:3000 
    fila_actual = imagen(i,:);                                      %Extraemos la fila i de "imagen"
    [fila_comprimida, fila_indice] = comprime_fila(fila_actual);

    IMAGEN_COMP = cat(2, IMAGEN_COMP, fila_comprimida);             %Vamos adjuntamdo cada fila al "vector imagen"
    INDICE = cat(1,INDICE, fila_indice);                            %Y cada fila del indice
end

indice_comp = bwpack(INDICE);                                         

save('comprimida', 'IMAGEN_COMP','indice_comp',  'mapa')            %Guardamos en el archivo "comprimida.mat"
msgbox('La imagen se ha comprimido correctamente')