
PImage smile, doja, trump, chaChing; //smile = sunflower, doja = peashooter, trump = wallnut, chaChing = sun(money)


class Sun{
    int xPos, yPos;
    Sun(){
        chaChing = loadImage("sun.png");
    }
    void display(int x, int y){
        chaChing.resize(47,74);
        image (chaChing, 300, y);
    }

    boolean isMouseOver() {
        return mouseX > xPos && mouseX < xPos + 48 && mouseY > yPos && mouseY < yPos + 62;
    }
    boolean selected = false;
    int money = 0;
    boolean onClick() {
        if (isMouseOver()) {
            selected = true; 
        }
        money++; 
        return selected; //if sun clicked, money goes up
    }
} 

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

class PeaShooter {
    PImage doja;
    ArrayList<PeaBall> peaBalls;

    PeaShooter() {
        doja = loadImage("peashooter.png");
        doja.resize(47, 74);
        peaBalls = new ArrayList<>();
    }

    void display(int x, int y) {
        image(doja, x, y);
    }
   
    void shoot(float x, float y) {
        peaBalls.add(new PeaBall(x, y));
    }

    void update() {
        for (int i = peaBalls.size() - 1; i >= 0; i--) {
            PeaBall pea = peaBalls.get(i);
            pea.update();
            pea.display();

            if (pea.posX > width) { 
                peaBalls.remove(i);
            }
        }
    }
}


class PeaBall {
    PImage burret;
    float posX, posY;
    float speed = 5; // Speed 

    PeaBall(float startX, float startY) {
        burret = loadImage("PeaBall.png");
        burret.resize(20,20);
        posX = startX;
        posY = startY;
    }

    void update() {
        posX += speed; 
    }

    void display() {
        image(burret, posX, posY);
    }
}


//onloy one, sunflower display sun, sun display, lcick