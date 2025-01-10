PImage nzombie;

class Zombie1{
    int moveX = 10; // speed
    int posX = 875; //position for X level
    int [] ZombieLanes = {25, 105, 190, 275, 360}; //positions for Y level
    int RandomLane = ZombieLanes[int(random(ZombieLanes.length))];

    void Zombie1(){
        nzombie = loadImage("Zombie1.png");
    }


    void update(){
        if (posX < 200){
            posX -= moveX;
        }
    }
    void display(){
        image(nzombie, posX, RandomLane);
    }
}