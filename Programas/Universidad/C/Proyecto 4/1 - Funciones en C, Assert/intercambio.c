#include <stdio.h>
#include <assert.h>

int pedirvalor(int n, char namevar)
{
    printf("Coloque el valor de la variable %c\n",namevar);
    scanf("%d", &n);
    return n;
}

int intercambiovalores(int x, int y, int z)
{
    z = x;
    x = y;
    y = z;
    return x, y, z;
}

int main()
{
    char namevar;
    int x, y, z;
    x = pedirvalor(x,'x');
    y = pedirvalor(y,'y');
    z = pedirvalor(z,'z');
    printf("Los valores seleccionados son: x = %d, y = %d, z = %d\n", x, y, z);
    intercambiovalores(x, y, z);
    printf("Tras el intercambio ahora los valores son: x = %d, y = %d, z = %d\n", x, y, z);
    return 0;
}
/*
Coloque el valor de la variable x
5
Coloque el valor de la variable y
4
Coloque el valor de la variable z
3
Los valores seleccionados son: x = 5, y = 4, z = 3
Tras el intercambio ahora los valores son: x = 5, y = 4, z = 3
*/