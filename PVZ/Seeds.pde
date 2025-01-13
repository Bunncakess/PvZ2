PImage seed;

class Seeds {
    String seed_name;
    int xPos = 20; // X position of seeds
    int yPos;      // Y position of the seed

    public Seeds(String temp_seed_name, int positionIndex) {
        seed_name = temp_seed_name;
        yPos = 20 * positionIndex; // Dynamic vertical positioning
    }

    void displaySeed() {
        if (seed_name.equals("sunflower_seed")) {
            seed = loadImage("sunflower_icon.png");
        } else if (seed_name.equals("peashooter_seed")) {
            seed = loadImage("peashooter_icon.png");
        } else {
            seed = loadImage("walnut_icon.png");
        }
        image(seed, xPos, yPos);
    }

    boolean isMouseOver() {
        return mouseX > xPos && mouseX < xPos + 24 && mouseY > yPos && mouseY < yPos + 32;
    }
    

    void onClick() {
        if (isMouseOver()) {
            println(seed_name + " clicked!");
        }
    }
}

  

