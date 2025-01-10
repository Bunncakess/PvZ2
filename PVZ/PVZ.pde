
Zombie1 zomzom;
PImage back;
grid g;
void setup(){
     size(900, 514);
     g = new grid(9, 5);
     back = loadImage("Background1.png");

     zomzom = new Zombie1();

}

void draw(){
    image(back, 0, 0);
    g.displayGrid();

    //zomzom.display();

  }

void mousePressed(){
    g.click(mouseX, mouseY);
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
              fill(0, 0,0);
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