
// programar la función
// 
// que dado un tamaño de arreglo tam y un arreglo a[] devuelve una estructura struct
// paridad, donde en el campo pares dejará la cantidad de valores pares encontrados en
// a[], en el campo impares contará la cantidad de valores impares en a[] y en el
// campo paridad_alternada dejará el valor true si los valores son pares / impares
// alternadamente en a[].
#include <stdbool.h>
#include <stdio.h>
#define N 5

struct paridad {
int pares;
int impares;
bool paridad_alternada;
};

bool espar(int a){
    if (a%2==0){
        return true;
    }
    else{
        return false;
    }
}

struct paridad analizar_paridad(int tam, int a[]){
    int i = 0;
    struct paridad res = {0,0,false};
    while(i<tam){
        if (a[i] % 2 == 0){
            res.pares++;
        }
        else{
            res.impares++;
        }
        bool esparant = espar(a[i]);
        i++;
        if (esparant != espar(a[i]))
        {
            res.paridad_alternada = true;
        }
        else{
            res.paridad_alternada = false;
        }        
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
    struct paridad resultados = analizar_paridad(N,a);
    printf("pares = %d\n",resultados.pares);
    printf("impares = %d\n",resultados.impares);
    printf("alternados? = %d\n",resultados.paridad_alternada);
    return 0;
}
// Coloca los valores del arreglo:
// a[0] = 1
// a[1] = 2
// a[2] = 3
// a[3] = 4
// a[4] = 5
// pares = 2
// impares = 3
// alternados? = 1