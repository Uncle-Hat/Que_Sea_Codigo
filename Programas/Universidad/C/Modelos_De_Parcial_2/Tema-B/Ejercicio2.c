#include <stdio.h>
#include <assert.h>
#define N 5

int suma_multiplos(int a[], int tam, int k)
{
    int i = 0;
    int sum = 0;
    while (i < tam)
    {
        if (a[i] % a[k] == 0)
        {
            sum = sum + a[i];
        }
        i++;
    }
    return sum;
};

void solicitararreglo(int a[], int tam)
{
    int i = 0;
    while (i < tam)
    {
        printf("Coloque el valor en a[%d] = ", i);
        scanf("%d", &a[i]);
        i++;
    }
}

int main()
{
    int a[N], k, tam;
    tam = N;
    solicitararreglo(a,tam);
    printf("Decime un índice para buscar la suma de múltiplos de ese número\n");
    scanf("%d", &k);
    assert(k >= 0 && k < N);
    int sm = suma_multiplos(a, tam, k);
    printf("La suma de los valores múltiplos de %d es = %d\n",k,sm);
    return 0;
}
