Player p1, p2;
CombatSystem combatSystem;
PlayerCollision playerCollision;


boolean[] keys = new boolean[256];
int gameState = 0; // 0 = playing, 1 = game over
String winner = "";

void setup() {
  fullScreen();
  
  p1 = new Player(200, height-100, color(0, 0, 255), true);
  p2 = new Player(700, height-100, color(255, 0, 0), false);
  
  combatSystem = new CombatSystem();
  playerCollision = new PlayerCollision();
}

void draw() { 
  background(220);
  
  if (gameState == 0) {
    
    p1.update();
    p2.update(); //Updates both players' attacks, movements, etc.
    
    playerCollision.resolve(p1, p2); //Makes sure theres no overlapping
    
    combatSystem.handleHit(p1, p2);
    combatSystem.handleHit(p2, p1); //Allows for Player 1 to hit Player 2 and vice versa. and if it happens, damage, knock, and cooldown are active
    
    p1.display();
    p2.display(); //Draws both the players
    
    p1.health.display(20, 20);
    p2.health.display(width-220, 20); //Draws the health bar for both sets of players
    
    checkWin(); //Changes the game state to 1 and switches the end screen
  }
  else if (gameState == 1) {
    displayEndScreen();
  }
}

void checkWin() {
  if (p1.health.hits >= 50) {
    winner = "PLAYER 2 WINS!";
    gameState = 1;
  }
  
  if (p2.health.hits >= 50) {
    winner = "PLAYER 1 WINS!";
    gameState = 1;
  }
}

void displayEndScreen() {
  background(0);
  
  fill(255);
  textAlign(CENTER, CENTER);
  
  textSize(40);
  text(winner, width/2, height/2 - 40);
  
  textSize(20);
  text("Press ENTER to Restart", width/2, height/2 + 20);
}
void keyPressed() { //This makes it so when the game finishes, pressing ENTER would restart the game
  if (key < 256) keys[key] = true;
  
  // Restart game
  if (gameState == 1 && keyCode == ENTER) {
    resetGame();
  }
}
void resetGame() { //Simply restarts the game to the position everything was before
  p1 = new Player(200, height-100, color(0, 0, 255), true);
  p2 = new Player(700, height-100, color(255, 0, 0), false);
  
  gameState = 0;
} 
void keyReleased() {
  if (key < 256) keys[key] = false; //Whenever any key is released, it updates the keys[] array to say that the key is not held down
}
float clamp(float val, float min, float max) {
  return max(min, min(val, max));
}
