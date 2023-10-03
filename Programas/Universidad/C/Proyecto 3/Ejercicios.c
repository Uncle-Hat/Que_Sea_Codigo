// Ejercicios

#include <stdbool.h>
#include <stdio.h>


// 2. Debugging


/* Utiliza GDB o printf como ayuda y encontra valores para las variables que
forman el estado:*/


// 3. Asignaciones


/*Traducı al lenguaje C los programas 1.a, 1.b y 1.c del practico que se encuentra en este
enlace. Esos programas estan escritos en un pseudocodigo de la materia y la traduccion a C
no siempre es directa.
El estado σ0 debe solicitarse al usuario utilizando el comando scanf(). Luego, ejecute cada
programa 3 veces con diferentes valores de las variables solicitadas y escriba los valores del
estado final resultante en la siguiente tabla: */


// 4. Condicionales


/* a) Traducı al lenguaje C los programas 1.e y 1.f de este practico.
El estado σ0 debe solicitarse al usuario, agregando las instrucciones necesarias para que
el usuario pueda ingresar los valores de las variables de entrada. */


/* b) Traducı a lenguaje C los programas que siguen a continuacion, agregando las instrucciones necesarias para que el usuario pueda ingresar los valores de las variables de entrada.
Luego, completa los estados: */



// 5. Ciclos


/* a) Traducı al lenguaje C los programas 1.h y 1.i del practico. El estado σ0 debe solicitarse
al usuario, agregando las instrucciones necesarias para que el usuario pueda ingresar los
valores de las variables de entrada. */


/* b) Traducı a lenguaje C los programas que siguen a continuacion, agregando las instrucciones necesarias para que el usuario pueda ingresar los valores. Luego, completa los
estados, donde el estado a completar es el resultado de realizar 1, 2, 3 o 4 iteraciones
del ciclo. Una iteracion es la ejecucion completa del cuerpo del ciclo. */


// 6. (Funciones en C) Escribı los siguientes programas:
/* a) entradas.c que lee una variable de tipo int y la imprime por pantalla. En esta ocasion
el programa debe utilizar dos funciones a definir (ademas de la funcion main):
una funcion que le pide un entero al usuario y lo devuelve, con prototipo:
int pedir_entero(void)
Recordar avisarle al usuario mediante un mensaje que se espera que ingrese un
valor.
que toma un entero como parametro y lo imprime:
void imprimir_entero(int x)
Pensa como agregar un parametro mas llamado name de tipo char a las funciones
anteriores y usarlo en el mensaje que se muestra al usuario. Entonces por ejemplo
para la funcion pedir_entero si se ejecuta:
n = pedir_entero('n')
deberıa indicarse en el mensaje que se esta pidiendo un valor para almacenar en la
variable de nombre n. Notar que no hay forma de impedir que alguien use ”mal”la
funcion:
x = pedir_entero('n')
en ese caso el mensaje indicara que el valor se almacena en n aunque en realidad
se guarda en una variable llamada x.
Escribı de nuevo ambas funciones con este parametro extra (debe estar como
primer parametro de las funciones). */

/* b) entradas_bool.c que lee una variable de tipo bool y la imprime por pantalla. El
programa debe utilizar dos funciones a definir (ademas de la funcion main):
una funcion que le pide un booleano al usuario y lo devuelve, con prototipo:
bool pedir_booleano(void)
que toma un booleano como parametro e imprime un mensaje "verdadero" o
"falso" segun sea su valor de verdad:
void imprimir_booleano(bool x) */


/* Agregar a las funciones un parametro llamado name de tipo char con la misma
funcionalidad descripta en el tercer ıtem del apartado 6a */

/* c) Escribı el programa del ejercicio 4b, pero utilizando las funciones del ejercicio anterior.
¿Que ventajas encontras en esta nueva version?. ¿Podrıas escribir alguna otra funcion
en ese ejercicio, cual?. ¿En que otros ejercicios de ese Proyecto lo podrıas utilizar?.
Reescribı los programas donde puedas utilizarlas. */

/* d) En un archivo saludos.c implementar las siguientes funciones (ademas de la main):
una que imprime el string "hola", que no toma ni devuelve parametros, con
prototipo:
void imprimir_hola(void)
similar a la anterior con la el string "chau":
void imprimir_chau(void)
ese programa tiene que imprimir dos veces “hola” seguido de dos veces “chau”, llamando
a las dos ultimas funciones desde el main. */