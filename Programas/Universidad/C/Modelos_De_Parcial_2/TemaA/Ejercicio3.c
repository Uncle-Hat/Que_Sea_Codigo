#include <stdio.h>
#define N 5

struct paridad_t {
int n_pares;
int n_impares;
};

struct paridad_t contar_paridad(int a[], int tam){
    int i = 0;
    struct paridad_t result = {0,0};
    while (i<tam)
    {
        if (a[i] % 2 == 0)
        {
            result.n_pares = result.n_pares + 1;
        }
        else{
            result.n_impares = result.n_impares + 1;
        }
        i++;
    }
    return result;
};

void pedirarreglo(int a[], int tam){
    int pos = 0;
    while (pos<tam)
    {
        printf("Coloca un valor para a[%d] = ",pos);
        scanf("%d",&a[pos]);
        pos++;
    }
}

int main()
{
    int tam,a[N];
    tam = N;
    pedirarreglo(a,tam);
    struct paridad_t result = contar_paridad(a,tam);
    printf("La cantidad de números pares es = %d y las impares es %d",result.n_pares,result.n_impares);
    return 0;
}
