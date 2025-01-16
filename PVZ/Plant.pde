PImage smile, doja, trump, burret; //smile = sunflower, doja = peashooter, trump = wallnut, burret = peaball
class Sunflower{


    Sunflower(){
        smile = loadImage("SunflowerPlant.png");
    }
    void display(int x, int y){
        smile.resize(47,74);
        image (smile, x, y);
        
    }
}

class WallNut{
    WallNut(){
        trump = loadImage("WallNut.png");
    }
    void display(int x, int y){
        trump.resize(47,74);
        image (trump, x, y);
        
    }
}

class PeaShooter{ 

    PeaShooter(){
        doja = loadImage("peashooter.png");
    }

    void display(int x, int y){
        doja.resize(47,74);
        image (doja, x, y);
        
    }
    void shoot(){
        // PeaBall newPea = new PeaBall();
        // peaBalls.add(newPea);
    }

    void update(){
        // for (int i = peaBalls.size() - 1; i >= 0; i--) {
        //     PeaBall pea = peaBalls.get(i);
        //     pea.update(); 
        //     pea.display(); 

            
        //     if (pea.posX > width) {
        //         peaBalls.remove(i);
        //     }
        // }
    }
}


class PeaBall{

    // float speed = 5;    // Speed of the pea
    // int damage = 50;    // Damage dealt by the pea ball

    PeaBall(){
        burret = loadImage("PeaBall.png");
    }

    void update() {
        // posX += speed;  // Move the pea ball to the right
    }

    void display(int x, int y) {
        image(burret, x, y); // Display the pea ball (use burret image)
    }

}
