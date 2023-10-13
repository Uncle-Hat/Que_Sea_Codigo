#include <stdio.h>
#include <assert.h>

void hola_hasta(int n)
{
    assert(n > 0);
    int x = 0;
    while (x < n)
    {
        printf("Hola\n");
        x = x + 1;
    }
}
int main(void)
{
    int n;
    printf("¿Cuantas veces te gustaria leer hola?\n");
    scanf("%d", &n);
    hola_hasta(n);
    return 0;
}

/* 
¿Cuantas veces te gustaria leer hola?
5
Hola
Hola
Hola
Hola
Hola
*/