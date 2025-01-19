PImage seed;

class Seeds { //ABANDONED
    String seed_name;
    int xPos = 20; // X position of seeds
    int yPos;      // Y position of the seed
    boolean selected = false; // Tracks if the seed is selected
    
    Seeds(String temp_seed_name, int positionIndex) {
        seed_name = temp_seed_name;
        yPos = 30 * positionIndex; // Dynamic vertical positioning
    }

    void displaySeed() {
        if (seed_name.equals("sunflower_seed")) {
            seed = loadImage("sunflower_icon.png");
            seed.resize(48, 60);
        } 
        else if (seed_name.equals("peashooter_seed")) {
            seed = loadImage("peashooter_icon.png");
            seed.resize(48, 60);
        } 
        else {
            seed = loadImage("walnut_icon.png");
            seed.resize(48, 60);
        }

        // Highlight seed if selected
        if (selected) {
            fill(255, 255, 0, 100); // Yellow highlight
            rect(xPos, yPos, 48, 62);
            noFill();
        }

        image(seed, xPos, yPos);
    }

    boolean isMouseOver() {
        return mouseX > xPos && mouseX < xPos + 48 && mouseY > yPos && mouseY < yPos + 62;
    }

    boolean onClick(int sunCount) { // Pass current Sun count as a parameter
        if (isMouseOver()) {
            selected = true; // Mark this seed as selected
            println(seed_name + " selected!");

            if (seed_name.equals("peashooter_seed") && sunCount >= 2) {
                // If Peashooter is selected and player has enough Suns
                sunCount -= 2; // Deduct 2 Suns
                println("Peashooter planted! Suns remaining: " + sunCount);
                return true; // Indicate successful planting
            } 
            else if (seed_name.equals("peashooter_seed")) {
                println("Not enough Suns to plant Peashooter!");
                return false; // Indicate failure to plant
            }
        } else {
            selected = false; // Deselect if clicked elsewhere
            println(seed_name + " deselected.");
        }
        return false;
    }
}