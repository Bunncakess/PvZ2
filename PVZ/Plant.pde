class Sun { //not sunflower plant

}
PImage smile, doja;
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


class Pea{
    
    Pea(){

    }

    void display(){

    }

    void update(){

    }
    
    void ifhit(){

    }
}