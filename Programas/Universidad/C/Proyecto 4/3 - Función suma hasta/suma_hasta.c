#include <stdio.h>
#include <assert.h>

int sumar_hasta(int n){
    assert(n>=0);
    int x = 0;
    int suma = 0;
    int sumaAcc = 0;
    while (x <= n)
    {
        suma = x + suma;
        x = x +1;
    }
        printf("sumado :  %d\n", suma);
}
int main(void)
{
    int n;
    printf("sumar hasta: \n");
    scanf("%d", &n);
    sumar_hasta(n);
    return 0;
}

/*
sumar hasta: 
5
sumado :  15
*/