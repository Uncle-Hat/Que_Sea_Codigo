
#include <stdio.h>
#include <assert.h>
#include <limits.h>
#define N 5

int minimo_pares(int tam, int a[]){
    int minmaximo = INT_MAX;
    for (int i = 0; i < tam; i++)
    {
        if (a[i] % 2 == 0){
            if (a[i]<minmaximo)
            {
                minmaximo = a[i];
            }
        }
    }
    return minmaximo;
}


int minimo_impares(int tam, int a[]){
    int minmaximo = INT_MAX;
    for (int i = 0; i < tam; i++) //Bucle
    {
        if (a[i] % 2 == 0){} //Si es par
        else{
                if (a[i]<minmaximo)
            {
                minmaximo = a[i];
            }}
    }
    return minmaximo;
}

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

int minimogeneral(int a, int b){
    if (a<b)
    {
        return a;
    }
    else{
        return b;
    }
}

int main()
{
    int a[N],minimopar,minimoimpar, mingral;
    pedir_arreglo(N,a);
    minimopar = minimo_pares(N,a);
    printf("El minimo par es %d\n",minimopar);
    minimoimpar = minimo_impares(N,a);
    printf("El minimo impar es %d\n",minimoimpar);
    mingral = minimogeneral(minimopar,minimoimpar);
    printf("El mínimo elemento del arreglo es %d\n",mingral);
    return 0;
}
