<<<<<<< HEAD
class Sun(){
=======
class Sun(){ //not sunflower plant
>>>>>>> 0e142d1683a3f1f317eaa4f1314cd1db89d5662e
    int x, y, r;
    int dx, dy; //speed 
    int cr, cg, cb; //color
    int grav; //gravity

    //constructor
    Sun(int tempx, int tempy, int tempr){
        x = tempx; //set x cord
        y = tempy; //set y cord
        r = tempr; //set the radius
        cr = 255;
        cg = 255;
        cb = 0;
        dy = 1;
        grav = 0;
    }

    void display (){ 
        fill(cr, cg, cb);
        circle(x,y,r*2);
    }
<<<<<<< HEAD
}
=======
}

Class Peashooter(){
    Peashooter()
}
>>>>>>> 0e142d1683a3f1f317eaa4f1314cd1db89d5662e
