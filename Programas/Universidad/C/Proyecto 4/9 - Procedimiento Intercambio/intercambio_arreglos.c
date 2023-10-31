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
    int var1,var2;
    var1 = a[i]; //Segmentation fault
    var2 = a[j];
    //Switch
    a[i] = var2;
    a[j] = var1;
}

void imprimir_arreglo(int tam, int a[]) {
    for (int i = 0; i < tam; i++) //Declaración de i = 0, empieza a sumar uno hasta que llega al tam
    {
        printf("%d", a[i]);
        printf("\n");
    }
}

int pedirvalor(int n, char namevar)
{
    printf("Coloque el valor de la variable %c\n",namevar);
    scanf("%d", &n);
    return n;
}


void pedir_arreglo(int tam, int a[])
{
    printf("Ingrese los valores del arreglo:\n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d] = ",i);
        scanf("%d", &a[i]);
    }
}

int main()
{
    int tam,i,j;
    int a[tam];
    printf("Coloque el tamaño máximo del arreglo: \n");
    scanf("%d", &tam);
    pedir_arreglo(tam,a);
    i = pedirvalor(i,'i');
    j = pedirvalor(j,'j');
    intercambiar(tam,a,i,j);
    imprimir_arreglo(tam,a);
    return 0;
}
