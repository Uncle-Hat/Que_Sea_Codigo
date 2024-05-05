#include <stdio.h>
int pedir_entero(char a){
    int x;
    printf("coloque un valor para la variable %c\n",a);
    scanf("%d",&x);
    return x;
}

void imprimir_entero(int x,char a){
    printf("El valor de '%c' es = %d\n",a,x);
}

int main()
{
    char name;
    printf("Coloca el nombre de la variable\n");
    scanf("%c",&name);
    int j = pedir_entero(name);
    imprimir_entero(j,name);
    return 0;
}
