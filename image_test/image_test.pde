PImage back;

void setup(){
     size(800, 980);
     back = loadImage("Background1.jpg");
     
}

void draw(){
    background(0);
    image(back, 0,0);
}
