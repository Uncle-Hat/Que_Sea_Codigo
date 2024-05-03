#include <stdio.h>

int main()
{
    int x,y,z,m;
    printf("Coloque los valores de:\n");
    printf("x -> ");    
    scanf("%d",&x);
    printf("y -> ");    
    scanf("%d",&y);
    printf("z -> ");    
    scanf("%d",&z);
    printf("m -> ");    
    scanf("%d",&m);
    printf("c0:( x -> %d , y -> %d, z -> %d, m ->%d )\n",x,y,z,m);
    if(x<y){
        m=x;
    }else if (x>=y){
        m=y;
    }
    printf("c1:( x -> %d , y -> %d, z -> %d, m ->%d )\n",x,y,z,m);
    if (m<z){}
    else if (m>=z){
        m=z;
    }
    printf("c2:( x -> %d , y -> %d, z -> %d, m ->%d )\n",x,y,z,m);
    return 0;
}
// Coloque los valores de:
// x -> 5
// y -> 4
// z -> 8
// m -> 0
// c0:( x -> 5 , y -> 4, z -> 8, m ->0 )
// c1:( x -> 5 , y -> 4, z -> 8, m ->4 )
// c2:( x -> 5 , y -> 4, z -> 8, m ->4 )
