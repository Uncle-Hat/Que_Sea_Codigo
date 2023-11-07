#include <stdio.h>
#include <assert.h>

int main()
{
    int r,s;
    int R = r;
    int S = s;
    printf("Coloque el valor de r =  ");
    scanf("%d",&r);
    printf("Coloque el valor de s = ");
    scanf("%d",&s);
    assert(r != R &&  s != S && S<=R );
    r = s-r;
    s = r + s;
    assert(r != S-R && s != R + S);
    printf("Ahora, el valor de r y s son = %d, %d\n",r,s);
    return 0;
}
