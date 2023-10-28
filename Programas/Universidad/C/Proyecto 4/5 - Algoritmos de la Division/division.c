/*
Las estructuras son utilizadas en las soluciones de algunos problemas donde es necesario agrupar datos de diferentes tipos.
También pueden ser utilizadas para manejar datos que serían muy dificiles de describir en tipos de datos primitivos.
*/
// Obs: Se parece a una tupla

/*
Esta función recibe dos enteros no negativos (divisor no nulo) y devuelve el cociente junto
con el resto de la división entera. En la función main pedir al usuario los dos números enteros,
imprimir un mensaje de error si el divisor es cero, o imprimir tanto el cociente como el resto
en otro caso.
*/
// Se utiliza para agrupar diferentes valores de acuerdo a lo que se necesite.

#include <stdio.h>
#include <assert.h>

struct div_t
{
    int cociente;
    int resto;
};

struct div_t division(int nim, int dav)
{
    assert(dav != 0);

    struct div_t result;
    result.cociente = nim / dav;
    result.resto = nim % dav;

    return result;
}

int pedirvalor(char namevar)
{
    int n;
    printf("Coloque el valor de la variable %c\n", namevar);
    scanf("%d", &n);
    return n;
}

int main()
{
    int num, div;
    struct div_t result;
    printf("Coloque un numerador primero y luego el número por el que se divide:\n");
    num = pedirvalor('n');
    assert(num > 0);
    div = pedirvalor('d');
    assert(div > 0);
    result = division(num, div);
    printf("Cociente: %d, Resto: %d\n", result.cociente, result.resto);
    return 0;
}
