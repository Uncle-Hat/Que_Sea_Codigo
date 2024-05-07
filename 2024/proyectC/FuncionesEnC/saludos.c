#include <stdio.h>  
void imprimir_hola(void){
    printf("Hola\n");
}

void imprimir_chau(void){
    printf("Adios\n");
}
int main()
{
    imprimir_hola();
    imprimir_hola();
    imprimir_chau();
    imprimir_chau();
    return 0;
}
