PImage back;

void setup(){
     size(900, 514);
     back = loadImage("Background1.png");
     
}

void draw(){
    int x = 220;
    int y = 70;
    image(back, 0, 0);
    for (int i = 0; i < 9; i++) {
    // Begin loop for rows
        for (int j = 0; j < 6; j++) {

        // Scaling up to draw a rectangle at (x,y)
        fill(0);
        stroke(225);
        // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
        rect(x, y, 70, 70);
        y = y + 70;
        }
        x = x+ 70;
        y = 70;
  }
}

