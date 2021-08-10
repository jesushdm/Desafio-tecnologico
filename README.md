Fui ganador del concurso I Desafío Tecnológico, dónde el Departamento de Ingeniería de
Comunicaciones de mi Facultad (https://www.uma.es/etsi-de-telecomunicacion/) propuso el reto de comprimir una imagen de gran tamaño lo
máximo posible. 
El ratio de compresión logrado fue 10:1 (con la mínima calidad). 

Usé una mezcla de 2 conceptos :
* Se puede observar que la imagen original tiene regiones muy amplias con el mismo color o una tonalidad muy parecida.
Apliqué una **reducción de la paleta de colores**, la cual es configurable al ejecutar el script en MATLAB / Octave.
Están adjuntas las imágenes resultado con 8, 16, 32, 64, 128 y 256 colores.
* Realmente con el paso anterior no se ha comprimido nada aún, pero se ha homogeneizado muchas zonas de la imagen, por lo que apliqué Run Length Encoding (codificación por rachas) a los valores de los píxeles RGB. 
Por ej AAAAAAAAAA = 10A. Lo segundo se codifica con muchos menos bits.
