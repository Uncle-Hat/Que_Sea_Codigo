#include <stdio.h>
#include <stdbool.h>
#define N 5

void imprimir_arreglo(int n_max, int a[]){
    printf("Los elementos del arreglo son:\n");
    for (int i = 0; i < n_max; i++)  //Bucle que revisa todos los elementos de un arreglo hasta un n determinado
    {
        printf("a[%d] = %d\n",i,a[i]);
    }
}
void pedir_arreglo(int n_max, int a[]){
        for (int i = 0; i < n_max; i++) 
    {
        printf("Coloca el elemento del arreglo a[%d] := ",i); 
        scanf("%d",&a[i]);
    }
}
int main()
{
    int a[N];
    pedir_arreglo(N,a);
    int n = 0;
    bool r = true;
    int c = 1;
    while (n!=N){
        r = r && a[n] == c;
        c = (n+1)*c ;
        n = n+1;
    }
    printf("Son iguales los elementos al factorial de la posición? = %d",r);
    return 0;
}
