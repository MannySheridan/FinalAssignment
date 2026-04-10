class SpriteSystem {
  Player p;
  
  PImage idle, run, light, medium, heavy, jump, crouch, block;
  
  SpriteSystem(Player p) {
    this.p = p;
    
    idle = loadImage("idle.png");
    run = loadImage("run.png");
    light = loadImage("light.png");
    medium = loadImage("medium.png");
    heavy = loadImage("heavy.png");
    jump = loadImage("jump.png");
    crouch = loadImage("crouch.png");
    block = loadImage("block.png");
  }
  
  void display() {
  PImage current = idle;
  
  if (p.block.blocking) {
    current = block;
  }
  else if (!p.movement.onGround) {
    current = jump;
  }
  else if (isCrouching()) {
    current = crouch;
  }
  else if (p.combat.attacking) {
    if (p.combat.damage == 1) current = light;
    else if (p.combat.damage == 2) current = medium;
    else if (p.combat.damage == 3) current = heavy;
  }
  else if (isMoving()) {
    current = run;
  }
  
  if (p.facingRight) {
    image(current, p.pos.x, p.pos.y, 40, 80);
  } 
  else {
    // Apply flip
    translate(p.pos.x + 40, p.pos.y);
    scale(-1, 1);
    
    image(current, 0, 0, 40, 80);
    
    scale(-1, 1);
    translate(-(p.pos.x + 40), -p.pos.y);
  }
}
  
  boolean isMoving() {
    if (p.isP1) {
      return keys['a'] || keys['d'];
    } else {
      return keyPressed && (keyCode == LEFT || keyCode == RIGHT);
    }
  }
  
  boolean isCrouching() {
    if (p.isP1) return keys['s'];
    else return keyPressed && keyCode == DOWN;
  }
}
