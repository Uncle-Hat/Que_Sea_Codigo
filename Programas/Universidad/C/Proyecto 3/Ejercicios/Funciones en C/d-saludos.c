#include <stdio.h>
int main()
{
    imprimir_hola();
    imprimir_hola();
    imprimir_chau();
    imprimir_chau();
    return 0;
}
void imprimir_hola(void)
{
    printf("Hola\n");
}
void imprimir_chau(void)
{
    printf("Chau\n");
}

/*
Hola
Hola
Chau
Chau
*/