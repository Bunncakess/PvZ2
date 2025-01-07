public class grid {
    int ROWS, COLS;
    boolean[][] gridarray;
    // constructor
    grid(int tempr, int tempc){
        ROWS = tempr;
        COLS = tempc;
        gridarray = new boolean[ROWS][COLS];
        clear();
        five();
        for (int y = 0; y < ROWS; y++){
            for (int x = 0; x < COLS; x++ ){
                gridarray[y][x] = false;
            }
        }
    }
    
    
    void displayGrid(){
      for (int y = 0; y < ROWS; y++){
        for (int x = 0; x < COLS; x++ ){
              if (gridarray[y][x] == false){
              fill(255);
              }
              else{
              fill(0);
              }
              int cellWidth = width / COLS;
              int cellHeight = height / ROWS;
  
              rect(x * cellWidth, y * cellHeight, cellWidth, cellHeight);
        }
      }
    }

    void click(int mx, int my){
        int cellWidth = width / COLS;
        int cellHeight = height / ROWS;

        int x = mx / cellWidth;
        int y = my / cellHeight;

        if (gridarray[y][x]== false){
            gridarray[y][x] = true;
        }
        else{
            gridarray[y][x] = false;
        }

    }
    
    void clear(){
      for (int y = 0; y < ROWS; y++){
        for (int x = 0; x < COLS; x++ ){
            gridarray[y][x] = false;
        }
      }
    }
    
    void five(){
      for (int y = 0; y < ROWS; y++){
        for (int x = 0; x < COLS; x++ ){
          if (y==5 || x==5){
             gridarray[y][x] = true;

          }
        }
      }
    }
}