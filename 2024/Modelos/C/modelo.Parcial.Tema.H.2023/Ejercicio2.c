#include <stdio.h>
#include <assert.h>

int intInput(char a){
    int x = 0; //Inicializador
    printf("Coloca valor a %c\n",a);
    scanf("%d",&x);
    return x;
}
void intShow(int x,char a){
    printf("El entero %c es %d\n",a,x);
}

int main()
{
    int x,y,z; //Declaro variables tipo int
    x = intInput('x');
    y = intInput('y');
    z = intInput('z');
    int auxx = x;
    int auxy = y;
    int auxz = z;
    assert((x==auxx)&&(y==auxy)&&(z==auxz)&&(auxx>0)&&(auxz>0));
    if (x>=z)
    {
        x = auxy + auxz;
        y = auxx + auxz;
        z = auxx + auxy;
    }
    else if (x<z){
        x = auxy;
        y = auxz;
        z = auxx;
    }
    assert(
        (
            (auxx>=auxz)
            &&
        ((x==auxx+auxz) 
        && 
        (y == auxx + auxz) 
        && 
        (z == auxx + auxy)
        )
        )
        ||
        (auxx<auxz && 
        (x==auxy 
        &&
        y == auxz 
        &&
        z ==auxx)
        )
        );
        intShow(x,'x');
        intShow(y,'y');
        intShow(z,'z');
    return 0;
}
