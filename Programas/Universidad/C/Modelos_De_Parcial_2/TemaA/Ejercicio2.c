
#include <stdio.h>
#include <assert.h>
#define N 5
// Defino valor arbitrario

int suma_mayores(int a[], int tam, int k)
{
    int i = 0;
    int sum = 0;
    while (i < tam)
    {
        if (a[k] < a[i])
        {
            sum = sum + a[i];
        }
        i++;
    }
    return sum;
}

void solicitudarreglo(int a[N], int tam)
{
    int i = 0;
    while (i < tam)
    {
        printf("Coloca el valor del arreglo en a[%d] = ", i);
        scanf("%d", &a[i]);
        i++;
    }
}

int main()
{
    int a[N], tam, k;
    tam = N;
    solicitudarreglo(a, tam);
    printf("Coloca el valor del índice al cual le quieres sumar solo valores mayores a = ");
    scanf("%d", &k);
    assert(k >= 0 && k < tam);
    int sm = suma_mayores(a, tam, k);
    printf("La suma de los valores mayores a %d es %d \n", a[k], sm);
    return 0;
}
