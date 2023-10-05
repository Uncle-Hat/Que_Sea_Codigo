/* Var x, y : Int;
[σ0 : (x → 2, y → 5)]
x := x + y;
[σ1 : ]
y := y + y
[σ2 : ] */

int main()
{
    int x, y;
    printf("Colocale un valor a x\n");
    scanf("%d", &x);
    printf("Colocale un valor a y\n");
    scanf("%d", &y);
    x = x + y;
    printf("El valor de x ahora es %d\n", x);
    y = y + y;
    printf("El valor de y ahora es %d\n", y);
}

// Colocale un valor a x
// 2
// Colocale un valor a y
// 5
// El valor de x ahora es 7
// El valor de y ahora es 10