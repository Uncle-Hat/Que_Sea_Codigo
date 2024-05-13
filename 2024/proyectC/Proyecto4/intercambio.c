#include <stdio.h>
#include <assert.h>

int pInt(char c){
    int res;
    printf("Dame un valor para %c:\n",c);
    scanf("%d",&res);
    return res;
    }
int main()
{
    int x,auxx,y,auxy,z,auxz;
    x = pInt('x');
    y = pInt('y');
    z = pInt('z');
    auxx = x;
    auxy = y;
    auxz = z;
    z = auxx;
    x = auxy;
    y = auxz;
    printf("x = %d",x);
    printf(", y = %d",y);
    printf(", z = %d",z);
    assert(z==auxx&&x==auxy&&y==auxz);
    return 0;
}
