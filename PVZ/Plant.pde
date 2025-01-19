

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

class PeaShooter {
    PImage doja;
    ArrayList<PeaBall> peaBalls;
    int shootFrequency = 120;  // Adjust the frequency as needed
    int lastShootTime = 0;     // Store the time when it last shot
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
        if (frameCount % 300 == 0){
            peaBalls.add(new PeaBall(x, y));  // Add a new PeaBall to the list
        }

    }

    void update(int currentFrame) {
        // Peashooter update logic (e.g., shooting, animation, etc.)
        if (currentFrame - lastShootTime >= shootFrequency) {
            lastShootTime = currentFrame;  // Update last shoot time
            shoot(0, 0);  // Call shoot to create a new PeaBall
        }

        for (int i = peaBalls.size() - 1; i >= 0; i--) {
            PeaBall pea = peaBalls.get(i);
            pea.update();
            pea.display();

            if (pea.posX > width) { 
                peaBalls.remove(i);  // Remove PeaBall if it goes out of bounds
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