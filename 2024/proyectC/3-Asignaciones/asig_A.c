#include <stdio.h>

//Declaramos una variable x y le asignamos un valor, mostrando los valores de x en diversos estados

int main(void)
{
    int x;
    printf("c0 = ");
    scanf("%d",&x);
    x = 5;
    printf("c1 = %d\n",x);
    return 0;
}

// c0 = 1
// c1 = 5

// c0 = 8
// c1 = 5

// c0 = 6
// c1 = 5