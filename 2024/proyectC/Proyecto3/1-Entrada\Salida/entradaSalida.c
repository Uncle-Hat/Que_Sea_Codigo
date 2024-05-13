#include <stdio.h>

// Programa que asigna valores y los opera en el print

int main(void)
{
    int x,y,z;
    printf("Coloca el valor de 'x', 'y' y 'z'\n");
    scanf("%d",&x);
    scanf("%d",&y);
    scanf("%d",&z);
    printf("x + y + 1 = %d\n",x + y + 1);
    printf("z * z + y * 45 - 15 * x = %d\n",z * z + y * 45 - 15 * x);
    printf("y - 2 == (x * 3 + 1) mod 5 = %d\n",y - 2 == (x * 3 + 1) % 5);
    printf("y / 2 * x = %d\n",y / 2 * x);
    printf("y < x * z = %d\n",y < x * z);
    return 0;
}

// x + y + 1 = 11
// z * z + y * 45 - 15 * x = 55
// y - 2 == (x * 3 + 1) mod 5 = 0
// y / 2 * x = 7
// y < x * z = 1

// x + y + 1 = 12
// z * z + y * 45 - 15 * x = 499
// y - 2 == (x * 3 + 1) mod 5 = 0
// y / 2 * x = 5
// y < x * z = 0

//En la ultima, el tipo de la función es Int-Bool