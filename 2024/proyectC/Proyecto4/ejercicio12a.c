#include <stdio.h>
#define N 4

void pedir_arreglo(int tam, int a[]){
    for (int i = 0; i < tam; i++)
    {
        printf("Coloca el elemento del arreglo a[%d] := ",i);
        scanf("%d",&a[i]);
    }
}
int pInt(char c){
    int res;
    printf("Dame un valor para %c:\n",c);
    scanf("%d",&res);
    return res;
    }

int main()
{
    int i,s,a[N];
    i = pInt('i');
    s = pInt('s');
    i = 0;
    s = 0;
    pedir_arreglo(N,a);
    while (i<4){
        s = s + a[i];
        i = i + 1;
    }
    return 0;
}

// Valores basura
// c0 : i = 2051994464 , s = 21935
// Inicialización
// c0* : i = 0 , s = 0
// c0* : i = 0 , s = 0
// Ciclos
// c1* = 1 , s = 2
// c0* : i = 1 , s = 2
// c1* = 2 , s = 12
// c0* : i = 2 , s = 12
// c1* = 3 , s = 22
// c0* : i = 3 , s = 22
// c1* = 4 , s = 21
// Res final
// c3 = 4 , s = 21