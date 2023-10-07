
#include <stdio.h>

int main(void)
{
    int x,y,i;
    printf("Dale valor a x\n");
    scanf("%d",&x);
    printf("Dale valor a  y\n");
    scanf("%d",&y);
    printf("Dale valor a i\n");
    scanf("%d",&i);
    do
    {
        x=x-y;
        i=i+1;
        printf("Iteraciones de estado :\nx=%d, y=%d, i=%d\n",x,y,i);
    } while (x>=y);
}


/* 
Dale valor a x
13
Dale valor a  y
3
Dale valor a i
0
Iteraciones de estado :
x=10, y=3, i=1
Iteraciones de estado :
x=7, y=3, i=2
Iteraciones de estado :
x=4, y=3, i=3
Iteraciones de estado :
x=1, y=3, i=4
*/