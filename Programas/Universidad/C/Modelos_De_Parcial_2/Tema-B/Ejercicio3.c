#include <stdio.h>
#define TAM 5

struct cantidad_t {
int n_multiplos_dos;
int n_multiplos_tres;
};


struct cantidad_t contar_multiplos(int a[], int tam){
    struct cantidad_t iter1 = {0,0}; //Se inicializa el struct
    int i = 0;
    while (i<tam)
    {
        if (a[i] % 3 == 0)
        {
            iter1.n_multiplos_tres++;
        }
        else if(a[i] % 2 == 0){
            iter1.n_multiplos_dos++;
        }
        i++;
    }
    return iter1;
    };


void solicitararreglo(int a[], int tam)
{
    int i = 0;
    while (i < tam)
    {
        printf("Coloque el valor en a[%d] = ", i);
        scanf("%d", &a[i]);
        i++;
    }
}

int main()
{
    int tam;
    tam = TAM;
    int a[tam];
    solicitararreglo(a,tam);
    struct cantidad_t iteres = contar_multiplos(a,tam);
    printf("La cantidad de múltiplos de dos es = %d y la cantidad de múltiplos de tres es = %d\n",iteres.n_multiplos_dos,iteres.n_multiplos_tres); 
    return 0;
}
