class Movement {
  Player p;
  float speed = 4;
  float yVel = 0;
  boolean onGround = true;
  
  Movement(Player p) {
    this.p = p;
  }
  
  void update() {
    // PLAYER 1
    //Movement keybinds for Player 1
    if (p.isP1) {
      if (keys['a']) p.pos.x -= speed;
      if (keys['d']) p.pos.x += speed;
      
      if (keys['w'] && onGround) {
        yVel = -10;
        onGround = false;
      }
      
      if (keys['s']) p.pos.y += 2;
    }
    // PLAYER 2
    // Movement keybinds for Player 2
    else {
      if (keyPressed && keyCode == LEFT) p.pos.x -= speed;
      if (keyPressed && keyCode == RIGHT) p.pos.x += speed;
      
      if (keyPressed && keyCode == UP && onGround) {
        yVel = -10;
        onGround = false;
      }
      
      if (keyPressed && keyCode == DOWN) p.pos.y += 2;
    }
    
    // Gravity
    p.pos.y += yVel;
    yVel += 0.5;
    
    if (p.pos.y >= height-100) {
      p.pos.y = height-100;
      yVel = 0;
      onGround = true;
    }
    // Screen collision
    p.pos.x = clamp(p.pos.x, 0, width - 40);
  }
}
