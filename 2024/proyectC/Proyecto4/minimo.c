#include <stdio.h>
#include <assert.h>

int pInt(char c,int x){
    printf("Dame un valor para %c:\n",c);
    scanf("%d",&x);
    return x;
    }

int main()
{
    int x,y;
    x = pInt('x',x);
    y = pInt('y',y);
    if (x<y)
    {
        printf("El valor mínimo es %d\n",x);
    }
    else
    {
        printf("El valor mínimo es %d\n",y);
    }
    assert(x!=y);    
    return 0;
}
