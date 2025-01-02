PImage back;

void setup(){
     size(500, 500);
     back = loadImage("Background1.png");
     
}

void draw(){
    background(0);
    image(back, 500, 250);
}
