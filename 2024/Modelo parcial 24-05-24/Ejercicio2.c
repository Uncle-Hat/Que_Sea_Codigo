#include <stdio.h>
#include <stdbool.h>
#define N 5 //Tamaño arreglo fijo

//gcc -Wall -Wextra -std=c99 Ej1.c -o Ej1

//Tuve problemas para darme cuenta acerca del sinónimo de tipos

typedef struct {
    int cant_v;
    int cant_pares;      
    int cant_imp;   
    bool hay_8;     
} datos;

// Tuve problema con v (Se me contabilizaba también dentro de los impares y pares)
// Solución, colocarlo en el final de cada if al contador de v

datos llenar_estructura(int a[], int tam, int v){
    datos res = {0,0,0,false};
    /* 
    While es mucho más recomendable (porque lo vimos en clase)
    Intentar no hacer tantos if anidados
    */
    for (int i = 0; i < tam; i++)
    {        
        if (a[i] % 2 == 0) //Si es par
        {
            if (a[i] == 8){
                res.cant_pares++; 
                res.hay_8 = true;
                if (a[i]==v){
                    res.cant_v++;
                    }
            }
            else{
                res.cant_pares++; 
                if (a[i]==v){
                    res.cant_v++;
                    }
            }
        }
        else  if (a[i] % 2 != 0){
            res.cant_imp++;  
            if (a[i]==v){
                res.cant_v++;
            }
        }
    }
    return res;
};

//Función Importada

void pedir_arreglo(int n_max, int a[]){
        for (int i = 0; i < n_max; i++) 
    {
        printf("Coloca el elemento del arreglo a[%d] := ",i); 
        scanf("%d",&a[i]);
    }
}

//Función Importada

int pInt(char c){
    int res;
    printf("Dame un valor para %c:\n",c);
    scanf("%d",&res);
    return res;
    }

// El arreglo es una variable más
// por eso se usa a y no a[] a la hora de llamarlo

int main()
{
    int a[N], v;
    pedir_arreglo(N,a);
    v = pInt('v');
    datos resultado = llenar_estructura(a,N,v); //Se declara distinto por el sinónimo de tipos
    printf("Resultados\n");
    printf("v : %d\n",resultado.cant_v);
    printf("Pares : %d\n",resultado.cant_pares);
    printf("Impares : %d\n",resultado.cant_imp);
    printf("¿Hay ochos? : %d\n",resultado.hay_8);
    return 0;
}

// Dame un valor para v:
// 3
// Resultados
// v : 3
// Pares : 1
// Impares : 4
// ¿Hay ochos? : 0