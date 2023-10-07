
#include <stdio.h>

int main(void)
{
    int i;
    printf("Colocale un valor a i :\n");
    scanf("%d", &i);
    do
    {
        printf("i:=%d\n", i);
        i = i - 1;
        printf("i:=%d\n", i);
    } while (i != 0);
    return 0;
}

/*
Colocale un valor a i :
4
i:=4
i:=3
i:=3
i:=2
i:=2
i:=1
i:=1
i:=0
*/