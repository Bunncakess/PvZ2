PImage nzombie;

class Zombie{
    int ztype; // 1 = normal 2 = cone  3 = bucket
    int endgoal = 190;
    int moveX = 34; // speed 12;
    int posX = 875; //position for X level; 875
    int [] ZombieLanes = {25, 105, 190, 275, 360}; //positions for Y level
    int RandomLane = ZombieLanes[int(random(ZombieLanes.length))]; //randomize lanes
    boolean end = false;
    boolean keyPressedOnce = false;

    void Zombie(int i){
         
        if (i == 1){
            nzombie = loadImage("Zombie1.png");
        }
        else if (i == 2){
            nzombie = loadImage("Zombie2.png"); 
        }
        else{
            nzombie = loadImage("Zombie3.png"); 
        }

    }

    void update() {
        if (posX > endgoal) {     
            delay(1000);      
            posX -= moveX;
        }
        else{
            delay(2000);
            end = true;
        }
    }
    
    void display(){
        String endcredit = "Zombies have reached the end. You lost. \nHold \"1\" to retry or Hold \"2\" to quit "  ;
        textSize(30);
        fill(0);
        textAlign(CENTER); ////////texts

        if (!end){ ///normal gameplay
            image(nzombie, posX, RandomLane);
        }

        if (end){ ///END SCENE
            text(endcredit, width/2, height/2);
           /////////////////NEEDS FIXING NOT COSISTENT////////////////////
           if (keyPressed && !keyPressedOnce){
            if(key == '1'){
                resetGame();
            }                               
            else if (key == '2'){
                exit();
            }
            keyPressedOnce = true;
           }
        }
        
    }

    void resetGame(){
        end = false;
        posX = 875;
        RandomLane = ZombieLanes[int(random(ZombieLanes.length))];
    }
    
    void keyReleased() {
        keyPressedOnce = false; // Reset the flag when the key is released
    }

}