PImage seed;

class Seeds {
    String seed_name;
    int xPos = 20; // X position of seeds
    int yPos;      // Y position of the seed

    public Seeds(String temp_seed_name, int positionIndex) {
        seed_name = temp_seed_name;
        yPos = 30 * positionIndex; // Dynamic vertical positioning
    }

    void displaySeed() {
        if (seed_name.equals("sunflower_seed")) {
            seed = loadImage("sunflower_icon.png");
            seed.resize(48,60);

        } 
        
        else if (seed_name.equals("peashooter_seed")) {
            seed = loadImage("peashooter_icon.png");
            seed.resize(48,60);

        } 
        
        else {
            seed = loadImage("walnut_icon.png");
            seed.resize(48,60);

        }
        image(seed, xPos, yPos);
    }

    boolean isMouseOver() {
        return mouseX > xPos && mouseX < xPos + 48 && mouseY > yPos && mouseY < yPos + 62;
    }
    boolean selected = false;

    boolean onClick() {
        if (isMouseOver()) {
            selected = true; 
        }
        else{
            selected = false; 
        }
        return selected; 
    }

}

  

