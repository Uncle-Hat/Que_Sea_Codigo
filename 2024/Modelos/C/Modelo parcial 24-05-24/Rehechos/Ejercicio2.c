#include <stdio.h>
#include <stdbool.h>
#define N 5

typedef struct {
int cant_v;
int cant_pares;
int cant_imp;
bool hay_8;
} datos;

int intInput(char a){
    int x = 0; //Inicializador
    printf("Coloca valor a %c\n",a);
    scanf("%d",&x);
    return x;
}

void arrInput(int a[],int tam){
    int i = 0; //Inicializador
    printf("Coloca los valores del arreglo:\n");
    while (i<tam){
        printf("a[%d] = ",i);
        scanf("%d",&a[i]);
        i++; //Contador
    }
}

// arrShow(int a[],int tam){
//     int i = 0;
//     printf("Los valores del arreglo son:\n");
//     while (i<tam){
//         printf("[%d] = %d",i,a[i]);
//     }
// }

datos llenar_estructura(int a[], int tam, int v){
    int i=0;
    datos res = {0,0,0,false};
    
    while (i<tam)
    {
    if (a[i]==v)
    {
        res.cant_v++;
        }
    if (a[i] % 2 == 0)
    {
        res.cant_pares++;
        }
    else
    {
        res.cant_imp++;
        }
    if (a[i] == 8)
    {
        res.hay_8 = true;
        }
    i++;
    }
    return res;
};


int main()
{
    int a[N],v;
    arrInput(a,N);
    v = intInput('v');
    datos result = llenar_estructura(a,N,v);
    printf("Cantidad de elementos en la estructura que son.\n");
    printf("V's = %d\n",result.cant_v);
    printf("Impares = %d\n",result.cant_imp);
    printf("Pares = %d\n",result.cant_pares);
    printf("¿Hay 8? = %d\n",result.hay_8);
    return 0;
}
