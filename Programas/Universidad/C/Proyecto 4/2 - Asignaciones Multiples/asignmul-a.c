#include <stdio.h>
#include <assert.h>

int pedirvalor(int n, char namevar)
{
    printf("Coloque el valor de la variable %c\n", namevar);
    scanf("%d", &n);
    return n;
}

void asignemos(int xi, int yi)
{
    int X = xi;
    int Y = yi;
    assert(xi == X && yi == Y);
    yi = xi + yi;
    xi = X + 1; //Usamos el X no modificado, diferencia C-TeoPract
    assert(xi == X+1 && yi == X + Y);
}

int main()
{
    char namevar;
    int x, y;
    x = pedirvalor(x, 'x');
    y = pedirvalor(y, 'y');
    printf("Los valores colocados son : x = %d, y = %d\n", x, y);
    printf("Pasamos por la funcion de asignacion");
    asignemos(x, y);
    printf("Ahora los valores colocados son : x = %d, y = %d\n", x, y);
    return 0;
}
/* 
Coloque el valor de la variable x
4
Coloque el valor de la variable y
5
Los valores colocados son : x = 4, y = 5
Pasamos por la funcion de asignacionAhora los valores colocados son : x = 4, y = 5
*/