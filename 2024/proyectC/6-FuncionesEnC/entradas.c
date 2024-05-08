#include <stdio.h>
//Pedimos el entero colocando como parámetro su nombre
int pedir_entero(char o){
    int x;
    printf("Coloque valor a la variable '%c' :\n",o);
    scanf("%d",&x);
    return x;
}

//Lo devolvemos por pantalla con una función que recibe el nombre y el valor

void imprimir_entero(char a,int x){
    printf("El valor de la variable '%c' es %d\n", a,x);
}


int main()
{
    int b;
    char name;
    name = 'A';
    b = pedir_entero(name);
    imprimir_entero(name,b);
    return 0;
}