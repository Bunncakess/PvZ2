PImage nzombie;

class Zombie1{
    int private x;
    int private y;
    int private z;

    void Zombie1(int tempx, int tempy, int tempz){
        
    }

    void display(){
        nzombie = loadImage("zombie1.png");
        image(nzombie, x, y);

    }
}