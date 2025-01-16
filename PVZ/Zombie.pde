
class Zombie {
    PImage zombieIMG;
    int ztype; // 1 = normal 2 = cone 3 = bucket
    int endgoal = 190;
    int hp; // hp for each type.
    float moveX = 0.2; // speed 12
    float posX = width;  // pos x = width
    int[] ZombieLanes = {25, 105, 190, 275, 360}; // positions for Y level
    int RandomLane;
    boolean end = false;

    Zombie() {
        ztype = (int) random(1, 4);
        if (ztype == 1) {
            zombieIMG = loadImage("Zombie1.png");
            hp = 100;
        } else if (ztype == 2) {
            zombieIMG = loadImage("Zombie2.png");
            hp = 125;
        } else {
            zombieIMG = loadImage("Zombie3.png");
            hp = 150;
        }

        RandomLane = ZombieLanes[int(random(ZombieLanes.length))]; // randomize lanes
    }

    void update() {
        if (posX > endgoal) {
            posX -= moveX;
        } 
        else {
            end = true;
        }
    }

    void display() {
        String endcredit = "Zombies have reached the end. You lost. \nPress \"1\" to retry or Press \"2\" to quit";
        textSize(30);
        fill(0);
        textAlign(CENTER);

        if (!end) { // Normal gameplay
            image(zombieIMG, posX, RandomLane);
        }

        if (end) { // End scene
            text(endcredit, width / 2, height / 2);
            if (keyPressed) {
                if (key == '1') {
                    resetGame();
                } 
                else if (key == '2') {
                    exit();
                }
                
            }
        }
    }

    void resetGame() {
        end = false;
        posX = 875;
        RandomLane = ZombieLanes[int(random(ZombieLanes.length))];
    }


    void takeDamage(int damage){
        hp -= damage;
    }

    boolean isDead(){
        return hp <= 0;
    }

    boolean isHit(PeaBall pea){
        return (pea.posX > posX && pea.posX < posX + zombieIMG.width && pea.posY > RandomLane && pea.posY < RandomLane + zombieIMG.height);
    
    
    }

}