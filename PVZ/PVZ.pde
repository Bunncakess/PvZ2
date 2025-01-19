//Arrays
ArrayList<Zombie> zGroup = new ArrayList<Zombie>();
ArrayList<Sun> suns = new ArrayList<Sun>();

//Class Declarations
Seeds seed_sunflower, seed_peashooter, seed_walnut;
Zombie zomzom;
Sunflower flower;
WallNut wall;
PeaShooter shooter;
Shovel shovel;
grid g;
int loadingStartTime = 0;
boolean isLoading = true; // Variable to track the loading screen state
////////ADJUSTING VARIABLES//////////

//Zombies Variables
int zomLimit = 6; //How many zombies can appear in the screen 
int zomCount = 0; //Counter for how many zombies have been killed
int zomKills = 5; //Need about this many zombie kills to win the game
int zomFrequency = 300; //The timer for when Zombies generate. Every 60 = 1 second
    
//Background Sun Variables
int sunCount = 0; //Counter for how many Suns the player has held.
int sunFrequency = 300; //The timer for when suns generate. Every 60 = 1 second
int sunHold = 10; //Threshold for how many Suns the player can hold.

//PeaBall Variable
int pDMG = 20; //The Peaball's DMG to the Zombie's HP.

PImage back; //Background Image

void setup(){
     size(900, 514);
     g = new grid(9, 5);
     back = loadImage("Background1.png");
    loadingStartTime = millis();

     zomzom = new Zombie(); // Zombie Class
     shooter = new PeaShooter(); // PeaShooter Class
     flower = new Sunflower(); // Sunflower Class
     wall = new WallNut(); // WallNut Class
     shovel = new Shovel(); //Shovel Class


     seed_sunflower = new Seeds("sunflower_seed", 1); // Sunflower Icon
     seed_peashooter = new Seeds("peashooter_seed", 3); // PeaShooter Icon
     seed_walnut = new Seeds("walnut_seed", 5); //Wallnut Icon
}

void draw() {


    if (isLoading) {
        // Display the loading screen
        background(0); // Set background to black
        fill(255); // Set text color to white
        textSize(40);
        textAlign(CENTER, CENTER);
        text("Loading... Please Wait", width / 2, height / 2);
        
        if (millis() - loadingStartTime >= 4000) {
      isLoading = false;  // Stop the loading screen after 2 seconds
    }
    }
    else{
    image(back, 0, 0);
    g.displayGrid();
    shooter.update();
    sunCounter();
    generateSun();
    seed_sunflower.displaySeed();
    seed_peashooter.displaySeed();
    seed_walnut.displaySeed();
    shovel.displayShovel();
    displayPeashooterCost();
    displaySunflowerCost();
    displayWalnutCost();
    
    for (int i = suns.size() - 1; i >= 0; i--) {
        Sun sun = suns.get(i);
        sun.update();
        sun.display();
        if (sun.collected) {
            suns.remove(i);
        }
    }

    if (zGroup.size() < zomLimit) { 
        if(frameCount % zomFrequency == 0){ 
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
    }}

}

/////////////////////METHODS////////////////////

void generateSun() { //Generate background Sun periodically.
    float randomX = random(230, width - 100);
    if (frameCount % sunFrequency == 0){
        suns.add(new Sun(randomX, 0)); 
    }
}

void sunCounter(){ //A counter for how many suns the player collected.
    textSize(40);
    fill(0);
    textAlign(LEFT);
    text("Suns: " + sunCount, 20, height - 20); 
}

boolean isGameOver() { //Checks if the game is over when zombies have reached the house.
    for (Zombie zom : zGroup) {
        if (zom.end) {
            return true;
        }
    }
    return false;
}


boolean isGameWinning(){ //Checks if the game is over when the player killed enough zombies.
    if(zomCount >= zomKills){
        return true;
    }
    return false;
}

void WinningCredit(){ //Displays the Winning Credits to the player if they killed enough.
    String PlayerWins = "You have killed enough zombies to last you a few days\nGood Job!";
    textSize(30);
    fill(0);
    textAlign(CENTER);
    text(PlayerWins, width / 2, height / 2);
}

void EndCredit() { //Displays the Losing Credits to the Player if the Zombies reached the House before they killed enough zombies.
    String ZombieWins = "Zombies have reached the end. You lost. \nPress \"R\" to restart or Press \"Q\" to end the game.";
    textSize(30);
    fill(0);
    textAlign(CENTER);
    text(ZombieWins, width / 2, height / 2);
}

void displayPeashooterCost() {
    fill(255, 255, 0); // Yellow color for the Sun cost display
    textSize(20);
    textAlign(LEFT);
    text("Peashooter: 3 Suns", 20, height - 85);
}

void displayWalnutCost() {
    fill(255, 255, 0); // Yellow color for the Sun cost display
    textSize(20);
    textAlign(LEFT);
    text("Walnut: 5 Suns", 20, height - 60);
}

void displaySunflowerCost() {
    fill(255, 255, 0); // Yellow color for the Sun cost display
    textSize(20);
    textAlign(LEFT);
    text("Sunflower: 2 Suns", 20, height - 110);
}

void restartGame() { //Reinitialized all counters/values when the game is lost or won.
    zGroup.clear();   
    suns.clear();   
    zomCount = 0;   
    loop();         
}

void keyPressed(){ //The option for the player to choose to restart or quit the game.
    if (key == 'r' || key == 'R') { // Restart the game.
        restartGame();
    } 
    
    else if (key == 'q' || key == 'Q') { // Quit the game.
        exit();
    }
    if (isLoading) {
        isLoading = false; // Set to false to start the game after the loading screen
    }
}

void mousePressed(){
    g.click(mouseX, mouseY);
    seed_sunflower.onClick(sunCount); 
    seed_peashooter.onClick(sunCount);
    seed_walnut.onClick(sunCount);
    shovel.onClick();

    for (Sun sun : suns) {
        sun.collect();
        if (sun.collected && sunCount < sunHold){ //limit sun hold
            sunCount += sun.value;
            if (sun.collected && sunCount > sunHold){ /// if over limit set to limit
            sunCount = sunHold;
            }

        }
        
    }
    // Remove plants if shovel is selected and clicked on a grid
    if (shovel.isSelected()) {
        g.removePlant(mouseX, mouseY); // Add a method in grid class to handle plant removal
        shovel.selected = false; // Deselect shovel after use
    }
}




class grid {
    int ROWS, COLS;
    int time_counter = 0;
    
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
              stroke(0,0,0,0);

              }
              else if (gridarray[y][x] == true){
                shooter.display((y*70)+220, (x*85)+70);
                if(time_counter%100 == 0){
                    shooter.shoot((y*70)+240, (x*85)+80);
                }
                    time_counter++;

                stroke(0,0,0,0);
                fill(0,0,0,0);
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


        if (gridarray[x][y]== false && !(seed_sunflower.onClick(sunCount))){
        if (gridarray[x][y]== false){
            gridarray[x][y] = true;
        }
        else if  (gridarray[x][y]== true) {
            gridarray[x][y] = false;
        }
        }
    }
    }
    void removePlant(int mx, int my) { //ABANDONED
        if (mx > 220 && mx < 850 && my > 70 && my < 495) { 
            int x = (mx - 220) / 70;
            int y = (my - 70) / 85;

            if (gridarray[x][y]) { // If a plant exists in this grid cell
                gridarray[x][y] = false; // Remove the plant
                println("Plant removed at grid: (" + x + ", " + y + ")");
                shovel.selected = false; // Deselect shovel after removing the plant
            }
        }
    }
}