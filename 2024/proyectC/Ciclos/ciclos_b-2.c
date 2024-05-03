#include <stdio.h>
int main()
{
    int x,y;
    bool res;
    printf("x -> ");
    scanf("%d\n",&x);
    printf("y -> ");
    scanf("%d\n",&y);
    printf("c0 : ( x -> %d, y -> %ds, res -> %d )",x,y,res);
    i=0;
    res = True;
    while ((i<x)&&res)
    {
        res = res && ((x % i)!=0);
        i = i+1;
        printf("c1 : ( x -> %d , y -> %d , z -> %d )",x,y,z);
        }
    return 0;
}
