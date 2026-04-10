class Player {
  Movement movement;
  Combat combat;
  Health health;
  Block block;
  Knockback knockback;
  HitCooldown hitCooldown;
  SpriteSystem sprite;
  
  float x, y;
  color c;
  boolean isP1;
  boolean facingRight = true;
  
  Player(float x, float y, color c, boolean isP1) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.isP1 = isP1;
    
    movement = new Movement(this);
    combat = new Combat(this);
    health = new Health();
    block = new Block(this);
    knockback = new Knockback(this);
    hitCooldown = new HitCooldown();
    sprite = new SpriteSystem(this);
  }
  
  void update() {
    movement.update();
    block.update();
    combat.update();
    knockback.update();
    hitCooldown.update();
    updateFacing();
  }
  
 void display() {
  sprite.display();
}
  
  void updateFacing() {
  if (this == p1) {
    facingRight = (p1.x < p2.x);
  } else {
    facingRight = (p2.x < p1.x);
  }
}
}
