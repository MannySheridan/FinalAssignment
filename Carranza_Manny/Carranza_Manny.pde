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
    p2.update();
    
    playerCollision.resolve(p1, p2);
    
    combatSystem.handleHit(p1, p2);
    combatSystem.handleHit(p2, p1);
    
    p1.display();
    p2.display();
    
    p1.health.display(20, 20);
    p2.health.display(width-220, 20);
    
    checkWin();
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
void keyPressed() {
  if (key < 256) keys[key] = true;
  
  // Restart game
  if (gameState == 1 && keyCode == ENTER) {
    resetGame();
  }
}
void resetGame() {
  p1 = new Player(200, height-100, color(0, 0, 255), true);
  p2 = new Player(700, height-100, color(255, 0, 0), false);
  
  gameState = 0;
} 
void keyReleased() {
  if (key < 256) keys[key] = false;
}
float clamp(float val, float min, float max) {
  return max(min, min(val, max));
}
