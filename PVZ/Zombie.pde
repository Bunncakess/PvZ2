PImage nzombie;

class Zombie1{
    int posX, moveX, posY;
    int [] ZombieLanes = new int[5];

    void Zombie1(){
        ZombieLanes [0] = 20;
        ZombieLanes [1] = 105;
        ZombieLanes [2] = 190;
        ZombieLanes [3] = 275;
        ZombieLanes [4] = 360;

        moveX = 20;
        posX = 800;
        posY = 20;

        nzombie = loadImage("Zombie1.png");
        
        
      
    }

    void update(){
        while (posX < 100){
            posX -= moveX; 
        }
        
    }

    void display(){
        image(nzombie, posX, ZombieLanes [0]);
    }
}