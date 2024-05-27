#include <stdio.h>
#include <assert.h>


void intShow(int x,char a){
    printf("El entero %c es %d\n",a,x);
}

int intInput(char a){
    int x = 0; //Inicializador
    printf("Coloca valor a %c\n",a);
    scanf("%d",&x);
    return x;
}
int main()
{
    int x,y,z,auxX,auxY,auxZ;
    x = intInput('x');
    y = intInput('y');
    z = intInput('z');
    auxX = x;
    auxY = y;
    auxZ = z;

    assert(x == auxX&&y==auxY && z == auxZ && auxZ % 2 != auxY % 2);
    if (x % 2 == 0){
        x = auxY * auxX;
        y = auxY + auxX + auxZ + 1;
        z = 2*auxZ;
    }
    else{
        x = 2 * auxY + x + 1;
        y = auxY + auxX + auxZ;
        z = 2 * auxZ;
    }
    intShow(x,'x');
    intShow(y,'y');
    intShow(z,'z');
    assert(((x+y+z) % 2 == 0 )&&( z == 2* auxZ )&& ((x == auxY * auxX && y == auxY+auxX+auxZ+1)||(x==2*auxY+auxX && y == auxY+auxX+auxZ)));
    return 0;
}
