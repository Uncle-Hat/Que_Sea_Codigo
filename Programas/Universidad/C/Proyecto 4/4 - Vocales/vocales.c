#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

bool es_vocal(char letra){
char vocales[10] = {'a','e','i','o','u','A','E','I','O','U'};
int x = 0;
while (x < sizeof(vocales))
{
if(vocales[x] == letra){
    printf("es vocal\n");
    return true;
}
x = x+1;
}
    return false;
    //printf("sumado :  %d\n", letra);
}
int main(void)
{
    char n;
    printf("ingrese una letra: \n");
    scanf("%c", &n);
    es_vocal(n);
    return 0;
}