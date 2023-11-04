/*
(Arreglo de asociaciones) En asoc.c programar la función
bool asoc_existe(int tam, struct asoc a[], clave_t c)

Donde la estructura struct asoc y los tipos clave_t, valor_t se definen como:

typedef char clave_t;
typedef int valor_t;

struct asoc {
clave_t clave
valor_t valor
};

El llamado a asoc_existe(tam, a, c) debe indicar si la clave c se encuentra en el arreglo
de asociaciones a[].
En la función main pedir al usuario los datos del arreglo (asumiendo un tamaño constante) y luego pedir una clave.
Finalmente usar la función asoc_existe para verificar la existencia de la clave ingresada y mostrar por pantalla
un mensaje indicando si la clave existe o no en el arreglo de asociaciones.
*/

#include <stdio.h>
#include <stdbool.h>

typedef char clave_t;
typedef int valor_t;

struct asoc // Se declara la estructura de dos valores
{
    clave_t clave;
    valor_t valor;
};

bool asoc_existe(int tam, struct asoc a[], clave_t c)
{
    int pos = 0;
    while (pos < tam)
    {
        if (a[pos].clave == c)
        {
            return true;
        }
        pos++;
    }
    return false;
}

void pedir_arreglo(int tam, struct asoc a[])
{
    int pos = 0;
    printf("Ingrese los valores dentro del arreglo: \n");
    while (pos < tam)
    {
        printf("Coloca clave a[%d] = ", pos);
        scanf(" %c", &a[pos].clave);
        printf("Coloca valor a[%d] = ", pos);
        scanf("%d", &a[pos].valor);
        pos++;
    }
}
clave_t pedir_clave()
{
    clave_t c;
    printf("Coloque el valor de la clave: ");
    scanf(" %c", &c);
    return c;
}

int main()
{
    int tam;
    char c;

    printf("Ingrese el tamaño del arreglo: \n");
    scanf("%d", &tam);
    
    struct asoc a[tam];

    pedir_arreglo(tam, a);
    clave_t clave = pedir_clave();
    if (asoc_existe(tam, a, clave))
    {
        printf("La clave %c existe en el arreglo\n",clave);
    }
    else{
        printf("La clave %c NO existe en el arreglo\n",clave);
    }

    return 0;
}
