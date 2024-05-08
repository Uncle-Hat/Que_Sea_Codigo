#include <stdio.h>
//Solicita enteris
int pedir_entero(char a){
    int x;
    printf("Coloque valor a la variable '%c' :\n",a);
    scanf("%d",&x);
    return x;
}
//Imprime enteros
void imprimir_entero(char a,int x){
    printf("El valor de la variables '%c' es %d\n", a,x);
}
//Funcion auxiliar que imprime todos los estados de las variables por pantalla (Auxiliar)
void verestado(int a,int b, int c, int d){
    imprimir_entero('x',a);
    imprimir_entero('y',b);
    imprimir_entero('m',c);
    imprimir_entero('z',d);
}
int main()
{
    int x,y,z,m;
    x = pedir_entero('x');
    y = pedir_entero('y');
    z = pedir_entero('z');
    m = pedir_entero('m');
    printf("El valor de las variables en el estado 0 es:\n");
    verestado(x,y,z,m);
    if (x<m){
      m=x;
    }
    else if (x>=z){
      m=y;
    }
    printf("El valor de las variables en el estado 1 es:\n");
    verestado(x,y,z,m);
    if (m<z){

    }
    else if (m>=z){
      m=z;
    }
    printf("El valor de las variables en el estado 2 es:\n");
    verestado(x,y,z,m);
    return 0;
}