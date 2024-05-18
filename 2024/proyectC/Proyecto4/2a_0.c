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
    int x,y,aux_x,aux_y;
    x = pInt('x');
    y = pInt('y');
    aux_x = x;
    aux_y = y;
    assert(x==aux_x&&y==aux_y);
    x = aux_x+1;
    y = aux_x+aux_y;
    assert((x==aux_x+1)&&(y == aux_x+aux_y));
    return 0;
}
