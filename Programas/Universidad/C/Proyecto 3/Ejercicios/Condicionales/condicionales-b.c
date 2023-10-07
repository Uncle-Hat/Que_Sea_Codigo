/*
b) Traducı a lenguaje C los programas que siguen a continuacion, agregando las instrucciones necesarias para que el usuario pueda ingresar
los valores de las variables de entrada. Luego, completa los estados:
Var x, y : Int;
σ0 : (x → −100, y → 1)
if x ≥ y →
σ1 :
x := 0
σ2 :
x ≤ y →
σ01:
x := 2
σ02:
fi
σ03:
*/

#include <stdio.h>

int main(void)
{
    int x, y, z, m;
    printf("colocale valor a x\n");
    scanf("%d", &x);
    printf("colocale valor a y\n");
    scanf("%d", &y);
    printf("colocale valor a z\n");
    scanf("%d", &z);
    printf("colocale valor a m\n");
    scanf("%d", &m);
    printf("Estado 0 es x:%d , y:%d , z:%d , m:%d\n", x, y, z, m);
    if (x < y)
    {
        m = x;
    }
    else
    {
        m = y;
    };
    printf("Estado 1 es x:%d , y:%d , z:%d , m:%d\n", x, y, z, m);
    if (m < z)
    {
        printf("'m' es menor que z\n");
    }
    else
    {
        m = z;
    }
    printf("Estado 2 es x:%d , y:%d , z:%d , m:%d\n", x, y, z, m);
}

/*
colocale valor a x
5
colocale valor a y
4
colocale valor a z
8
colocale valor a m
0
Estado 0 es x:5 , y:4 , z:8 , m:0
Estado 1 es x:5 , y:4 , z:8 , m:4
'm' es menor que z
Estado 2 es x:5 , y:4 , z:8 , m:4
*/