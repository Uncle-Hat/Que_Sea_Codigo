/*
Debugging Utiliza GDB o printf como ayuda y encontra valores para las variables que
forman el estado:
(x→ , y→ , z→ , b→ , w→ )
de manera que las siguientes expresiones tengan el valor indicado:
Expresion Valor
                        x % 4 == 0 |True
   x + y == 0 && y - x == (-1) * z |True
                        not b && w |False
Podes cambiar el programa hecho en el ejercicio anterior, agregando las nuevas expresiones
booleanas.
*/

#include <stdio.h>
#include <stdbool.h>

int main()
{
    int x, y, z;
    printf("Ingrese el valor de x en enteros\n");
    scanf("%d", &x);
    printf("Ingrese el valor de y en enteros\n");
    scanf("%d", &y);
    printf("Ingrese el valor de z en enteros\n");
    scanf("%d", &z);
    int b, w;
    printf("Ingrese el valor de b en booleanos (0 False, 1 True)\n");
    scanf("%d", &b);
    printf("Ingrese el valor de w en booleanos (0 False, 1 True)\n");
    scanf("%d", &w);

    bool bol1, bol2, bol3;

    if (x % 4 == 0)
    {
        bol1 = true;
    }
    else
    {
        bol1 = false;
    }
    if (x + y == 0 && y - x == (-1) * z)
    {
        bol2 = true;
    }
    else
    {
        bol2 = false;
    }
    if (!b && w)
    {
        bol3 = true;
    }
    else
    {
        bol3 = false;
    }

    printf("Los resultados son: \n%d\n%d\n%d\n", bol1, bol2, bol3);

    return 0;
}

// Ingrese el valor de x en enteros
// 4
// Ingrese el valor de y en enteros
// -4
// Ingrese el valor de z en enteros
// 8
// Ingrese el valor de b en booleanos (0 False, 1 True)
// 1
// Ingrese el valor de w en booleanos (0 False, 1 True)
// 0
// Los resultados son:
// 1
// 1
// 0
