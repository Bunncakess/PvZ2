PImage nzombie;

class Zombie {
    int ztype; // 1 = normal 2 = cone 3 = bucket
    int endgoal = 190;
    float moveX = 0.2; // speed 12
    float posX = 220; // position for X level; 875
    int[] ZombieLanes = {25, 105, 190, 275, 360}; // positions for Y level
    int RandomLane;
    boolean end = false;
    boolean keyPressedOnce = false;

    // Constructor
    
    Zombie() {
        ztype = (int) random(1, 4);
        if (ztype == 1) {
            nzombie = loadImage("Zombie1.png");
        } 
        else if (ztype == 2) {
            nzombie = loadImage("Zombie2.png");
        } 
        else {
            nzombie = loadImage("Zombie3.png");
        }

        RandomLane = ZombieLanes[int(random(ZombieLanes.length))]; // randomize lanes
    }

    void update() {
        if (posX > endgoal) {
            //delay(1000);
            posX -= moveX;
        } 
        else {
            //delay(2000);
            end = true;
        }
    }

    void display() {
        String endcredit = "Zombies have reached the end. You lost. \nPress \"1\" to retry or Press \"2\" to quit";
        textSize(30);
        fill(0);
        textAlign(CENTER);

        if (!end) { // Normal gameplay
            image(nzombie, posX, RandomLane);
        }

        if (end) { // End scene
            text(endcredit, width / 2, height / 2);
            if (keyPressed && !keyPressedOnce) {
                if (key == '1') {
                    resetGame();
                } 
                else if (key == '2') {
                    exit();
                }
                keyPressedOnce = true;
            }
        }
    }

    void resetGame() {
        end = false;
        posX = 875;
        RandomLane = ZombieLanes[int(random(ZombieLanes.length))];
    }

    void keyReleased() {
        keyPressedOnce = false; // Reset the flag when the key is released
    }

    // void ifhit(){
    //     boolean hit = false;
    //     if (!hit){
    //         cotinue game;
    //     }
    //     else{
    //         remove zombie from array
    //     }
    // }

    // void numberedzombie(){
    //     for (zombie that is down in lane 1 must be removed from the array not lane2 zombie who is full hp)
    // }
}