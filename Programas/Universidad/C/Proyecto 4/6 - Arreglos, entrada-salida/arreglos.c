/*
(Arreglos, entrada-salida) 
Escribir un programa que solicite el ingreso de un arreglo de enteros int a[] y luego imprime por pantalla.
El programa debe utilizar dos nuevas funciones además de la función main:

una que dado un tamaño máximo de arreglo y el arreglo, solicita los valores para el
arreglo y los devuelve, guardándolos en el mismo arreglo int a[]; función con prototipo
(también conocido como signatura o firma):
void pedir_arreglo(int n_max, int a[])

otra que imprime cada uno de los valores del arreglo int a[], de prototipo:
void imprimir_arreglo(int n_max, int a[]) 
*/

void pedir_arreglo(int n_max, int a[]) {
    printf("Ingrese los valores del arreglo:\n");
    for (int i = 0; i < n_max; i++) 
    {
        printf("a[%d] = ", i);
        scanf("%d", &a[i]);
    }
}

void imprimir_arreglo(int n_max, int a[]) {
    for (int i = 0; i < n_max; i++) //Declaración de i = 0, empieza a sumar uno hasta que llega al n_max
    {
        printf("%d ", a[i]);
    }
    printf("\n");
}

int main() {
    int n_max;
    
    printf("Ingrese el tamaño máximo del arreglo: ");
    scanf("%d", &n_max);
    
    int a[n_max];
    
    pedir_arreglo(n_max, a);
    
    printf("Valores del arreglo:\n");
    imprimir_arreglo(n_max, a);
    
    return 0;
}