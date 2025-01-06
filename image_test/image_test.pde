PImage back;

void setup(){
     size(1200, 514);
     back = loadImage("Background1.png");
     
}

void draw(){
    image(back, 0, 0);
}
