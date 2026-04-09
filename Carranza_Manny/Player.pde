class Player {
  Movement movement;
  Combat combat;
  Health health;
  Block block;
  
  float x, y;
  color c;
  boolean isP1;
  
  Player(float x, float y, color c, boolean isP1) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.isP1 = isP1;
    
    movement = new Movement(this);
    combat = new Combat(this);
    health = new Health();
    block = new Block(this);
  }
  
  void update() {
    movement.update();
    block.update();
    combat.update();
  }
  
  void display() {
    // Placeholder for now until I add sprites
    if (block.blocking) fill(0, 255, 255);
    else fill(c);
    
    rect(x, y, 40, 80);
  }
}
