#include <stdio.h>
#include <limits.h>
#include <stdbool.h>
#define N 5

struct datos {
bool es_divisible_por_2;
int menor_divisible_por_2;
};

struct datos hay_divisible(int tam, int a[]){
    struct datos res = {false,0};
    int i = 0;
    int max = INT_MAX;
    while (i<tam)
    {
        if (a[i] % 2 == 0){
            res.es_divisible_por_2 = true;
            if(a[i]<max){
                max = a[i];
                res.menor_divisible_por_2 = a[i];
            }
        }
        i++;
    }
    if (res.es_divisible_por_2!=true){
        res.menor_divisible_por_2 = INT_MAX;
    }
    
    return res;
};
void arrInput(int a[],int tam){
    int i = 0; //Inicializador
    printf("Coloca los valores del arreglo:\n");
    while (i<tam){
        printf("a[%d] = ",i);
        scanf("%d",&a[i]);
        i++; //Contador
    }
}
int main()
{
    int a[N];
    arrInput(a,N);
    struct datos result = hay_divisible(N,a);
    printf("Hay algun numero del arreglo que sea\n");
    printf("Existe al menos un valor divisible por dos ? = %d\n",result.es_divisible_por_2);
    printf("El menor divisible por dos es = %d\n",result.menor_divisible_por_2);
    return 0;
}
