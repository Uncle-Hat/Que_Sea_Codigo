#include <stdio.h>

//Coloco un valor a i, mientras i sea diferente a cero, i se iguala a cero.

int main()
{
    int i;
    printf("i -> ");
    scanf("%d",&i);
    printf("c0: i -> %d \n",i);
    while (i!=0)
    {
        printf("c1: i -> %d \n",i);
        i = 0;
        printf("c2: i -> %d \n",i);
    }
    printf("c3: i -> %d ",i);
    return 0;
}