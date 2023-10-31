/* (M ́inimos). Hacer un programa en un archivo con nombre minimos.c que contenga las
siguientes funciones:

int minimo_pares(int tam, int a[])
int minimo_impares(int tam, int a[])

Estas funciones reciben un tama ̃no m ́aximo de arreglo y un arreglo como argumentos,
devolviendo el elemento par m ́as peque ̃no del arreglo y el elemento impar m ́as peque ̃no del
arreglo respectivamente.

a) En la funci ́on main se debe pedir al usuario los entos del arreglo (asumiendo un
tama ̃no constante) y luego mostrar por pantalla:

El resultado de minimo_pares(), para el arreglo ingresado

El resultado de minimo_impares(), de nuevo, para el arreglo ingresado

El elemento m ́inimo del arreglo ingresado (utilizando el resultado de ambas funciones
para calcularlo).

Pueden definir alguna funci ́on auxiliar si les resulta necesario.

NOTA: Investigar las constantes definidas en la librer ́ia <limits.h> para definir el
nutro de la operaci ́on m ́inimo */
#include <stdio.h>
#include <limits.h>

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

void parimpar(int a[], int par1[], int imp1[], int tam, int *tampares, int *tamimpares)
{
    int par, impar;
    for (int i = 0; i < tam; i++)
    {
        if (a[i] % 2 == 0)
        {
            par1[(*tampares)++] = a[i];
        }
        else
        {
            imp1[(*tamimpares)++] = a[i];
        }
    }
}

int main()
{
    int mpar, mimpar, tam;

    printf("Coloque el numero maximo de elementos en dentro del arreglo: ");
    scanf("%d", &tam);

    int a[tam];
    int par1[tam];
    int imp1[tam];
    int tampares = 0;
    int tamimpares = 0;

    pedir_arreglo(tam, a);
    parimpar(a, par1, imp1, tam, &tampares, &tamimpares);

    mpar = minimo_pares(tampares, par1);
    mimpar = minimo_impares(tamimpares, imp1);

    printf("El mínimo de los pares es: %d\n", mpar);
    printf("El mínimo de los impares es: %d\n", mimpar);

    return 0;
}
