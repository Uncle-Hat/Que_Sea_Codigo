#include <stdio.h>
int main(void)
{
    int x,y,i;
    printf("x -> ");
    scanf("%d",&x);
    printf("y -> ");
    scanf("%d",&y);
    printf("i -> ");
    scanf("%d",&i);
    printf("c0 : ( x -> %d , y -> %d , i -> %d )",x,y,i);
    i=0;
    while (x>=y)
    {
        x = x - y;
        i = i + 1;
        printf("\nc1 : ( x -> %d , y -> %d , i -> %d )",x,y,i);
    }
    return 0;
}
// x -> 13
// y -> 3
// i -> 0
// c0 : ( x -> 13 , y -> 3 , i -> 0 )
// c1 : ( x -> 10 , y -> 3 , i -> 1 )
// c1' : ( x -> 7 , y -> 3 , i -> 2 )
// c1'' : ( x -> 4 , y -> 3 , i -> 3 )
// c1''' : ( x -> 1 , y -> 3 , i -> 4 )