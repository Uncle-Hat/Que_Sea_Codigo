#include <stdio.h>
#include <stdbool.h>
int main(void)
{
    int i, x, res;
    printf("Colocale un valor tipo int a x :\n");
    scanf("%d", &x);
    printf("Colocale un valor tipo int a i :\n");
    scanf("%d", &i);
    printf("Colocale un valor tipo bool (0-False,1-True) a res :\n");
    scanf("%d", &res);
    printf("Estado 0 x=%d,i=%d,res=%d\n", x, i, res);
    i = 2;
    res = true;
    int est;
    est = 1;
    do
    {
        res = res && (x % i != 0);
        i = i + 1;
        printf("Estado iteracion N°:'%d' x=%d,i=%d,res=%d\n", est, x, i, res);
        est = est + 1;
    } while (i < x && true);
    printf("El valor final de i es : %d\n", i);
    return 0;
}
/*

Colocale un valor tipo int a x :
5
Colocale un valor tipo int a i :
0
Colocale un valor tipo bool (0-False,1-True) a res :
0
Estado 0 x=5,i=0,res=0
Estado iteracion N°:'1' x=5,i=3,res=1
Estado iteracion N°:'2' x=5,i=4,res=1
Estado iteracion N°:'3' x=5,i=5,res=1
El valor final de i es : 5

3) La función revisa coloca a res en true a i en dos y en el bucle lo que hace es comprobar que
i sea menor que el valor dfe res y i, luego a res le cambia el valor a res y la división entre x e i debe ser distinta de cero
tras eso itera la i hasta romper el bucle que es cuando deja de cumplir i<x&&true
*/