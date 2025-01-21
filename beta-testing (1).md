# Capstone Project Beta Testing
## Project Name: P(eashooter) vs Zombies
## Group Members: Artur, Kenji, Richmond

## External Programmer Feedback (Name: Willium ) 
### Programs/Issues that occurred while testing:
- Can remove plants without selecting on the shovel.
- Can't place any other plant except the peashooter.
- zombies cant eat the plants currently.


### What is your general thoughts and feedback about the program?
I think that the prohext made by my fellow comrades was very well thought out and executed with close to 800 lines of code. It performs very well. 

### Coding Team - What we did in response to this feedback?
-  We tried to implement a system in the shovel as the only source of tool to remove plants off the grid, but we did not have enough time to do so. Instead, if they click on a plant again after beng planted, it will be remove off the grid. 
- We tried to implement other plant types, but putting them in the array and corresponding their placement and behavior on the grid was too diffcult for us. Instead, we just oppted for peashooter.
- We tried implementing zombie stopping to eat after collidnig with a plant, but we did not have enough time. Instead, we implemented it via pausing the game.

-------------------------------------
## Coding Team - Known Bugs, Glitches, Issues
- Zombie Passes through the plant, not stopping to eat like the original game.
- You can't place a plant beyond the 5 or 6 COLUMN.
- You can delete plants without selecting shovel.
- Restarting Game does not clear plants off the grid.