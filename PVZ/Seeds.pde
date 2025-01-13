PImage seed;

class Seeds{

    String seed_name;
    String temp_seed_name;
    int xPos = 20;
    int yPos = 20;

    public Seeds(String temp_seed_name){
        seed_name = temp_seed_name;
    }
    
    
    void displaySeed(){
        if (seed_name == "sunflower_seed") {
            seed = loadImage("sunflower_icon.png");
            image(seed, xPos, yPos*1);
        } else if (seed_name == "peashooter_seed") {
            seed = loadImage("peashooter_icon.png");
            image(seed, xPos, yPos*3);

        } else {
            seed = loadImage("walnut_icon.png");
            image(seed, xPos, yPos*5);

        }


    }

   /* void click(int mx, int my){
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
    }*/
  
}
