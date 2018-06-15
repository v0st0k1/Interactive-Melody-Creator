# Creador de melodías interactivo
Desarrollado por:
- Aarón Arias Pérez [@aaronariasperez](https://github.com/aaronariasperez)
- Francisco Tomás Cruz Molina
- Carlos Guzmán Cabrera

**¿Qué es este proyecto?**

Este proyecto tiene como objetivo poder construir melodías simples. La idea
básica es que tenemos la imagen en tiempo real de nuestra webcam, y dicha
imagen se encuentra dividida en 4 celdas horizontales. Cada celda representa un
registro musical, siendo el de más abajo el registro 4 (aquí LA será 440Hz) y el
de más arriba el registro 7 (aquí LA será 3520Hz).

El eje X de la imagen nos indicará el orden en el que se deben reproducir las
notas (de izquierda a derecha). La posición de la nota que vamos a escribir la
determinaremos utilizando un elemento rojo como puede ser el capuchón rojo
de un bolígrafo, el cual tendremos que utilizar como puntero en la pantalla para
elegir una posición (la posición escogida coincidirá con la punta superior del
elemento, por lo que se recomienda utilizar este elemento en posición vertical).

Tras posicionar nuestro elemento tendremos que pulsar el botón CAPTURE! y
cuando el botón se ponga en verde, habrá que pronunciar uno de los números
de la tabla de codificación de la derecha, que nos indica para cada nota que
queramos poner, que número debemos de pronunciar. Tras esto, se pintará un
cuadradito negro que representará a la nota que acabamos de escribir, además
de escribirse el nombre de la nota en la esquina inferior derecha, lo cual nos
sirve para comprobar si se ha escrito la nota que queríamos.

Además, podemos eliminar las notas que hemos ido introduciendo, con el botón
ERASE LAST NOTE. Y también tenemos la opción de eliminar toda la melodía
pulsando el botón CLEAR ALL!.

La duración de las notas también se puede elegir entre: redonda (full note),
blanca (half note), negra (quarter note) o corchea (eighth note). Esta opción está 
disponible en el panel de botones situado a la derecha y deberá ser escogida antes 
de pulsar el botón CAPTURE!.

Finalmente, para reproducir la melodía existente, podemos pulsar el botón
PLAY! en cualquier momento. El tempo de la melodía será siempre ppm = 120.

**Futuras mejoras**
- Automatizar el cálculo del umbral para detectar el color rojo.
- Capturar la región de rojo mas grande que nos aparezca para evitar el ruido.
- Mejorar el sonido que se reproduce añadiéndole silencios.
- Añadir una interfaz para poder grabar los patrones de los números de forma mas 
cómoda y sencilla, ya que en la versión actual se deberá hacer uso del archivo 
'grabar_patrones.m' para hacer esto de forma manual.

Imagen de demostración.
<p align="center">
  <img width="680" height="480" src="/imagen_demo.png">
</p>
