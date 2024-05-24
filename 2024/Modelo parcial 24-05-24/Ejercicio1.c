#include <stdio.h>
#include <assert.h>

struct info_t {
    int op_sum; // Guarda la suma
    int op_mul; // Guarda la multiplicación
    int op_div; // Guarda la división entera
    int op_dist; // Guarda el valor absoluto de la resta
};

struct info_t operar(int x, int y){
    struct info_t res = {0,0,0,0};
    res.op_sum = x+y;
    res.op_mul = x*y;
    res.op_div =  x/y;
    if (x<y)
    {
        res.op_dist = -(x-y);
    }
    else{
        res.op_dist = x-y;
    }
    return res;
}

int main()
{
    int a,b;
    printf("Valor a\n");
    scanf("%d",&a);
    printf("Valor b\n");
    scanf("%d",&b);
    assert(a>0&&b>0&&a>b);
    struct info_t resultado = operar(a,b);
    printf("la suma es = %d\n",resultado.op_sum);
    printf("la multiplicacion es = %d\n",resultado.op_mul);
    printf("la division es = %d\n",resultado.op_div);
    printf("la distancia es = %d\n",resultado.op_dist);
    return 0;
}
// la suma es = 15
// la multiplicacion es = 50
// la division es = 2
// la distancia es = 5

// Valor a
// 5
// Valor b
// 0
// ModParc: ModeloParcial.c:33: main: Assertion `a>0&&b>0&&a>b' failed.
// Aborted