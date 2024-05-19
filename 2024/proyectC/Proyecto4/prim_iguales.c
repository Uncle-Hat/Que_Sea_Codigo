#include <assert.h>
#include <stdio.h>
#define N 5
void pedir_arreglo(int tam, int a[]){
    for (int i = 0; i < tam; i++)
    {
        printf("Coloca el elemento del arreglo a[%d] := ",i);
        scanf("%d",&a[i]);
    }
}

void imprimir_arreglo(int tam, int a[]){
    printf("Los elementos del arreglo son:\n");
    for (int i = 0; i < tam; i++)  //Bucle que revisa todos los elementos de un arreglo hasta un n determinado
    {
        printf("a[%d] = %d\n",i,a[i]);
    }
}

int prim_iguales(int tam, int a[]){
    int auxi = a[0];
    int c = 0;
    for (int i = 0; i < tam; i++)
    {
        if (a[i] == auxi) //Comparo el elemento, si es igual, sumo al contador 'c' uno
        {
            c++;
        }
        else //Sinó, devuelvo la cantidad de elementos iguales desde el inicio
        {
            break;
        }
    }
    return c;
}


int main()
{
    int a[N],lengthb;
    pedir_arreglo(N,a);
    lengthb = prim_iguales(N,a);
    printf("La longitud en que los elementos son iguales desde el incio es %d\n",lengthb);
    return 0;
}
// Preguntar duda sobre arreglos dinámicos, ejercicio estrella