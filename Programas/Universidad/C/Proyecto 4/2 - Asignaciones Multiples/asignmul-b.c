#include <stdio.h>
#include <assert.h>

int pedirvalor(int n, char namevar)
{
    printf("Coloque el valor de la variable %c\n", namevar);
    scanf("%d", &n);
    return n;
}

void asignemos(int xi, int yi, int zi)
{
    int X = xi;
    int Y = yi;
    int Z = zi;
    assert(xi == X && yi == Y);
    xi = yi;
    yi = yi + X + zi;
    zi = Y + X; //Usamos el X no modificado, diferencia C-TeoPract
    assert(xi == Y && yi == Y + X + Z && zi == Y + X);
}

int main()
{
    char namevar;
    int x, y, z;
    x = pedirvalor(x, 'x');
    y = pedirvalor(y, 'y');
    z = pedirvalor(z, 'z');
    printf("Los valores colocados son : x = %d, y = %d , z = %d\n", x, y, z);
    printf("Pasamos por la funcion de asignacion\n");
    asignemos(x, y, z);
    printf("Ahora los valores colocados son : x = %d, y = %d z = %d\n", x, y, z);
    return 0;
}

/* 
Coloque el valor de la variable x
5
Coloque el valor de la variable y
4
Coloque el valor de la variable z
3
Los valores colocados son : x = 5, y = 4 , z = 3
Pasamos por la funcion de asignacion
Ahora los valores colocados son : x = 5, y = 4 z = 3
*/