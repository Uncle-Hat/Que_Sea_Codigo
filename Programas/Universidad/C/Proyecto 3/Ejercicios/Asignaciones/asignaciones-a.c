/*Traducı al lenguaje C los programas 1.a, 1.b y 1.c del practico que se encuentra en este
enlace. Esos programas estan escritos en un pseudocodigo de la materia y la traduccion a C
no siempre es directa.
El estado σ0 debe solicitarse al usuario utilizando el comando scanf(). Luego, ejecute cada
programa 3 veces con diferentes valores de las variables solicitadas y escriba los valores del
estado final resultante en la siguiente tabla: */

/* a) Var x : Int;
[σ0 : (x → 1)]
x := 5
[σ1 : ] */

int main()
{
    int x;
    printf("Dale valor a x\n");
    scanf("%d", &x);
    printf("El valor de x es : %d\n", x);
    x = 5;
    printf("Ahora el valor de x es : %d\n", x);
    return 0;
}

// Dale valor a x
// 1
// El valor de x es : 1
// Ahora el valor de x es : 5
