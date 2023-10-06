/* c) Var x, y : Int;
[σ0 : (x → 2, y → 5)]
y := y + y;
[σ1 : ]
x := x + y
[σ2 : ] */

int main()
{
    int x,y;
    printf("Dale un valor a 'x'\n");
    scanf("%d", &x);
    printf("Dale un valor a 'y'\n");
    scanf("%d", &y);
        y = y + y;
    printf("El valor de y ahora es: %d\n", y);
        x = x + y;
    printf("El valor de x ahora es: %d\n", x);
}

/*Dale un valor a 'x'
2
Dale un valor a 'y'
5
El valor de y ahora es: 10
El valor de x ahora es: 12*/