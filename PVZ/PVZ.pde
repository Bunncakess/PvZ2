ArrayList<Zombie> zGroup = new ArrayList<Zombie>();
Zombie zomzom;
Seeds seed_sunflower, seed_peashooter, seed_walnut;
Sunflower tower;
PImage back;
grid g;
void setup(){
     size(900, 514);
     g = new grid(9, 5);
     back = loadImage("Background1.png");
     zomzom = new Zombie();


     seed_sunflower = new Seeds("sunflower_seed", 1);
     seed_peashooter = new Seeds("peashooter_seed", 3);
     seed_walnut = new Seeds("walnut_seed", 5);

     tower = new Sunflower();
}

void draw() {
    image(back, 0, 0);
    g.displayGrid();


    seed_sunflower.displaySeed();
    seed_peashooter.displaySeed();
    seed_walnut.displaySeed();
    


    if (zGroup.size() < 7) { /// ZOM LIMIT
        zGroup.add(new Zombie());
    }


    for (Zombie zom : zGroup) {
        zom.display();
        zom.update();
    }
}

void mousePressed(){
    g.click(mouseX, mouseY);
    seed_sunflower.onClick(); 
    seed_peashooter.onClick();
    seed_walnut.onClick();
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

        if (gridarray[x][y]== false){
            gridarray[x][y] = true;
        }
        else if  (gridarray[x][y]== true) {
            gridarray[x][y] = false;
        }
        }
    }
  
}