Player p1, p2;
CombatSystem combatSystem;
PlayerCollision playerCollision;


boolean[] keys = new boolean[256];

void setup() {
  fullScreen();
  
  p1 = new Player(200, height-100, color(0, 0, 255), true);
  p2 = new Player(700, height-100, color(255, 0, 0), false);
  
  combatSystem = new CombatSystem();
  playerCollision = new PlayerCollision();
}

void draw() {
  background(220);
  
  p1.update();
  p2.update();
  
  playerCollision.resolve(p1, p2);
  
  combatSystem.handleHit(p1, p2);
  combatSystem.handleHit(p2, p1);
  
  p1.display();
  p2.display();
  
  p1.health.display(20, 20);
  p2.health.display(width-220, 20);
}


void keyPressed() {
  if (key < 256) keys[key] = true;
}

void keyReleased() {
  if (key < 256) keys[key] = false;
}
float clamp(float val, float min, float max) {
  return max(min, min(val, max));
}
