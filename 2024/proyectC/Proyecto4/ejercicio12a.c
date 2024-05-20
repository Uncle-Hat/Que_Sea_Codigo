#include <stdio.h>
#define N 5

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
