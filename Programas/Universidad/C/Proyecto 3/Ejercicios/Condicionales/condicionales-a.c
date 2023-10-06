/* e) Var x, y : Int;
[σ0 : (x → 3, y → 1)]
if x ≥ y →
[σ1:  . . . ] 
x := 0
[σ2:  . . . ] 
x ≤ y →
[σ'1:  . . .]
x := 2
[σ'2:  . . .]
fi
[σ3:  . . . ]  */



#include <stdio.h>
int main(void){
    int x, y;
    printf("Dale valor a x\n");
    scanf("%d",&x);
    printf("Dale valor a y\n");
    scanf("%d",&y);
    printf("Los valores colocados son x: %d y: %d\n",x,y);
    if (x>=y)
    {
        x=0;
        printf("El valor de x es mayor o igual al valor de y, por lo tanto transformamos a x en %d\n",x);
    }
    else{
        x=2;
        printf("El valor de y es mayor al valor de x, por lo tanto transformamos a x en %d\n",x);
    }
}
/* 
Dale valor a x
3
Dale valor a y
1    
Los valores colocados son x: 3 y: 1
El valor de x es mayor o igual al valor de y, por lo tanto transformamos a x en 0
*/