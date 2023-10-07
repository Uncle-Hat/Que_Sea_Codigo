
#include <stdio.h>

int main(void)
{
    int i;
    printf("Colocale un valor a i :\n");
    scanf("%d", &i);
    do
    {
        printf("i:=%d\n", i);
        i = 0;
        printf("i:=%d\n", i);
    } while (i != 0);
    printf("El valor final de i es : %d\n", i);
    return 0;
}

/*
Colocale un valor a i :
5
i:=5
i:=0
El valor final de i es : 0
*/