class Player {
  Movement movement;
  Combat combat;
  Health health;
  Block block;
  Knockback knockback;
  HitCooldown hitCooldown;
  SpriteSystem sprite;
  
  PVector pos;
  PVector vel;
  PVector acc;
  
  color c;
  boolean isP1;
  boolean facingRight = true;
  
  Player(float x, float y, color c, boolean isP1) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
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
      facingRight = (p1.pos.x < p2.pos.x);
    } else {
      facingRight = (p2.pos.x < p1.pos.x);
    }
  }
}
