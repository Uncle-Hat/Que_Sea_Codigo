/* que siendo tam el tamaño del arreglo a[] devuelve la longitud del tramo inicial más largo
cuyos elementos son todos iguales (parecida a la función primIguales del Proyecto 1).
a) En la función main se le debe pedir al usuario los elementos del arreglo asumiendo un
tamaño constante previamente establecido (en tiempo de compilación) y luego mostrar
el resultado de la función prim_iguales por pantalla
b) (Punto Estrella) Mostrar por pantalla el mayor tramo inicial del arreglo a[] que tiene
a todos sus elementos iguales. */

#include <stdio.h>

#define N 5 // Constante arbitraria

int prim_iguales(int tam, int a[])
{
    int longMayTramo = 1;
    for (int i = 1; i < tam; i++)
    {
        if (a[i - 1] == a[i])
        {
            longMayTramo++;
        }
        else
        {
            break;
        }
    }
    return longMayTramo;
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
    int tam;
    tam = N;
    int a[tam];
    pedir_arreglo(tam, a);
    prim_iguales(tam, a);
    int longMayTramo = prim_iguales(tam, a);
    printf("La longitud del tramo inicial más largo cuyos elementos son iguales es '%d' \n",longMayTramo);
    printf("Y el arreglo de los elementos iguales es: ");
    for (int i = 0; i < longMayTramo; i++) 
    {
        printf("%d ", a[i]);
    }
    return 0;
}
