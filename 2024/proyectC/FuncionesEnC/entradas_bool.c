#include <stdio.h>
#include <stdbool.h>
bool pedir_booleano (char a){
    int x;
    printf("Ingresa el valor de verdad de la variable %c 0 False, 1 True",a);
    scanf("%d",&x);
    return (x==1);
}

void imprimir_booleano (bool x){
    if (x)
    {
        x = 'V';
    }
    else
    {
        x = 'F';
    }
    
    printf("El valor de verdad de la variable es: %c ",x);
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