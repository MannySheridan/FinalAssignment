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
  PImage current = idle; //If nothing is happening, keep the idle sprite
  
  if (p.block.blocking) {
    current = block; //If blocking, show block sprite
  }
  else if (!p.movement.onGround) {
    current = jump; // If jumping, show jump sprite
  }
  else if (isCrouching()) {
    current = crouch; //If crouching, show crouch sprite
  }
  else if (p.combat.attacking) {
    if (p.combat.damage == 1) current = light;
    else if (p.combat.damage == 2) current = medium;
    else if (p.combat.damage == 3) current = heavy; //If attack, show Light, Medium, and Heavy depending on keybinds
  }
  else if (isMoving()) {
    current = run; //If moving, show run sprite
  }
  
  if (p.facingRight) {
    image(current, p.pos.x, p.pos.y, 40, 80); //Draws the sprites normally at the player position
  } 
  else {
    // Flips the sprite
    translate(p.pos.x + 40, p.pos.y);
    scale(-1, 1);
    
    image(current, 0, 0, 40, 80);
    
    scale(-1, 1);
    translate(-(p.pos.x + 40), -p.pos.y); //This undoes the flip and translation
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
