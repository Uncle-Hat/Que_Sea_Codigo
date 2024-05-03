#include <stdio.h>

int main()
{
    int x,y,i;
    printf("x -> ");
    scanf("%d\n",&x);
    printf("y -> ");
    scanf("%d\n",&y);
    printf("z -> ");
    scanf("%d\n",&z);
    printf("c0 : ( x -> %d , y -> %d , z -> %d )",x,y,z);
    i=0;
    while (x>=y)
    {
        x=x-y;
        i=i+1;
        printf("c1 : ( x -> %d , y -> %d , z -> %d )",x,y,z);
    }
    
    return 0;
}
