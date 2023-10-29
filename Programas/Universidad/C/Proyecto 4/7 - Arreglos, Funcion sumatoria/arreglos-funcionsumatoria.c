/*

(Arreglos, Función sumatoria).
Hacer un programa en un archivo con nombre sumatoria.c

Que contenga la función
int sumatoria(int tam, int a[])

Que recibe un tamaño máximo de arreglo y un arreglo como argumento, y devuelve la suma
de sus elementos (del arreglo).

En la función main pedir los datos del arreglo al usuario
asumiendo un tamaño constante previamente establecido (en tiempo de compilacilación).

*/

#include <stdio.h>
#include <assert.h>

int sumatoria(int tam, int a[])
{
    int suma = 0;
    for (int i = 0; i < tam; i++)
    {
        suma += a[i];
    }
    return suma;
}

void pedir_arreglo(int tam, int a[])
{
    assert(tam > 0);
    printf("Ingrese los valores del arreglo:\n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d] = ", i);
        scanf("%d", &a[i]);
    }
}

int main()
{
    int tam;
    printf("Coloque el tamaño máximo del arreglo: ");
    scanf("%d", &tam);
    int a[tam];            // Declaramos la existencia del entero de tamaño tam
    pedir_arreglo(tam, a); // Reutilizamos la función anterior para solicitar los valores del arreglo
    int resultado = sumatoria(tam, a);
    printf("La suma de los elementos del arreglo es: %d\n", resultado);
    return 0; // Salir con éxito
}