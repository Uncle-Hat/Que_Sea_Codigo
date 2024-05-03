#include <stdio.h>

int main(void)
{
    int x,y;
    printf("c0 : x -> ");
    scanf("%d",&x);
    printf("\nc0 : y -> ");
    scanf("%d",&y);
    if (x>=y)
    {
        printf("c1 : (x -> %d , y -> %d)\n",x,y);
        x=0;
        printf("c2 : (x -> %d , y -> %d)\n",x,y);
    }
    else if (x<=y){
        printf("c1' : (x -> %d , y -> %d)\n",x,y);
        x=2;
        printf("c2' : (x -> %d , y -> %d)\n",x,y);
        printf("c3' : (x -> %d , y -> %d)\n",x,y);
    };
    return 0;
}

// c0 : x -> -100
// c0 : y -> 1
// c1' : (x -> -100 , y -> 1)
// c2' : (x -> 2 , y -> 1)
// c3' : (x -> 2 , y -> 1)