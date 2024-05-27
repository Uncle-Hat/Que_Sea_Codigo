#include <stdio.h>
#include <stdbool.h>

struct lienzo {
int l1;
int l2;
int l3;
int l4;
};

struct tipo_lienzo {
bool es_figura;
bool es_paisajes;
bool ninguno_anteriores;
};

struct tipo_lienzo verificar_lienzo(struct lienzo t){
    struct tipo_lienzo res = {false,false,false};
    if(t.l1==t.l2==t.l3==t.l4){
        res.es_figura = true;
    }
    else if(t.l1==t.l3&&t.l2==t.l4&&t.l1!=t.l2){
        res.es_paisajes = true;
    }
    else{
        res.ninguno_anteriores = true;
    }
    return res;
}
int intInput(char a){
    int x = 0; //Inicializador
    printf("Coloca valor a %c\n",a);
    scanf("%d",&x);
    return x;
}

int main(){
    struct lienzo var;
    printf("Siendo los números el lado al que se le asigna cada valor:\n");
    var.l1 = intInput('1');
    var.l2 = intInput('2');
    var.l3 = intInput('3');
    var.l4 = intInput('4');
    struct tipo_lienzo result = verificar_lienzo(var);
    printf("es figura? = %d\n",result.es_figura);
    printf("es paisajes? = %d\n",result.es_paisajes);
    printf("es ninguno de los anteriores? = %d\n",result.ninguno_anteriores);
    return 0;
}