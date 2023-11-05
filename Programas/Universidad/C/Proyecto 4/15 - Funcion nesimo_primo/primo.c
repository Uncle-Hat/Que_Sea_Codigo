/*
(Función nesimo primo) En un archivo nuevo primo.c hacer una función
int nesimo_primo(int N) que devuelve el n-ésimo primo.

a) En la función main pedir al usuario que ingrese el entero n, si es negativo imprimir un
mensaje de error, y si es no negativo imprimir el resultado devuelto por nesimo_primo.

b) Modificar la función main, para que al ingresar un valor negativo, solicite un nuevo
valor hasta que se ingrese un n no negativo.

*/
#include <stdio.h>
#include <stdbool.h>

bool es_primo(int numero) {
    if (numero <= 1) {
        return false;
    }
    for (int i = 2; i * i <= numero; i++) {
        if (numero % i == 0) {
            return false;
        }
    }
    return true;
}

int nesimo_primo(int N) {
    int contador = 0;
    int numero = 2;

    while (contador < N) {
        if (es_primo(numero)) {
            contador++;
        }
        numero++;
    }

    return numero - 1; // Restamos 1 porque hemos aumentado "numero" des.pués de encontrar el enésimo primo.
}

int main() {
    int n;

    do {
        printf("Ingrese un número positivo (n): ");
        scanf("%d", &n);

        if (n < 0) {
            printf("El valor de n debe ser no negativo. Intente de nuevo.\n");
        }
    } while (n < 0);

    int primo = nesimo_primo(n);
    printf("El %d-ésimo número primo es: %d\n", n, primo);

    return 0;
}
