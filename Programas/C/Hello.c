#include <stdio.h>
int main(){
    char a = 'c';                   //Single character %c
    char b[] = "Bro";               //Array of characters %s
    float c = 3.141592;             //4 bytes (32 of precision) %f
    double d = 3.141592653589793;   // 8 Bytes (64 bits of precision) %lf
    bool e = true;                  //1 byte (true or false) %d
    char f = 120;                   //1 byte (-129 to +127) %
    printf("hello %lf",d);
    return 0;
}