#include <stdio.h>
#include <assert.h>

#define N 5

void pedir_arreglo(int tam, int a[]){
    for (int i = 0; i < tam; i++) 
    {
        printf("Coloca el elemento del arreglo a[%d] := ",i); 
        scanf("%d",&a[i]);
    }
}

void imprimir_arreglo(int tam, int a[]){
    printf("Los elementos del arreglo son:\n");
    for (int i = 0; i < tam; i++)  //Bucle que revisa todos los elementos de un arreglo hasta un n determinado
    {
        printf("a[%d] = %d\n",i,a[i]);
    }
}

void intercambiar(int tam,int a[], int i, int j){
    int auxi = a[i];
    int auxj = a[j];
    a[i] = auxj;
    a[j] = auxi;
    assert((i<tam&&i>=0)&&(j<tam&&j>0));
}

int main(){
    int a[N],i,j;
    pedir_arreglo(N,a);
    imprimir_arreglo(N,a);
    printf("En que posición están los arreglos que desea intercambiar?\n");
    printf("Ingrese primer posición:\n");
    scanf("%d",&i);
    printf("Ingrese segunda posición:\n");
    scanf("%d",&j);
    intercambiar(N,a,i,j);
    printf("Su nuevo arreglo es:\n");
    imprimir_arreglo(N,a);
    return 0;
}