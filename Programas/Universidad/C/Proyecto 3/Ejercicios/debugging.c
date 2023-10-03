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

int main(void)
{
    int x, y, z; 
    printf("Ingrese un valor para x tal que x sea un numero par mayor a 4\n");
    scanf("%d", &x);
    printf("ingrese un valor para y\n");
    scanf("%d", &y);
    printf("ingrese un valor para z\n");
    scanf("%d", &z);
    printf("%d\n",x % 4 == 0);
    
}
