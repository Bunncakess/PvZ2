ArrayList<Zombie> zGroup = new ArrayList<Zombie>();
Zombie zomzom;
Seeds seed_sunflower, seed_peashooter, seed_walnut;
Sunflower tower;
PeaShooter arrow;
WallNut spike;
PeaShooter shooter;
Sun bright; 


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
     bright = new Sun();
}

void draw() {
    image(back, 0, 0);
    g.displayGrid();
    shooter.update();


    seed_sunflower.displaySeed();
    seed_peashooter.displaySeed();
    seed_walnut.displaySeed();
    
    bright.display(200,200);

    int zomCount = 0;

    if (zGroup.size() < 6) { /// ZOM LIMIT
        if(frameCount % 1200 == 0){ ///EVERY 6 SECOSNDA 60 = 1
            zGroup.add(new Zombie());
            zomCount++;
        }
    }

    for (int i = zGroup.size() - 1; i >= 0; i--){
        Zombie zom = zGroup.get(i);
        zom.display();
        zom.update();


        for(int j = shooter.peaBalls.size() - 1; j >= 0; j--){
            PeaBall pea = shooter.peaBalls.get(j);

            if (zom.isHit(pea)){
                zom.takeDamage(20); ///dmg for pea
                shooter.peaBalls.remove(j);
            }

            if (zom.isDead()){
                zGroup.remove(i);
            }
            break;
        }
    }
}

void mousePressed(){
    shooter.shoot(mouseX, mouseY);
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
              
              if (seed_sunflower.onClick() == true /*&& seed_peashooter.onClick() == false || seed_walnut.onClick() == false */) {
                tower.display((y*70)+220, (x*85)+70);   
       
              }
            
              if (seed_peashooter.onClick() == true  /*&& seed_sunflower.onClick() == false || seed_walnut.onClick() == false*/){
                arrow.display((y*70)+220, (x*85)+70);
              }

              if (seed_walnut.onClick() == true /*&& seed_sunflower.onClick() == false || seed_peashooter.onClick() == false*/) {
                spike.display((y*70)+220, (x*85)+70);
              }

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