#include <stdio.h>

int main(void)
{
    int x,y;
    printf("c0 : x = ");
    scanf("%d",&x);
    printf("c0 : y = ");
    scanf("%d",&y);
    x = x+y;
    printf("c1 : (x->%d y->%d)\n",x,y);
    y = y+y;
    printf("c2 : (x->%d y->%d)\n",x,y);
    return 0;
}

// c0 : x = 1
// c0 : y = 2
// c1 : (x->3 y->2)
// c2 : (x->3 y->4)

// c0 : x = 5
// c0 : y = 8
// c1 : (x->13 y->8)
// c2 : (x->13 y->16)

// c0 : x = 1
// c0 : y = 5
// c1 : (x->6 y->5)
// c2 : (x->6 y->10)