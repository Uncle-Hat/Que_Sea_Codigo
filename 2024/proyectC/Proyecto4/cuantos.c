#include <stdio.h>

struct comp_t{
    int menores;
    int iguales;
    int mayores;
};

struct comp_t cuantos(int tam, int a[], int elem){
    struct comp_t res = {0,0,0}; //Inicialización de la estructura de comp_t llamada res
    for (int i = 0; i < tam; i++)
    {
        if(a[i]<elem){
            res.menores = res.menores + 1;
        }
        else if(a[i]>elem){
            res.mayores = res.mayores + 1;
        }
        else if (a[i]==elem){
            res.iguales = res.iguales + 1;
        }
    }
    return res; //Devuelve los tres valores .iguales,.menores,.mmayores
};

int pInt(char c){
    int res;
    printf("Dame un valor para %c:\n",c);
    scanf("%d",&res);
    return res;
    }

void pedir_arreglo(int tam, int a[]){
    for (int i = 0; i < tam; i++) 
    {
        printf("Coloca el elemento del arreglo a[%d] := ",i); 
        scanf("%d",&a[i]);
    }
}

int main()
{
    int tam;
    printf("¿Cuantos valores tendrá este arreglo?");
    scanf("%d",&tam);
    int c = pInt('c');
    int a[tam];
    pedir_arreglo(tam,a);
    //Declaramos la estructura de tipo comp_t de nombre resultado y le devolvemos los valores adquiridos
    struct comp_t resultado = cuantos(tam,a,c);
    //Imprimimos por pantalla los valores obtenidos y guardados en esta nueva estructura
    printf("Menores: %d\n",resultado.menores);
    printf("Mayores: %d\n",resultado.mayores);
    printf("Iguales: %d\n",resultado.iguales);
    return 0;
}
