#include <stdio.h>
#include <assert.h>

#define N 5

int sumatoria(int tam, int a[]){
    int suma = 0;
    for (int i = 0; i < tam; i++)
    {
        suma = suma + a[i]; // Ej uso: 0 = 0 + a[0] = 0 + 1 = 1
    }
    return suma;
}

void pedir_arreglo(int n_max, int a[]){
    for (int i = 0; i < n_max; i++) 
    {
        printf("Coloca el elemento del arreglo a[%d] := ",i); 
        scanf("%d",&a[i]);
    }
}

void imprimir_arreglo(int n_max, int a[]){
    printf("Los elementos del arreglo son:\n");
    for (int i = 0; i < n_max; i++)  //Bucle que revisa todos los elementos de un arreglo hasta un n determinado
    {
        printf("a[%d] = %d\n",i,a[i]);
    }
}

int main()
{
    int a[N];
    pedir_arreglo(N,a);
    imprimir_arreglo(N,a);
    int suma = sumatoria(N,a);
    printf("La sumatoria de los elementos del arreglo es: %d\n",suma);
    return 0;
}
