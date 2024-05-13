#include <stdio.h>

// En esta función le doy un estado inicial a x, y, e i; luego le asigno a i cero y, si i es menor a x y res es verdadero.


int main(void)
{
    int x,i,res;
    printf("x -> ");
    scanf("%d",&x);
    printf("y -> ");
    scanf("%d",&i);
    printf("res -> ");
    scanf("%d",&res);
    printf("c0 : ( x -> %d, i -> %d, res -> %d )",x,i,res);
    i=2;
    res = 1;
    while ((i<x)&&res)
    {
        res = res && ((x % i)!=0);
        i = i+1;
        printf("\nc1 : ( x -> %d , i -> %d , res -> %d )",x,i,res);
        }
    return 0;
}
// x -> 5
// y -> 0
// res -> 0
// c0 : ( x -> 5, i -> 0, res -> 0 )
// c1 : ( x -> 5 , i -> 3 , res -> 1 )
// c1 : ( x -> 5 , i -> 4 , res -> 1 )
// c1 : ( x -> 5 , i -> 5 , res -> 1 )

//Este programa aumenta el valor de i y cambia el valor de verdad de res

//Preguntar por qué si colocás un '\n' en un "%d" funciona mal