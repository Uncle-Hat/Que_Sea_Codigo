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

void intercambiar(int tam, int a[], int i, int j){
    
}

void pedir_arreglo(int tam, int a[])
{
    printf("Coloque el tamaño máximo del arreglo: \n");
    scanf("%d", &tam);
    printf("Ingrese los valores del arreglo:\n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d] = ", i);
        scanf("%d", &a[i]);
    }
    return tam,a;
}

int main()
{
    int tam,a,i,j;
    pedir_arreglo(tam,a);
    int a[tam];
    return 0;
}
