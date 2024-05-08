#include <stdio.h>

int main(void)
{
    int x,y;
    printf("c0: x = ");
    scanf("%d",&x);
    printf("c0: y = ");
    scanf("%d",&y);
    x = y + y ;
    printf("c1: (x -> %d, y -> %d)\n",x,y);
    x = x + y ;
    printf("c2: (x -> %d, y -> %d)\n",x,y);
    return 0;
}

// c0: x = 5
// c0: y = 8
// c1: (x -> 16, y -> 8)
// c2: (x -> 24, y -> 8)

// c0: x = 8
// c0: y = 99
// c1: (x -> 198, y -> 99)
// c2: (x -> 297, y -> 99)

// c0: x = 5
// c0: y = 8
// c1: (x -> 16, y -> 8)
// c2: (x -> 24, y -> 8)