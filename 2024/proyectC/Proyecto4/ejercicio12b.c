#include <stdio.h>

#define N 4

void pedir_arreglo(int tam, int a[]){
    for (int i = 0; i < tam; i++)
    {
        printf("Coloca el elemento del arreglo a[%d] := ",i);
        scanf("%d",&);
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
    int a[N];
    int c = pInt('c');
    int i = pInt('i');
    pedir_arreglo(N,a);
    c = 0;
    i = 0;
    while (i<N){
        if (>0)
        {
            c = c + 1;
        }
        i++;
    }
    return 0;
}