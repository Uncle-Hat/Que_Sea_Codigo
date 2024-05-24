#include <stdio.h>
#include <assert.h>

//Tuve que ayudarme con IA para llegar al resultado de este ejercicio, por lo tanto implementé el código y traté de entenderlo

int nesimo_primo(int N) {
    int contador = 0; // Contador para llevar la cuenta de los números primos encontrados
    int numero = 2; // Empezamos buscando desde el número 2

    while (contador < N) {
        int es_primo = 1; // Asumimos que el número es primo

        // Verificamos si el número es primo
        for (int i = 2; i * i <= numero; i++) {
            if (numero % i == 0) {
                es_primo = 0; // No es primo, salimos del ciclo
                break;
            }
        }

        if (es_primo) {
            contador++; // Incrementamos el contador de números primos
        }

        numero++; // Pasamos al siguiente número
    }

    return numero - 1; // Devolvemos el n-ésimo número primo
}

int pInt(char c){
    int res;
    printf("Dame un valor para %c:\n",c);
    scanf("%d",&res);
    return res;
    }

int main()
{
    int n;
    n = pInt('n');
    if(n < 0){
        printf("Error: El valor elegido debe ser positivo\n");
        main();
    }
    else{
        printf("El %d° primo es %d\n",n,nesimo_primo(n));
    }
    return 0;
}
