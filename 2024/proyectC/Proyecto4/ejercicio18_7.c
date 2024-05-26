#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

#define N 5

void askArray(int a[], int tam){
    printf("Coloca valor al arreglo de %d elementos\n",N);
    int i = 0;
    while (i<tam){
        printf("[%d] := ",i);
        scanf("%d",&a[i]);
        i++;
    }
}


int sumAnterior(int a[], int tam){ //Sumatoria de los elementos
    int i = 0;
    int sumAnt = 0;
    while (i<tam){
        sumAnt = sumAnt + a[i];
        i++;
    }
    return sumAnt;
}

bool detSum (int a[],int tam){
    int i = 0 ;
    while (i<tam){
        if(a[i] == sumAnterior(a,i)){
            //Uso la variable i = tam de sumAnterior ya que me permite el hecho de ver la sumatoria hasta el elemento en cuestión
            return true;
            break;
        }
        i++;
    }
    return false;
}

int main()
{
    int a[N];
    assert(N>0);
    askArray(a,N);
    if (detSum(a,N)){
        printf("Existe un número dentro del arreglo que es la suma de sus anteriores\n");
    }
    else{
        printf("No existe un número dentro del arreglo que es la suma de sus anteriores\n");
    }
    return 0;
}
