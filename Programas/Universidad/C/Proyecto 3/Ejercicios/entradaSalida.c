
// 1. Entrada/Salida


/* Hace un programa en C, que solicite el ingreso de los valores de las variables
x,y,z, e imprima el resultado de las siguiente expresiones. Completa los resultados de la
tablas para los dos estados dados. */

/* 
Entrada/Salida Hace un programa en C, que solicite el ingreso de los valores de las variables
x,y,z, e imprima el resultado de las siguiente expresiones. Complet´a los resultados de la
tablas para los dos estados dados.
*/


#include <stdio.h>
int main(void)
{
    int x, y, z; 
    printf("Ingrese un valor para x\n");
    scanf("%d", &x);
    printf("ingrese un valor para y\n");
    scanf("%d", &y);
    printf("ingrese un valor para z\n");
    scanf("%d", &z);
    printf("\nusted ingreso x = %d, y = %d y z = %d\n\n",x,y,z);
    printf("x + y + 1 = %d\n",x+y+1);
    printf("z * z + y * 45 - 15 * x = %d\n",z*z+y*45-15*x);
    printf("y - 2 == (x * 3 + 1) mod 5 = %d\n",y-2==(x*3+1)%5);
    printf("y / 2 * x = %d\n",y/2*x);
    printf("y<x*z = %d\n",y<x*z);
    return 0;
}

/*
Primer Estado

usted ingreso x = 7, y = 3 y z = 5

x + y + 1 = 11
z * z + y * 45 - 15 * x = 55
y - 2 == (x * 3 + 1) / 5 = 0
y / 2 * x = 7
y<x*z = 1 -- Tipo Int

Segundo Estado

usted ingreso x = 1, y = 10 y z = 8

x + y + 1 = 12
z * z + y * 45 - 15 * x = 499
y - 2 == (x * 3 + 1) / 5 = 0
y / 2 * x = 5
y<x*z = 0 -- Tipo Int
*/

