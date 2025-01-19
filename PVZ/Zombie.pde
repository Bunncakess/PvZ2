class Zombie {
    //Array
    int[] ZombieLanes = {25, 105, 190, 275, 360}; // positions for Y level

    //Adjusting Variables
    int RandomLane; //Has the values of ZombieLanes Array in here.
    int ztype; // 1 = normal 2 = cone 3 = bucket.
    int hp; //HP variable for each zombie type.
    boolean end = false; //Checks if the zombies have reached the End.
    int zomDMG; //Zombie DMG variable for each type of zombie.
    int endgoal = 190; //The end goal for zombies AKA the house.
    float moveX; //The speed of the zombies.
    float posX = width; //The starting position of the zombies


    PImage zombieIMG; //Zombie Image Variable

    Zombie() {
        ztype = (int )random(1, 4);

        if (ztype == 1) { // Regular Zombie
            zombieIMG = loadImage("Zombie1.png");
            hp = 100;
            moveX = 0.2;
        } 
        
        else if (ztype == 2) { // Conehead Zombie
            zombieIMG = loadImage("Zombie2.png");
            hp = 125;
            moveX = 0.15; // Slower movement
        } 
        
        else { // Buckethead Zombie
            zombieIMG = loadImage("Zombie3.png");
            hp = 150;
            moveX = 0.1; // Even slower movement
        }
        RandomLane = ZombieLanes[int(random(ZombieLanes.length))]; // randomize lanes
    }

/////////METHODS/////////

    void update() { //Updates the position of the Zombie to the left.
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

    void takeDamage(int damage){ //Loses HP when it is shot by a Peaball/Peashooter.
        hp -= damage;
    }

    boolean isDead(){ //Checks if the zombie is dead.
        return hp <= 0;
    }

    boolean isHit(PeaBall pea){ //Returns true if the peaball collides with the Zombie.
        boolean horizontalCollision = (pea.posX + pea.burret.width >= posX && pea.posX <= posX + zombieIMG.width);
        boolean verticalCollision = (pea.posY + pea.burret.height >= RandomLane && pea.posY <= RandomLane + zombieIMG.height);
        
        return horizontalCollision && verticalCollision;
    }

}

