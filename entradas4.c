#include <stdio.h>

int pedir_entero(char a){
    int x;
    printf("Coloque valor a la variable '%c' :\n",a);
    scanf("%d",&x);
    return x;
}
void imprimir_entero(char a,int x){
    printf("El valor de las variables '%c' es %d\n", a,x);
}
int main()
{
    int x,y,z,m;
    x = pedir_entero('x');
    y = pedir_entero('y');
    z = pedir_entero('z');
    m = pedir_entero('m');
    imprimir_entero('x',x);
    imprimir_entero('y',y);
    imprimir_entero('m',z);
    imprimir_entero('z',m);
    if (x<m){
      m=x;
    }
    else if (x>=z){
      m=y;
    }
    imprimir_entero('x',x);
    imprimir_entero('y',y);
    imprimir_entero('m',z);
    imprimir_entero('z',m);
    if (m<z){

    }else if ()
    return 0;
}