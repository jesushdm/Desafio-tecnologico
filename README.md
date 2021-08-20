Resulté ganador del concurso I Desafío Tecnológico, organizado por el Departamento de Ingeniería de
Comunicaciones de mi Facultad (https://www.uma.es/etsi-de-telecomunicacion/).

# El problema
El objetivo es comprimir lo máximo posible una imagen de gran tamaño (34,3 MB), con 2 requisitos:
1. No se pueden usar algoritmos de compresión ya existentes
2. Codificar en lenguaje MATLAB

![foto_original](https://user-images.githubusercontent.com/33213507/128817282-8fc0feea-3ccb-46c7-83cb-3e3e4fbf56ab.PNG)

# La solución

Usé una mezcla de 2 conceptos :
* Se puede observar que la imagen original tiene regiones muy amplias con el mismo color o una tonalidad muy parecida.
Apliqué una **reducción de la paleta de colores**, la cual es configurable al ejecutar el script en MATLAB / Octave.

* Realmente con el paso anterior no se ha comprimido nada aún, pero se ha homogeneizado muchas zonas de la imagen, por lo que apliqué Run Length Encoding (codificación por rachas) a los valores de los píxeles RGB. 
Por ej AAAAAAAAAA = 10A. Lo segundo se codifica con muchos menos bits.

Están adjuntas las imágenes resultado con 8, 16, 32, 64, 128 y 256 colores.
El ratio de compresión logrado fue 10:1 con la máxima pérdida de calidad posible (sin que se algo exagerado a la vista)


# Bibliografía consultada
Digital Image Processing (Rafael González, Richard Woods)
