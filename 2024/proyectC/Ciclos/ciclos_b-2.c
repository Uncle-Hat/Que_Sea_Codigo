#include <stdio.h>
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
//Preguntar por qué si colocás un '\n' en un "%d" funciona mak