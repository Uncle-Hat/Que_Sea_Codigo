#include <stdio.h>
#include <assert.h>
void hola_hasta(int n){
    while (n>0)
    {
    printf("hola\n");
    n = n-1;
    }
    
}
int main()
{
    int n;
    printf("¿Cuantas veces desea ser saludado?:\n");
    scanf("%d",&n);
    assert(n<0);
    hola_hasta(n);
    return 0;
}
