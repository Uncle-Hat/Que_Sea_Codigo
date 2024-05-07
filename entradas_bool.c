#include <stdio.h>
#include <stdbool.h>
bool pedir_booleano (char a){
    int x;
    printf("Ingresa el valor de verdad de la variable %c 0 False, 1 True",a);
    scanf("%d",&x);
    x == 1;
    return x;
}

void imprimir_booleano (bool x){
    printf("El valor de verdad de la variable es: %s ",x? "Verdadero": "Falso");
}
int main()
{
    bool c;
    char name;
    printf("Ingresa un caracter");
    scanf("%c",&name);
    c = pedir_booleano(name);
    imprimir_booleano(c);
    return 0;
}
