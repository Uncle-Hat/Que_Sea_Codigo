#include <stdio.h>
#include <assert.h>
int asignemos(){
    int X = x;
    int Y = y;
    assert(x == X && y == Y);
    x = x+1;
    y = x+y;
    assert(x==X+1 && y == X + Y )
}

int main()
{
    int x,y;
    
    return 0;
}
