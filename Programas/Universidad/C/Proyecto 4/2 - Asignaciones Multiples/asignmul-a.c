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
    int X, Y;
    X = xi;
    Y = yi;
    assert(xi == X && yi == Y);
    xi = xi + 1;
    yi = xi + yi;
    assert(xi == X + 1 && yi == X + Y);
}

int main()
{
    char namevar;
    int x, y;
    x = pedirvalor(x, 'x');
    y = pedirvalor(y, 'y');
    printf("Los valores colocados son : x = %d, y = %d", x, y);
    printf("Pasamos por la funcion de asignacion");
    asignemos(x, y);
    printf("Ahora los valores colocados son : x = %d, y = %d", x, y);
    return 0;
}
