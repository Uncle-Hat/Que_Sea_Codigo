#include <stdio.h>
#include <stdbool.h>


bool pedir_booleano(void)
{
    int v;
    printf("Por favor dame un valor de tipo entero para booleanos (0 es False y 1 es True):");
    scanf("%d", &v);
    return (v==1);
}

void imprimir_booleano(bool v)
{
    printf("El valor asignado fue %s\n", v ? "verdadero" : "falso");
}
int main()
{
    bool vb;
    vb = pedir_booleano();
    imprimir_booleano(vb);
    return 0;
}