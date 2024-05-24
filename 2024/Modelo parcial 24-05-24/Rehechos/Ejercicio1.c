#include <stdio.h>
#include <assert.h>

struct info_t {
int op_sum; // Guarda la suma
int op_mul; // Guarda la multiplicación
int op_div; // Guarda la división entera
int op_dist; // Guarda el valor absoluto de la resta
};

int abs (int a){
    if (a<0)
    {
        return a;
    }
    else {
        return -a;
    }
}

struct info_t operar(int x, int y){
    struct info_t res = {0,0,0,0};
    res.op_sum = x + y;
    res.op_mul = x*y;
    res.op_div = x/y;
    res.op_dist = abs(x-y);   
    return res;
}

int main()
{
    int a,b;
    printf("Coloca valor a a\n");
    scanf("%d",&a);
    printf("Coloca valor a b\n");
    scanf("%d",&b);
    assert(a>0&&b>0&&a>b);
    struct info_t result = operar(a,b);
    printf("suma = %d\n",result.op_sum);
    printf("multiplicacion = %d\n",result.op_mul);
    printf("division = %d\n",result.op_div);
    printf("distancia = %d\n",result.op_dist);
    return 0;
}
