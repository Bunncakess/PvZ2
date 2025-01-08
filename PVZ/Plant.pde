class Sun{ //not sunflower plant

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

}

class Peashooter{
    //Peashooter();
}
