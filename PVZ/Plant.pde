float posX = 220;
class Sun { //not sunflower plant

}
PImage smile, doja, burret;
class Sunflower{


    Sunflower(){
        smile = loadImage("SunflowerPlant.png");
    }
    void display(int x, int y){
        smile.resize(47,74);
        image (smile, x, y);
        
    }
}

class PeaShooter{ 
    PeaShooter(){
        doja = loadImage("Peashooter.png");
    }
    void display(int x, int y){
        doja.resize(47,74);
        image (doja, x, y);
        
    }
    void shoot(){
        if (posX <= 800)
    }

    void display(){
        burret = loadImage("PeaBall.png")

    }

    void update(){

    }
    
    void ifHit(){

    }
}
// //ArrayList<Pea> PeaShooters = new ArrayList<Pea>(); //for unlimited amount to place

// //draw

// class PeaShooter{
//     int x, y, r;
//     int dx, dy; //speed
//     boolean tempcold; //if the ball slows or not
//     //if see zombie, shoot ball
//    // if (posX  <= 10)
//        // pea.shoot;
    
//     Pea(int tempx, int tempy, int tempr, boolean tempcold){
//         x = tempx;
//         y = tempy;
//         r = tempr;

//         freeze = tempcold;
//     }

//     void shoot(){
//         y = y + dy; 
        
//     }

// }


