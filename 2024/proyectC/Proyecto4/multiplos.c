#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

#define N 5

//Funciones de arreglos

void pedir_arreglo(int n_max, int a[]){
    for (int i = 0; i < n_max; i++) 
    {
        printf("Coloca el elemento del arreglo a[%d] := \n",i); 
        scanf("%d",&a[i]);
    }
}

bool todos_pares(int tam, int a[]){
    for(int i = 0; i < tam; i++){
        if(a[i] % 2 != 0){
            return false;
        }
    }
    return true;
}

bool existe_multiplo(int m, int tam, int a[]){
    for(int i = 0; i < tam; i++){
        if(a[i] % m == 0){
            return true;
        }
    }
    return false;
}

//Funciones de enteros

int pInt(char c){
    int res;
    printf("Dame un valor para %c:\n",c);
    scanf("%d",&res);
    return res;
    }

int main()
{
    int a[N],eleccion;
    pedir_arreglo(N,a);
    printf("Bienvenido al programa elije tu aventura:\n");
    printf("1 - ¿Todos los elementos del arreglo dado son pares?\n2 - Buscador de múltiplo dentro del arreglo\n");
    scanf("%d",&eleccion);
    if(eleccion == 1){
         if (todos_pares(N,a))
        {
            printf("Todos los elementos del arreglo son pares\n");
        }
        else {
            printf("No todos los elementos del arreglo son pares\n");
        }
    }
    else if (eleccion == 2){
        int f = pInt('n');
        if (existe_multiplo(f,N,a))
        {
            printf("%d es múltiplo de algún elemento del arreglo\n",f);
        }
        else {
            printf("No existe múltiplo de %d dentro del arreglo\n",f);
        }
    }
    assert(eleccion==1||eleccion==2);
    return 0;
}
