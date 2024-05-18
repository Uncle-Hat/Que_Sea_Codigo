#include <stdio.h>
#include <assert.h>

int suma_hasta(int n){
    int res = 0;
    while (n>0)
    {
        res = res + n;
        n = n-1;
    }
   return res;
}

int main()
{
    int n;
    printf("Coloca un número:\n");
    scanf("%d",&n);
    assert(n>=0);
    printf("La suma de todos los elementos anteriores a '%d' es '%d'\n",n,suma_hasta(n));
    return 0;
}
