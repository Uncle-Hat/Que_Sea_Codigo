#include <stdio.h>
#include <limits.h>
#define N 5


struct datos_t{
    float maximo;
    float minimo;
    float promedio;
};

struct datos_t stats(int tam, float a[])
{
    struct datos_t res = {0,0,0}; //Inicializamos la estructura

    res.minimo = INT_MAX; //Inicializamos el minimo en un valor muy grande
    res.maximo = INT_MIN; //Lo mismo en un valor muy chico

    float valorgeneral = 0; //Creamos una función auxiliar que almacena la suma de todo sea valor dentro del arreglo

    for (int i = 0; i < tam; i++) //Bucle, sólo se permite un ciclo en este ejercicio
    {
        if (a[i]<res.minimo)
            {
            res.minimo = a[i];
            valorgeneral = valorgeneral + a[i];
            }
        else if (res.maximo<a[i])
            {
            res.maximo = a[i];
            valorgeneral = valorgeneral + a[i];
            }
    }
    res.promedio = valorgeneral/N; //Se calcula con el valor definido N el promedio de los valores en si
    return res;
};

void pedir_arreglo(int tam, float a[]){
    for (int i = 0; i < tam; i++) 
    {
        printf("Coloca el elemento del arreglo a[%d] := ",i); 
        scanf("%f",&a[i]);
    }
}

int main()
{
    float a[N];
    pedir_arreglo(N,a);
    struct datos_t resultado = stats(N,a);    
    printf("Maximo : %f\n",resultado.maximo);
    printf("Minimo : %f\n",resultado.minimo);
    printf("Promedio : %f\n",resultado.promedio);
    return 0;
}
