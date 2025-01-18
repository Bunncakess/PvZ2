
int[] lanes = {105, 190, 275, 360, 445}; // positions for Y level

class Sun {
    float x, y;          // Position of the sun
    float speed;         // Falling speed
    boolean collected;   // To track if the sun is collected
    PImage sunImage;     // Image of the sun
    int tall = lanes[int(random(lanes.length))];
    float spawnTime;
    float duration = 7500; ///every 1000 is 1 sec; the lifespan of the sun
    int value = 2; //SUN VALUE



    Sun(float startX, float startY) {
        x = startX;
        y = startY;
        speed = 0.5;       // Default falling speed
        collected = false;
        sunImage = loadImage("Sun.png"); // Make sure "sun.png" is in the data folder
        spawnTime = millis();
        
    }

    void display() {
        if (!collected) {
            image(sunImage, x, y, 40, 40); // the sun image


        }
    }

    void update() {
        if (!collected) {
            y += speed; // Move the sun downward
            if (y > tall) {
                y = tall;
                
            }

        if (millis() - spawnTime >= duration) {
            collected = true; // Mark the sun as collected after 5 seconds
            }
        }
    }

    boolean isMouseOver() {
        return mouseX > x && mouseX < x + 40 && mouseY > y && mouseY < y + 40;
    }

    void collect() {
        if (isMouseOver() && mousePressed && !collected) {
            collected = true;
            println("Sun collected!");
        }
    }
}

class Sunflower{
    PImage smile; 
    Sunflower(){
        smile = loadImage("SunflowerPlant.png");
    }
    void display(int x, int y){
        smile.resize(47,74);
        image (smile, x, y);
        
    }
    
}

class WallNut{
    PImage trump; 
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

