class Shovel {
    int xPos = 20;  
    int yPos = 200; 
    boolean selected = false; 
    PImage shovelImage;

    Shovel() {
        shovelImage = loadImage("shovel.png"); // Load the shovel image
        shovelImage.resize(48, 60);
    }

    void displayShovel() {
        // Highlight the shovel if selected
        if (selected) {
            fill(255, 255, 0, 100); // Yellow highlight
            rect(xPos, yPos, 48, 62);
            noFill();
        }

        image(shovelImage, xPos, yPos);
    }

    boolean isMouseOver() {
        return mouseX > xPos && mouseX < xPos + 48 && mouseY > yPos && mouseY < yPos + 62;
    }

    void onClick() {
        if (isMouseOver() && mousePressed) {
            selected = true;
            println("Shovel selected: " + selected);
        }
        else{
            selected = false;
            println("Shovel selected: " + selected);
        }
    }

    boolean isSelected() {
        return selected;
    }
}