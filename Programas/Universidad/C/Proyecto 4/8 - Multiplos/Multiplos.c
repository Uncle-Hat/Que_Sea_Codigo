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
#include <stdbool.h>
#include <assert.h>

void pedir_arreglo(int tam, int a[])
{
    printf("Ingrese los valores del arreglo:\n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d] = ", i);
        scanf("%d", &a[i]);
    }
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

int main()
{
    int tam, m;
    m = 0; //Inicializo el valor de m
    printf("Coloque el tamaño máximo del arreglo: \n");
    scanf("%d", &tam);
    assert(tam>0); //La variable tam está forzada a ser mayor a cero
    int a[tam];
    pedir_arreglo(tam, a); //Solicitamos el conjunto de valores
    printf("Ahora puedes elegir entre dos programas:\n(1) Todos Pares\n--Revisa que todos los elementos del arreglo sean pares\n(2) Existe multiplo\n--Revisa si existe un múltiplo de un numero dentro del arreglo\n");
    int e;
    scanf("%d", &e);

    if (e == 1)
    {
        if (todos_pares(tam, a))
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
        existe_multiplo(m, tam, a);
    }
    else 
    {
        printf("Coloca una variable válida\n");
    }
    printf("El programa ha terminado con éxito");
    return 0;
}
