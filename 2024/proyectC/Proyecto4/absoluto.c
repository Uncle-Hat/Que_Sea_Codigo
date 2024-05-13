#include <stdio.h>
#include <assert.h>
int pInt(char c,int x){
    printf("Dame un valor para %c:\n",c);
    scanf("%d",&x);
    return x;
    }

int main()
{
    int x = pInt('x',x);
    if (x<0)
    {
        x = -1*x;
    }
    else {
        x = x;
    }
    printf("%d = x\n",x);
    assert(x>=0);
    return 0;
}