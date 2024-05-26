#include <stdio.h>
#include <stdbool.h>

int cube(int a){
    res = 0;
    res = a*a*a;
    return res;
}

int condicion(int a[],int N){
    int x = 0;
    int i = 0;
    while (i<tam)
    {
    if((cube(x)+x)>=N){ 
        return x;
        break;
    }
    x++;
    i++;
    }
    return 0;
}

int main(){
    int a,sol,c,N;
    printf("Hasta donde:\n");
    scanf("%d",&N);
    int a[N];
    rellenarhasta(c,N);
    sol = condicion(a,N);
}