/*
La primera recibe un tamaño máximo de arreglo y un arreglo como argumento devolviendo
true cuando todos los elementos del arreglo a[] son numeros pares y false en caso
contrario.

La segunda determina si hay en el arreglo a[] algún elemento que es múltiplo
de m.

En la función main se debe pedir al usuario los elementos del arreglo (asumiendo un tamaño constante)
y luego permitirle elegir qué función ejecutar.

En caso que se elija la función existe_multiplo() se le debe pedir al usuario un valor para m.
*/

#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

void pedir_arreglo(int tam, int a[])
{
    assert(tam > 0);
    printf("Ingrese los valores del arreglo:\n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d] = ", i);
        scanf("%d", &a[i]);
    }
}

bool todos_pares(int tam, int a[])
{
    int i = 0;
    int auxt = 0;
    for (i = 0; i < tam; i++)
    {
        if (a[i] % 2 == 0)
        {
            true;
        }
        else
        {
            false;
            break;
        }
    }
}
bool existe_multiplo(int m, int tam, int a[])
{
    int i = 0;
    printf("De qué número quieres buscar múltiplo?");
    scanf("%d", &m);
    for (i = 0; i < tam; i++)
    {
        if (a[i] % m != 0)
        {
            printf("No existe múltiplo\n");
            break;
        }
        else
        {
            printf("Existe múltiplo");
            break;
        }
    }
}

int main()
{
    int tam, m;
    printf("Coloque el tamaño máximo del arreglo: \n");
    scanf("%d", &tam);
    int a[tam];
    pedir_arreglo(tam, a);
    printf("Ahora puedes elegir entre dos programas:\n");
    printf("(1) Todos Pares\n--Revisa que todos los elementos del arreglo sean pares\n");
    printf("(2)Existe multiplo\n--Revisa si existe un múltiplo de un numero dentro del arreglo\n");
    int e;
    scanf("%d", &e);
    if (e == 1)
    {
        int b = todos_pares(tam, a);
        if (b == 1)
        {
            printf("En el arreglo todos los numeros son pares\n");
        }
        else
        {
            printf("En el arreglo no todos los numeros son pares\n");
        }
    }
    else if (e == 2)
    {
        int auxmul = existe_multiplo(m, tam, a);
        if (auxmul == 1)
        {
            printf("Existe múltiplo\n");
        }
    }
    else
    {
        printf("Coloca una variable válida\n");
        printf("Se ha salido del programa con éxito");
    };
    return 0;
}
