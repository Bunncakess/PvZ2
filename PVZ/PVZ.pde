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

////////ADJUSTING VARIABLES//////////

//Zombies Variables
int zomLimit = 6; //How many zombies can appear in the screen 
int zomCount = 0; //Counter for how many zombies have been killed
int zomKills = 5; //Need about this many zombie kills to win the game
int zomFrequency = 300; //The timer for when Zombies generate. Every 60 = 1 second


int loadingStartTime = 0;
boolean isLoading = true;
boolean isPaused = false; 

//Background Sun Variables
int sunCount = 0; //Counter for how many Suns the player has held.
int sunFrequency = 300; //The timer for when suns generate. Every 60 = 1 second
int sunHold = 10; //Threshold for how many Suns the player can hold.

//PeaBall Variable
int pDMG = 20; //The Peaball's DMG to the Zombie's HP.

PImage back; //Background Image
int currentFrame = frameCount;

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
    // Display loading screen
    background(0);
    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Loading...", width / 2, height / 2);
    
    // Check if 2 seconds have passed
    if (millis() - loadingStartTime >= 2000) {
      isLoading = false;  // Stop the loading screen after 2 seconds
    }
  } 
  else if (isPaused) {
        // Display "Paused" message
        fill(0, 0, 0, 30); // Semi-transparent overlay
        rect(0, 0, width, height);
        textSize(50);
        fill(255);
        textAlign(CENTER, CENTER);
        text("Paused", width / 2, height / 2);
        return; // Skip the rest of the draw loop while paused
    }
  
  else {
    image(back, 0, 0);
    g.displayGrid();
    shooter.update(currentFrame);
    sunCounter();
    generateSun();
    seed_sunflower.displaySeed();
    seed_peashooter.displaySeed();
    seed_walnut.displaySeed();
    shovel.displayShovel();
    displayPeashooterCost();
    displaySunflowerCost();
    displayWalnutCost();
    


    for (int y = 0; y < g.ROWS; y++) {
        for (int x = 0; x < g.COLS; x++) {
            if (g.gridarray[y][x] && g.peashooters[y][x] != null) {
                g.peashooters[y][x].update(currentFrame);
            }
        }
    }

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


    for (int i = zGroup.size() - 1; i >= 0; i--) {
        Zombie zom = zGroup.get(i);
        zom.display();
        zom.update();

        // Check each PeaShooter's peaBalls for collision
        for (int y = 0; y < g.ROWS; y++) {
            for (int x = 0; x < g.COLS; x++) {
                if (g.peashooters[y][x] != null) {
                    ArrayList<PeaBall> balls = g.peashooters[y][x].peaBalls;

                    for (int j = balls.size() - 1; j >= 0; j--) {
                        PeaBall pea = balls.get(j);

                        if (zom.isHit(pea)) {
                            zom.takeDamage(pDMG);
                            balls.remove(j); // Remove the PeaBall after hitting a zombie
                        }
                    }
                }
            }
        }

    if (zom.isDead()) {
        zGroup.remove(i);
        zomCount++;
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
if (key == 'p' || key == 'P') {
        isPaused = !isPaused; // Toggle the pause state
}
    if (key == 'r' || key == 'R') { // Restart the game.
        restartGame();
    } 
    
    else if (key == 'q' || key == 'Q') { // Quit the game.
        exit();
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
    // if (shovel.isSelected()) {
    //     g.removePlant(mouseX, mouseY); // Add a method in grid class to handle plant removal
    //     shovel.selected = false; // Deselect shovel after use
    // }
}




class grid {
    int ROWS, COLS;
    PeaShooter[][] peashooters; // Array to hold Peashooter objects
    boolean[][] gridarray;      // Grid to track where plants are placed

    // Constructor
    grid(int tempr, int tempc) {
        ROWS = tempr;
        COLS = tempc;
        gridarray = new boolean[ROWS][COLS];
        peashooters = new PeaShooter[ROWS][COLS]; // Initialize Peashooter array
        
        for (int y = 0; y < ROWS; y++) {
            for (int x = 0; x < COLS; x++) {
                gridarray[y][x] = false; // No plants by default
                peashooters[y][x] = null; // No Peashooters initially
            }
        }
    }

    // Display the grid and Peashooters
    void displayGrid() {
        int xcor = 220;
        int ycor = 70;
        
        for (int y = 0; y < ROWS; y++) {
            for (int x = 0; x < COLS; x++) {
                // Check bounds before using x and y indices
                if (y < ROWS && x < COLS) {
                    if (gridarray[y][x] && peashooters[y][x] != null) {
                        // Display Peashooter and make it shoot
                        peashooters[y][x].display((x * 70) + 220, (y * 85) + 70); // Display Peashooter
                        peashooters[y][x].shoot((x * 70) + 240, (y * 85) + 80); // Peashooter shooting
                    }
                }

                // Make the grid cells transparent
                noFill(); // Ensures no background color for the grid cell
                stroke(0, 0, 0, 0); // No stroke (grid lines) - to make them transparent
                rect(xcor, ycor, 70, 85); // Draw an empty transparent grid cell

                ycor += 85; // Adjust vertical position for the next row
            }

            xcor += 70; 
            ycor = 70; 
        }
    }

    // Handle mouse click for placing/removing plants
    void click(int mx, int my) {
        if (mx > 220 && mx < 850 && my > 70 && my < 495) { 
            int x = (mx - 220) / 70;  // Get the x index in the grid
            int y = (my - 70) / 85;   // Get the y index in the grid

            // Ensure the indices are within bounds
            if (x >= 0 && x < COLS && y >= 0 && y < ROWS) {
                // Only place Peashooter if selected and enough Suns
                if (gridarray[y][x] == false && seed_peashooter.selected) {
                    println("Checking suns: " + sunCount + " (needs 3)");
                    if (sunCount >= 3) {
                        gridarray[y][x] = true;  // Place the Peashooter in the grid
                        sunCount -= 3;           // Deduct 3 Suns
                        sunCount = max(sunCount, 0);  // Ensure Sun count doesn't go below 0
                        peashooters[y][x] = new PeaShooter(); // Create a new Peashooter
                        println("Peashooter planted! Suns remaining: " + sunCount);
                    } else {
                        println("Not enough Suns to plant Peashooter!");
                    }
                } else if (gridarray[y][x] == true) {
                    // If there's already a Peashooter, remove it
                    gridarray[y][x] = false;
                    peashooters[y][x] = null; // Remove the Peashooter from the grid
                    println("Peashooter removed!");
                }
            }
        }
    }
}