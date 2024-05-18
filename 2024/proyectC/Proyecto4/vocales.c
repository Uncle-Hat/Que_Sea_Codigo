#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

bool es_vocal(char letra){
    if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u')
    {
        return true;
    }
    else
    {
        return false;
    }   
}

char pedir_char(){
    char aux;
    printf("Coloca una letra:\n");
    scanf("%c",&aux);
    return aux;
}

int main()
{
    char letra;
    letra = pedir_char();
    if (es_vocal(letra))
    {
        printf("La letra '%c' es una vocal\n",letra);
    }
    else
    {
        printf("La letra '%c' no es una vocal\n",letra);
    }
    return 0;    
}
