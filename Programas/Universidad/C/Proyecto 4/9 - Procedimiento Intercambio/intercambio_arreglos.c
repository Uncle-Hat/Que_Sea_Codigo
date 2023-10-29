/*
(Procedimiento intercambio).
Hacer un programa en el archivo nuevo intercambio_arreglos.c

que contenga la siguiente función:

void intercambiar(int tam, int a[], int i, int j)

que recibe un tamaño máximo de arreglo, un arreglo y dos posiciones como argumento,
e intercambia los elementos del arreglo en dichas posiciones.

En la función main pedirle al usuario que ingrese los elementos del arreglo y las posiciones,
Chequear que las posiciones estén en el rango correcto y luego imprimir en pantalla el arreglo modificado.
*/

#include <stdio.h>
#include <assert.h>

void intercambiar(int tam, int a[], int i, int j)
{
    int aux;

    printf("¿Qué lugar te gustaría cambiar de valor?\n");
    scanf("%d", &i);
    printf("¿Por cuál?\n");
    scanf("%d", &j);

    // Fijarse si i y j son válidos
    if (i >= 0 && i < tam && j >= 0 && j < tam)
    {
        // Cambiar los elementos
        aux = a[i];
        a[i] = a[j];
        a[j] = aux;
        printf("Intercambio exitoso.\n");
    }
    else
    {
        printf("Índices inválidos.\n");
    }
}

int pedir_arreglo(int tam, int a[])
{

    printf("Ingrese los valores del arreglo:\n");
    for (int lambda = 0; lambda < tam; lambda++)
    {
        printf("a[%d] = ", lambda);
        scanf("%d", &a[lambda]);
    }
    return 0;
}

int main()
{
    int tam;
    printf("Coloque el tamaño máximo del arreglo: \n");
    scanf("%d", &tam);
    assert(tam > 0);
    int a[tam];
    pedir_arreglo(tam, a);
    int i, j;
    intercambiar(tam, a, i, j);

    printf("El arreglo después del intercambio:\n");
    for (int lambda = 0; lambda < tam; lambda++)
    {
        printf("a[%d] = %d\n", lambda, a[lambda]);
    }

    return 0;
}