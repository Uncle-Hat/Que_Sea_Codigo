#include <stdio.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdbool.h>
bool pedir_booleano (char a){
    int x;
    printf("Ingresa el valor de verdad de la variable %c (0 False, 1 True)\n",a);
    scanf("%d",&x);
    x = x == 1;
    return x;
}

void imprimir_booleano (bool x){
    char valor;
    if (x)
    {
        valor = 'V';
    }
    else
    {
        valor = 'F';
    }
    printf("El valor de verdad de la variable es... %c\n",valor);
}
int main()
{
    bool c;
    char name;
    printf("Ingresa un caracter:\n");
    scanf("%c",&name);
    c = pedir_booleano(name);
    imprimir_booleano(c);
    return 0;
}
