#include <stdio.h>
#include <assert.h>

struct div_t {
    int cociente;
    int resto;
};
struct div_t division(int x, int y)
{
    struct div_t result; //Dentro de la función, creando una función interna, declaramos la estructura y le damos un nombre
    result.resto = x % y;
    result.cociente = x / y;
    return result; //Devolvemos estos datos múltiples
};

int pInt(char c){
    int res;
    printf("Dame un valor para %c:\n",c);
    scanf("%d",&res);
    return res;
    }

int main()
{
    int x,y; //x divisor, y dividendo
    x = pInt('x');
    y = pInt('y');
    assert(y!=0);
    struct div_t resultado = division(x,y); //'1
    //Devolvemos los números ya que el divisor no es cero
    printf("Cociente: %d\n",resultado.cociente);
    printf("Resto : %d\n",resultado.resto);
    return 0;
}

/*
A la hora de utilizar un arreglo deberemos crear una variable
Que contenga su nombre y utilizar, para llamar sus partes el '.'
*/