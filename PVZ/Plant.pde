class Sun { //not sunflower plant

}

class Sunflower{
}

//ArrayList<Pea> PeaShooters = new ArrayList<Pea>(); //for unlimited amount to place

//draw

class PeaShooter{
    int x, y, r;
    int dx, dy; //speed
    boolean tempcold; //if the ball slows or not
    //if see zombie, shoot ball
   // if (posX  <= 10)
       // pea.shoot;
    
    Pea(int tempx, int tempy, int tempr, boolean tempcold){
        x = tempx;
        y = tempy;
        r = tempr;

        freeze = tempcold;
    }

    void shoot(){
        y = y + dy; 
        
    }

}
