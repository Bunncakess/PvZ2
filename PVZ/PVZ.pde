ArrayList<Zombie> zGroup = new ArrayList<Zombie>();
ArrayList<Sun> suns = new ArrayList<Sun>();
Zombie zomzom;
Seeds seed_sunflower, seed_peashooter, seed_walnut;
Sunflower tower;
PeaShooter arrow;
WallNut spike;
PeaShooter shooter;
Sun bright;
int zomLimit = 6; //how many zombies can appear in the screen 
int zomCount;
int zomKills = 5; ///need about this many zombie kills to win the game
int pDMG = 20; ///peashooter's dmg
int zomFrequency = 60; /// Every 60 = 1 second
int sunCount = 0;
int sunFrequency = 300; /// every 60 = 1 sec
int sunHold = 10; ///how many suns the player can hold
PImage back;
grid g;

void setup(){
     size(900, 514);
     g = new grid(9, 5);
     back = loadImage("Background1.png");
     zomzom = new Zombie();
     shooter = new PeaShooter();


     seed_sunflower = new Seeds("sunflower_seed", 1);
     seed_peashooter = new Seeds("peashooter_seed", 3);
     seed_walnut = new Seeds("walnut_seed", 5);

     tower = new Sunflower();
     arrow = new PeaShooter();
     spike = new WallNut();
}

void draw() {
    image(back, 0, 0);
    g.displayGrid();
    shooter.update();

    generateSun();
    seed_sunflower.displaySeed();
    seed_peashooter.displaySeed();
    seed_walnut.displaySeed();
    
    for (int i = suns.size() - 1; i >= 0; i--) {
        Sun sun = suns.get(i);
        sun.update();
        sun.display();
        if (sun.collected) {
            suns.remove(i); // Remove collected suns
        }
    }

    sunCounter();

    if (zGroup.size() < zomLimit) { 
        if(frameCount % zomFrequency == 0){ ///every 60 = 1 MUYST CHANGE
            zGroup.add(new Zombie());
        }
    }


    for (int i = zGroup.size() - 1; i >= 0; i--){
        Zombie zom = zGroup.get(i);
        zom.display();
        zom.update();


        for(int j = shooter.peaBalls.size() - 1; j >= 0; j--){
            PeaBall pea = shooter.peaBalls.get(j);

            if (zom.isHit(pea)){
                zom.takeDamage(pDMG);
                shooter.peaBalls.remove(j);
            }

            if (zom.isDead()){
                zGroup.remove(i);
                zomCount++;
            }
            break;
        }
    }
    if (isGameOver()) {
        EndCredit();
        suns.clear();
        zGroup.clear();
        noLoop();
    }

    if (isGameWinning()){ 
        WinningCredit();
        suns.clear();
        zGroup.clear();
        noLoop();
    }
}


boolean isGameOver() {
    for (Zombie zom : zGroup) {
        if (zom.end) {
            return true;
        }
    }
    return false;
}


boolean isGameWinning(){
    if(zomCount >= zomKills){
        return true;
    }
    return false;
}

void WinningCredit(){
    String PlayerWins = "You have killed enough zombies to last you a few days\nGood Job!";
    textSize(30);
    fill(0);
    textAlign(CENTER);
    text(PlayerWins, width / 2, height / 2);
}

void EndCredit() {
    String ZombieWins = "Zombies have reached the end. You lost. \nPress \"R\" to restart or Press \"Q\" to end the game.";
    textSize(30);
    fill(0);
    textAlign(CENTER);
    text(ZombieWins, width / 2, height / 2);
}

void restartGame() {
    zGroup.clear();   ////REINTIALIZED ALL VALUES/COOUNTERS
    suns.clear();   
    zomCount = 0;   
    loop();         
}

void keyPressed(){
    if (key == 'r' || key == 'R') { // Restart the game.
        restartGame();
    } 
    
    else if (key == 'q' || key == 'Q') { // Quit the game.
        exit();
    }
}

void mousePressed(){
    shooter.shoot(mouseX, mouseY);
    g.click(mouseX, mouseY);
    seed_sunflower.onClick(); 
    seed_peashooter.onClick();
    seed_walnut.onClick();
    for (Sun sun : suns) {
        sun.collect();
        if (sun.collected && sunCount < sunHold){ ////limit sun hold
            sunCount += sun.value;
            if (sun.collected && sunCount > sunHold){ /// if over limit set to limit
            sunCount = 10;
            }
        }
    }
}

void generateSun() {
    float randomX = random(230, width - 100);
    if (frameCount % sunFrequency == 0){// Suns fall from the top every 5 seconds
        suns.add(new Sun(randomX, 0)); 
    }
}

void sunCounter(){
    textSize(40);
    fill(0);
    textAlign(LEFT);
    text("Suns: " + sunCount, 20, height - 20); 
}


class grid {
    int ROWS, COLS;
    
    boolean[][] gridarray;
    // constructor
    grid(int tempr, int tempc){
        ROWS = tempr;
        COLS = tempc;
        gridarray = new boolean[ROWS][COLS];
        for (int y = 0; y < ROWS; y++){
            for (int x = 0; x < COLS; x++ ){
                gridarray[y][x] = false;
            }
        }
    }
    
    
    void displayGrid(){
        
      int xcor = 220;
      int ycor = 70;
      for (int y = 0; y < ROWS; y++){
        for (int x = 0; x < COLS; x++ ){
              if (gridarray[y][x] == false){
              fill(0, 0, 0, 0);
              }
              else if (gridarray[y][x] == true){
            tower.display((y*70)+220, (x*85)+70);
              fill(0,0,0,0);
              
            //   if (seed_sunflower.onClick() == true /*&& seed_peashooter.onClick() == false || seed_walnut.onClick() == false */) {
            //     tower.display((y*70)+220, (x*85)+70);   
       
            //   }
            
            //   if (seed_peashooter.onClick() == true  /*&& seed_sunflower.onClick() == false || seed_walnut.onClick() == false*/){
            //     arrow.display((y*70)+220, (x*85)+70);
            //   }

            //   if (seed_walnut.onClick() == true /*&& seed_sunflower.onClick() == false || seed_peashooter.onClick() == false*/) {
            //     spike.display((y*70)+220, (x*85)+70);
            //   }

              }
  
           rect(xcor, ycor, 70, 85);
           ycor = ycor + 85;
        }
           xcor = xcor + 70;
           ycor = 70;
      }
    }

    void click(int mx, int my){
        if (mx > 220 && mx < 850 && my > 70 && my < 495){ 
        int x = (mx - 220) / 70;
        int y = (my - 70) / 85;

        if (gridarray[x][y]== false && !(seed_sunflower.onClick())){
            gridarray[x][y] = true;
        }
        else if  (gridarray[x][y]== true) {
            gridarray[x][y] = false;
        }
        }
    }


  
}