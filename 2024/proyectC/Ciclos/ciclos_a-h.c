#include <stdio.h>
int main()
{
    int i;
    printf("i -> ");
    scanf("%d",&i);
    printf("c0: i -> %d \n",i);
    while (i!=0)
    {
        printf("c1: i -> %d \n",i);
        i = i-1;
        printf("c2: i -> %d \n",i);
    }
    printf("c3: i -> %d ",i);
    return 0;
}
