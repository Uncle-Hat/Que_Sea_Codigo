#include <stdio.h>
#include <stdbool.h>
#define N 5

//Sinónimos de tipo
typedef char clave_t;
typedef int valor_t;

//IMPORTANTE, las estructuras siempre van con ; al final

struct asoc{
    clave_t clave;
    valor_t valor;
};

bool asoc_existe(int tam, struct asoc a[], clave_t c){
    for (int i = 0; i < tam; i++)
    {
        if (a[i].clave == c){ //Si la clave de a en esa posición coincide con c es verdadero, sinó es falso
            return true;
        }
    }
    return false; 
    // Antes me daba un warning el compilador de tipo 
    // 'control reaches end of non-void function', 
    // tras colocar el return false desapareció.
}

void pedir_arreglo(int tam, struct asoc a[]){
    for (int i = 0; i < tam; i++) 
    {
        printf("Coloca el valor del arreglo a[%d] := ",i); 
        scanf("%d",&a[i].valor);
        printf("Coloca la clave del arreglo a[%d] := ",i); 
        scanf(" %c",&a[i].clave); //Siempre hay que colocar un espacio antes de usar %c
    }
}

char pChar(char c){
    char x;
    printf("Dame un valor para %c:",c);
    scanf(" %c",&x);
    return x;
    }

int main()
{
    struct asoc a[N];
    printf("Siendo el valor un numero y la clave un caracter:\n");
    pedir_arreglo(N,a);
    clave_t c = pChar('c');
    if (asoc_existe(N,a,c))
    {
        printf("Existe la clave %c en el arreglo\n",c);
    }
    else{
        printf("No existe la clave %c en el arreglo\n",c);
    }
    return 0;
}
