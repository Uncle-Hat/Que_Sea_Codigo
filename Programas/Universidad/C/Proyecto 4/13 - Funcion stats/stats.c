/* (Función stats). Hacer un programa en un archivo nuevo stats.c, que calcula el mı́nimo, el
máximo, y el promedio de un arreglo no vacı́o de números flotantes (tipo float). La función
tiene el siguiente prototipo:
struct datos_t stats(int tam, float a[])
donde la estructura datos_t se define como sigue:
struct datos_t {
float maximo;
float minimo;
float promedio;
};
La función pedida debe implementarse con un único ciclo. En la función main pedir al usuario
los datos del arreglo e imprimir en pantalla los tres valores devueltos por la función. */

#include <stdio.h>
#include <limits.h>

struct datos_t // Primero se pide la struct 'datos'
{
    float maximo;
    float minimo;
    float promedio;
};

struct datos_t stats(int tam, float a[])
{
    struct datos_t initialvalor = {a[0], a[0], a[0]}; // La inicializa en el primer valor
    int position = 0;
    float sum = 0.0;
    while (position < tam) //Había tenido un error colocando a[position] <= que tam, lo corregí asesorando el código y dándome cuenta que tomaba un mínimo inexistente
    {
        if (a[position] < initialvalor.minimo)
        {
            initialvalor.minimo = a[position];
        }
        else if (a[position] > initialvalor.maximo)
        {
            initialvalor.maximo = a[position];
        }
        sum += a[position];
        position++;
    }
    initialvalor.promedio = sum / tam;
    return initialvalor;
}

void pedir_arreglo_floats(int tam, float a[])
{
    int position = 0;
    printf("Ingrese los valores del arreglo:\n");
    while (position < tam)
    {
        printf("a[%d] = ", position);
        scanf("%f", &a[position]);
        position++;
    }
}

int main()
{
    int tam;
    printf("Coloque el numero maximo de elementos en dentro del arreglo: ");
    scanf("%d", &tam);
    float a[tam];
    pedir_arreglo_floats(tam, a);
    struct datos_t result = stats(tam, a);
    printf("Minimo:%f, Maximo:%f, Promedio:%f", result.minimo, result.maximo, result.promedio);
    return 0;
}