#include <stdio.h>
#include <assert.h>

#define N 5

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
    return 0;
}
