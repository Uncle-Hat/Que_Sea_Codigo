#include <stdio.h>
int main(void)
{
    int x, y;
    printf("Colocar valor x:\n");
    scanf("%d", &x);
    printf("Colocar valor y:\n");
    scanf("%d", &y);
    printf("Estado 0 x=%d, y=%d\n", x, y);
    if (x >= y)
    {
        printf("Estado 1 x=%d, y=%d\n", x, y);
            x = 0;
        printf("Estado 2 x=%d, y=%d\n", x, y);
    }
    else if (x <= y)
    {
        printf("Estado 1' x=%d, y=%d\n", x, y);
            x = 2;
        printf("Estado 2' x=%d, y=%d\n", x, y);
    }
        printf("Estado 3 x=%d, y=%d\n", x, y);
}

/*
Colocar valor x:
3
Colocar valor y:
1
Estado 0 x=3, y=1
Estado 1 x=3, y=1
Estado 2 x=0, y=1
Estado 3 x=0, y=1
*/