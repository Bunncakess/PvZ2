//update
class Zombie {
    PImage zombieIMG;
    int ztype; // 1 = normal 2 = cone 3 = bucket
    int endgoal = 190;
    int hp; // hp for each type.
    float moveX = 0.2; // speed 12
    float posX = width;  // pos x = width; starting position for zombies
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
        else{
            end = true;
        }
    }

    void display() {
        image(zombieIMG, posX, RandomLane);
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

