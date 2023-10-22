#include <stdio.h>
#include <assert.h>

int pedirvalor(int n){
    scanf("%d",&n);
    return n;
}

int valorabsoluto(int n){
    assert (n<0);
        n = (-1)*n;
    return n;
}

int main(void)
{
    int n, nmod;
    printf("¿De que numero deseas obtener el valor absoluto?:\n");
    n = pedirvalor(n);
    nmod = valorabsoluto(n);
    printf("El valor absoluto del valor ingresado es: %d\n",nmod);
    return 0;
}

/* 
¿De que numero deseas obtener el valor absoluto?:
-1425
El valor absoluto del valor ingresado es: 1425
*/