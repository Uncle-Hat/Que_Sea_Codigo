/*Hacer una segunda versi´on del programa en el archivo minimos_estrella.c
y usar las funciones del ejercicio 8 en la fucni´on main para que en caso de no haber
elementos pares no se muestre el resultado de minimo_pares() y en caso de no haber
impares no se muestre el resultado de minimo_impares()*/

#include <stdio.h>
#include <limits.h>
#include <stdbool.h>
#define N 5

void pedir_arreglo(int tam, int a[])
{
    printf("Ingrese los valores del arreglo:\n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d] = ", i);
        scanf("%d", &a[i]);
    }
}

int minimo_pares(int tam, int par1[])
{
    int mpar = INT_MAX;
    for (int i = 0; i < tam; i++)
    {
        if (par1[i] < mpar)
        {
            mpar = par1[i];
        }
    }
    return mpar;
}

int minimo_impares(int tam, int imp1[])
{
    int mimpar = INT_MAX;
    for (int i = 0; i < tam; i++)
    {
        if (imp1[i] < mimpar)
        {
            mimpar = imp1[i];
        }
    }
    return mimpar;
}

bool existe_multiplo(int m, int tam, int a[])
{
    printf("De qué número quieres buscar múltiplo?\n");
    scanf("%d", &m);
    for (int i = 0; i < tam; i++)
    {
        if (a[i] % m == 0)
        {
            printf("Existe múltiplo\n");
            return true; // Encuentra un múltiplo entonces devuelve true
        }
    }
    printf("No existe múltiplo\n");
    return false; //No encuentra múltiplo, devuelve falso
}

bool todos_pares(int tam, int a[])
{
    for (int i = 0; i < tam; i++)
    {
        if (a[i] % 2 != 0)
        {
            return false; //Si los elementos no son pares, que se vuelva False
        }
    }
    return true; //Podemos saber que todos los elementos son pares
}

int minimo(int a, int b){
    
    return (a < b) ? a:b;
}

int main()
{
    int a[N];
    int marreglo, mpar, mimpar;
    pedir_arreglo(N, a);

    mpar = minimo_pares(N, a);
    mimpar = minimo_impares(N, a);
    marreglo = minimo(mpar, mimpar);

    if (todos_pares(N, a))
    {
        printf("El minimo elemento par del arreglo es: %d\n", mpar);
        printf("El minimo elemento del arreglo es: %d\n", marreglo);
    }
    else
    {
        if (existe_multiplo(2, N, a))
        {
            printf("El minimo elemento par del arreglo es: %d\n", mpar);
            printf("El minimo elemento impar del arreglo es: %d\n", mimpar);
            printf("El minimo elemento del arreglo es: %d\n", marreglo);
        }
        else
        {
            printf("El minimo elemento impar del arreglo es: %d\n", mimpar);
            printf("El minimo elemento del arreglo es: %d\n", marreglo);
        }
    }

    return 0;
}
