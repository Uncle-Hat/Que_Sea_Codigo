#include <stdio.h>
#include <assert.h>

int pedirvalor(int n){
    scanf("%d",&n);
    return n;
}


int revisarmin(int x,int y)
{
    assert (x!=y);
    if (x>y)
    {
        printf("x es mayor que y\n");
    }
    else if (x<y){
        printf("y es mayor que x\n");
    }
    return 0;
}

int main(void)
{
    int x,y;
    printf("|Este programa toma dos valores y los compara, devolviendonos el mínimo entre ellos|\n");
    printf("--Asignele un valor a x\n");
    x = pedirvalor(x);
    printf("--Asignele un valor a y\n");
    y = pedirvalor(y);
    revisarmin(x, y);
    return 0;
}
/* 
|Este programa toma dos valores y los compara, devolviendonos el mínimo entre ellos|
--Asignele un valor a x
65
--Asignele un valor a y
69
y es mayor que x 
*/