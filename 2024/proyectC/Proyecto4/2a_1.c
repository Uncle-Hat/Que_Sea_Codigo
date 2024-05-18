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
    int x,y,aux_x,aux_y,z,aux_z;
    x = pInt('x');
    y = pInt('y');
    z = pInt('z');
    aux_x = x;
    aux_y = y;
    aux_z = z;
    assert(x==aux_x&&y==aux_y&&z==aux_z);
    x = aux_y;
    y = aux_x + aux_y + aux_z;
    z = aux_y + aux_x;
    assert((x==aux_y)&&(y == aux_y+aux_x+aux_z)&&(z == aux_y + aux_x));
    return 0;
}