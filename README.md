Android Project en el cual se implementa:
  
  - Módulo de audio simple de un Envelope Generator, con boton para disparar la señal (Trigger) perteneciente al proyecto "Synth3F".
  
Se incluyen los archivos que se obtienen al convertir de FAUST a C++/Java. Estos archivos son:

C++:  
  - DspFaust.cpp
  - java_interface_wrap.cpp
  - DspFaust.h
  
Java:  
  - dsp_faust.java
  - DspFaust.java
  - dsp_faustJNI.java
  
Los mismos están en app/src/main/cpp y app/src/main/java/com respectivamente.

En el directorio app/src/main/java/com/example/root/envgen, se encuentra el archivo MainActivity.java. En el mismo se desarrolla un simple algoritmo para triggerear un VCO con parámetros predefinidos (frecuencia, amplitud).

De esta manera, es posible lograr una implementacion de los modulos de audio en lenguaje Faust y posteriormente convertirlos a C++/Java. Adicionalmente, es posible editar los archivos Java para trabajar directamente con ese lenguaje.

En el directorio Modulos se encuentran los archivos con extension .dsp pertenecientes al lenguaje de programacion Faust para el procesamiento del audio en dicho proyecto.
