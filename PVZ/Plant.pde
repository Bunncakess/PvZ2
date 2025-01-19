


class WallNut{//ABANDONED
    PImage trump; 
    int hp;

    WallNut(){
        trump = loadImage("WallNut.png");
        hp = 100;
    }

    void display(int x, int y){
        trump.resize(47,74);
        image (trump, x, y);
        
    }

    void takeDamage(int damage) {
        hp -= damage;
        if (hp <= 0) {
            // Handle destruction of the WallNut (e.g., remove from grid)
            println("WallNut destroyed!");
        }
    }
}
class Sunflower{ //ABANDONED
    PImage smile; 
    int hp;


    Sunflower(){
        smile = loadImage("SunflowerPlant.png");
        hp = 25; //HP FOR SUN
    }
    void display(int x, int y){
        smile.resize(47,74);
        image (smile, x, y);
        
    }

    void takeDamage(int damage) {
        hp -= damage;
        if (hp <= 0) {
            // Handle destruction of the sunflower (e.g., remove from grid)
            println("Sunflower destroyed!");
        }
    }
}

class PeaShooter {
    PImage doja;
    ArrayList<PeaBall> peaBalls;
    int shootFrequency = 120;
    int hp;

    PeaShooter() {
        doja = loadImage("peashooter.png");
        doja.resize(47, 74);
        peaBalls = new ArrayList<>();
        hp = 50;
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

    void takeDamage(int damage) {
        hp -= damage;
        if (hp <= 0) {
            // Handle destruction of the PeaShooter (e.g., remove from grid)
            println("PeaShooter destroyed!");
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
    for (int i = zGroup.size() - 1; i >= 0; i--) {
        Zombie zom = zGroup.get(i);
        if (zom.isHit(this)) { 
            zom.takeDamage(pDMG); 
            shooter.peaBalls.remove(this); 
            break; 
        }
    }
}
    void display() {
        image(burret, posX, posY);
    }
}

class Sun {
    float x, y;          // Position of the sun
    float speed;         // Falling speed
    boolean collected;   // To track if the sun is collected
    PImage sunImage;     // Image of the sun
    int[] lanes = {105, 190, 275, 360, 445}; // positions for Y level
    int tall = lanes[int(random(lanes.length))];
    float spawnTime;
    float duration = 7500; ///every 1000 is 1 sec; the lifespan of the sun
    int value = 2; //SUN VALUE
    int time_counter = 0;


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

        if (y == tall) {
            time_counter++;
            if(time_counter == 350){
            collected = true; // Mark the sun as collected after 5 seconds
            }
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