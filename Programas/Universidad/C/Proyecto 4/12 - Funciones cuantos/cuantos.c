/*
(Función cuantos). Hacer un programa en un archivo nuevo cuantos.c que calcula cuántos
elementos menores, iguales y mayores a un número hay en un arreglo. La función tiene el
siguiente prototipo:
struct comp_t cuantos(int tam, int a[], int elem)
donde la estructura comp_t se define como sigue:
struct comp_t {
int menores;
int iguales;
int mayores;
};

La función toma un tamaño máximo de arreglo, el arreglo y un entero, y devuelve una
estructura con tres enteros que respectivamente indican cuántos elementos menores, iguales
o mayores al argumento hay en el arreglo. La función cuantos debe contener un único ciclo.
*/

#include <stdio.h>
#define V 5

struct comp_t
{
    int menores;
    int iguales;
    int mayores;
};

struct comp_t cuantos(int tam, int a[], int elem)
{
    struct comp_t resultado = {0, 0, 0};
    for (int i = 0; i < tam; i++)
    {
        if (a[i] < elem)
        {
            resultado.menores++;
        }
        else if (a[i] == elem)
        {
            resultado.iguales++;
        }
        else
        {
            resultado.mayores++;
        }
    }
    return resultado;
}

void pedir_arreglo(int tam, int a[])
{
    printf("Ingrese los valores del arreglo:\n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d] = ", i);
        scanf("%d", &a[i]);
    }
}

int main()
{
    int elem, tam;
    int a[V];

    printf("Coloque el numero maximo de elementos en dentro del arreglo: ");
    scanf("%d", &tam);

    pedir_arreglo(tam, a);

    a[tam];

    printf("Coloque el valor del elemento a buscar: ");
    scanf("%d",&elem);

    struct comp_t resultado = cuantos(tam, a, elem);
    printf("Menores:%d, Iguales:%d, Mayores:%d\n", resultado.menores, resultado.iguales, resultado.mayores);

    return 0;
}
