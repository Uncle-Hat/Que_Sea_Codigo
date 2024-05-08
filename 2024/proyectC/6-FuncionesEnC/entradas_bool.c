#include <stdio.h>
#include <stdbool.h>

//Función que pide por pantalla el valor de verdad de una variable booleana

bool pedir_booleano (char a){
    int x;
    printf("Ingresa el valor de verdad de la variable '%c' 0 False, 1 True\n",a);
    scanf("%d",&x);
    return (x==1);
}

//Función que imprime por pantalla el valor de verdad de la variable booleana asociada (Por medio del condicional)

void imprimir_booleano (bool x,char a){
    if(x){
    printf("El valor de verdad de la variable '%c' es: "verdadero" \n",a);
    }
    else{
    printf("El valor de verdad de la variable '%c' es: "falso" \n",a);
    }
}

int main()
{
    bool c;
    char n = 'A';
    c = pedir_booleano(n);
    imprimir_booleano(c,n);
    return 0;
}