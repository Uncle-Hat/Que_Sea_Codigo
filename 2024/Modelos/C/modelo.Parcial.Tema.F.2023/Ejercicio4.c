/* Ejercicio 4
Programar la siguiente función
struct rango_info verificar_rango(float x, struct rango r);
donde las estructuras struct rango y struct rango_info se definen de la
siguiente manera:
struct rango {
float cota_inf;
float cota_sup;
};
struct rango_info {
bool es_anterior;
bool es_posterior;
bool esta_dentro;
};
La función verificar_rango toma un valor decimal flotante x y una struct rango, y
devuelve una struct rango_info con tres booleanos que respectivamente indican:
● es_anterior es true si y sólo si x es menor que cota_inf. Caso contrario es
false.
● es_posterior es true si y sólo si x es mayor que cota_sup. Caso contrario
es false.
● esta_dentro es true si y sólo si x es mayor o igual que cota_inf y es menor
o igual que cota_sup. Caso contrario es false.
En la función main se debe solicitar al usuario ingresar los valores de la struct rango y
un valor flotante x y luego de llamar a la función verificar_rango mostrar el resultado
por pantalla (los tres booleanos de struct rango_info).
NOTA: Poner como comentario al menos un ejemplo de ejecución, con los parámetros de
entrada y la salida de tu programa (puedes hacer un copiar y pegar de la consola) */

#include <stdio.h>
#include <stdbool.h>

struct rango {
float cota_inf;
float cota_sup;
};

struct rango_info {
bool es_anterior;
bool es_posterior;
bool esta_dentro;
};

struct rango_info verificar_rango(float x, struct rango r){
    struct rango_info res = {false,false,false};
    if(x<r.cota_inf){
        res.es_anterior = true;
    }
    else if (x>r.cota_sup){
        res.es_posterior = true;
    }
    if ((x>=r.cota_inf)&&(x<=r.cota_sup)){
        res.esta_dentro = true;
    }
    else{
        res.esta_dentro = false;
    }
    return res;
};

float floatInput(char a){
    float x = 0; //Inicializador
    printf("Coloca valor a %c\n",a);
    scanf("%f",&x);
    return x;
}
int main(){
    float x;
    struct rango valores;
    printf("Siendo i la cota inferior y s la superior:\n");
    valores.cota_inf = floatInput('i');
    valores.cota_sup = floatInput('s');
    x = floatInput('x');
    struct rango_info resultados = verificar_rango(x,valores);
    printf("Es anterior? = %d\n",resultados.es_anterior);
    printf("Es posterior? = %d\n",resultados.es_posterior);
    printf("Está dentro? = %d\n",resultados.esta_dentro);
    return 0;
}

// Ejemplo
// Coloca valor a i
// 1
// Coloca valor a s
// 120
// Coloca valor a x
// 5
// Es anterior? = 0
// Es posterior? = 0
// Está dentro? = 1