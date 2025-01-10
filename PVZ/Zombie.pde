PImage nzombie;

class Zombie1{
    int posX, moveX, posY;
    
    int [] ZombieLanes = new int[5];
    ZombieLanes [0] = 20;
    ZombieLanes [1] = 105;
    ZombieLanes [2] = 190;
    ZombieLanes [3] = 275;
    ZombieLanes [4] = 360;

    int [] RandomLanes = int(random(ZombieLanes.length));

    void Zombie1(){



        nzombie = loadImage("Zombie1.png");
        
    }

    void update(){
    }

    void display(){
        image(nzombie, posX, RandomLanes);
    }
}