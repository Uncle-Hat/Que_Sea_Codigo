#include <stdio.h>
#include <assert.h>

int main()
{
    int r, s;
    printf("Ingrese r = ");
    scanf("%d",&r);
    printf("Ingrese s = ");
    scanf("%d",&s);
    int R = r;
    int S = s;
    printf("Los valores iniciales de r y s son %d y %d\n",r,s);
    assert(r == R && s == S && S > R);
    s = 2 * R - 2 * S;
    r = 2 * R + S;
    assert(s == 2 * R - 2 * S && r == 2 * R + S);
    printf("Los valores finales de r y s son %d y %d\n",r,s);
    return 0;
}