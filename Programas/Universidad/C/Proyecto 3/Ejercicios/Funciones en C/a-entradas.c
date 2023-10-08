#include <stdio.h>

int pedir_entero(char name)
{
    int x;
    printf("Por favor, ingrese un valor para almacenar en la variable %c: ", name); //%c caracter
    scanf("%d", &x);
    return x;
}

void imprimir_entero(int x, char name)
{
    printf("El valor de %c es: %d\n", name, x);
}

int main()
{
    int n;
    n = pedir_entero('n');
    imprimir_entero(n, 'n');
    return 0;
}