
//Esta funcion va mostrando los estados de cada variable y también las opera y muestra los resultados

int main(void)
{
    int x, y, z, b, w;
    printf("Valor de x : \n");
    scanf("%d",&x);
    printf("Valor de y : \n");
    scanf("%d",&y);
    printf("Valor de z : \n");
    scanf("%d",&z);
    printf("Valor de b : \n");
    scanf("%d",&b);
    printf("Valor de w : \n");
    scanf("%d",&w);
    printf("x mod 4 == 0  = %d\n",x % 4 == 0);
    printf("x + y == 0 && y - x == (-1) * z = %d\n",x + y == 0 && y - x == (-1) * z);
    printf("not b && w = %d\n",not b && w);
    return 0;
}

// Valor de x : 
// 4
// Valor de y : 
// -4
// Valor de z : 
// 8
// Valor de b : 
// 1
// Valor de w : 
// 0
// x mod 4 == 0  = 1
// x + y == 0 && y - x == (-1) * z = 1
// not b && w = 1